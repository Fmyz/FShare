//
//  FShareSinaHandler.m
//  FShareDemo
//
//  Created by Fmyz on 16/8/23.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import "FShareSinaHandler.h"
#import "FShareDef.h"

#import "WeiboSDK.h"

@interface FShareSinaHandler () <WeiboSDKDelegate>

@end

@implementation FShareSinaHandler

- (void)registerApp:(NSString *)appID
{
    self.appID = appID;
    [WeiboSDK registerApp:appID];
}

- (void)authorizeWithParam:(FShareParam *)param
{
    FShareSinaParam *sinaParam = nil;
    if (![param isKindOfClass:[FShareSinaParam class]]) {
        return;
    }
    sinaParam = (FShareSinaParam *)param;
    
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = sinaParam.redirectURI;
    request.scope = sinaParam.scope;
    request.userInfo = sinaParam.userInfo;
    [WeiboSDK sendRequest:request];
}

- (BOOL)handleOpenURL:(NSURL *)url {
    return [WeiboSDK handleOpenURL:url delegate:self];
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

}

@end
