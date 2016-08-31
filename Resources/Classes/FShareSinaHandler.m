//
//  FShareSinaHandler.m
//  FShareDemo
//
//  Created by Fmyz on 16/8/23.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import "FShareSinaHandler.h"

#import "WeiboSDK.h"

@interface FShareSinaHandler () <WeiboSDKDelegate>

/**
 用户ID
 */
@property (nonatomic, strong) NSString *userID;

/**
 认证口令
 */
@property (nonatomic, strong) NSString *accessToken;

/**
 认证过期时间
 */
@property (nonatomic, strong) NSDate *expirationDate;

@end

@implementation FShareSinaHandler

- (BOOL)isAppInstalled
{
    return [WeiboSDK isWeiboAppInstalled];
}

- (void)registerApp:(NSString *)appID
{
    self.appID = appID;
    [WeiboSDK registerApp:appID];
}

- (void)authorizeWithParam:(FShareParam *)param complete:(AuthorizeComplete)complete
{
    FShareSinaOAuthParam *sinaParam = nil;
    if (![param isKindOfClass:[FShareSinaOAuthParam class]]) {
        return;
    }
    
    self.authorizeComplete = complete;
    sinaParam = (FShareSinaOAuthParam *)param;
    
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = sinaParam.redirectURI;
    request.scope = sinaParam.scope;
    request.userInfo = sinaParam.userInfo;
    [WeiboSDK sendRequest:request];
}

- (void)shareWithParam:(FShareRequestParam *)param
{
    NSData *preImageData;
    if (param.imageData) {
        preImageData = param.imageData;
    }else if (param.thumbImage){
        preImageData = UIImageJPEGRepresentation(param.thumbImage, 1);
    }
    WBImageObject *imageObj = nil;
    if (preImageData) {
        imageObj = [WBImageObject object];
        imageObj.imageData = preImageData;
    }
    
    [WBHttpRequest requestForShareAStatus:param.message contatinsAPicture:imageObj orPictureUrl:param.imageUrl withAccessToken:self.accessToken andOtherProperties:nil queue:nil withCompletionHandler:^(WBHttpRequest *httpRequest, id result, NSError *error) {

    }];
}

- (void)userWithAccessToken:(NSString *)accessToken userId:(NSString *)userId complete:(UseroComplete)complete
{
    [WBHttpRequest requestForUserProfile:userId withAccessToken:accessToken andOtherProperties:nil queue:nil withCompletionHandler:^(WBHttpRequest *httpRequest, id result, NSError *error) {
        if (error) {
            if (complete) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    complete(nil, error);
                });
            }
        }else{
            FShareUser *user = [FShareUser userbyTranslateSinaResult:result];
            user.userId = userId;
            if (complete) {
                dispatch_async(dispatch_get_main_queue(), ^{
                     complete(user, nil);
                });
            }
        }
    }];
}

#pragma mark- WeiboSDKDelegate
/**
 收到一个来自微博客户端程序的请求
 
 收到微博的请求后，第三方应用应该按照请求类型进行处理，处理完后必须通过 [WeiboSDK sendResponse:] 将结果回传给微博
 @param request 具体的请求对象
 */
- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{

}

/**
 收到一个来自微博客户端程序的响应
 
 收到微博的响应后，第三方应用可以通过响应类型、响应的数据和 WBBaseResponse.userInfo 中的数据完成自己的功能
 @param response 具体的响应对象
 */
- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    if ([response isKindOfClass:WBAuthorizeResponse.class])
    {//授权结果
        WBAuthorizeResponse *res = (WBAuthorizeResponse*)response;
        WeiboSDKResponseStatusCode statusCode = res.statusCode;
        
        NSError *error = nil;
        
        if(statusCode==WeiboSDKResponseStatusCodeSuccess)
        {
            self.accessToken = [(WBAuthorizeResponse *)response accessToken];
            self.userID = [(WBAuthorizeResponse *)response userID];/** 用户授权登录后对该用户的唯一标识 */
            self.expirationDate = [(WBAuthorizeResponse *)response expirationDate];
        } else {
            error = getError(@"sina authorize failed");
        }
        //回调授权结果
        if (self.authorizeComplete) {
            FShareOAuthResult *oauthresult = [[FShareOAuthResult alloc] init];
            oauthresult.accessToken = self.accessToken;
            oauthresult.userId = self.userID;
            dispatch_async(dispatch_get_main_queue(), ^{
                self.authorizeComplete(oauthresult, error);
            });
        }
    }
}

- (BOOL)handleOpenURL:(NSURL *)url {
    return [WeiboSDK handleOpenURL:url delegate:self];
}

@end
