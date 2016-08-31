//
//  FShareWeiXinHanlder.m
//  FShareDemo
//
//  Created by Fmyz on 16/8/23.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import "FShareWeiXinHanlder.h"

#import "WXApi.h"

@interface FShareWeiXinHanlder () <WXApiDelegate>

@property (copy, nonatomic) NSString *accessToken;

@end


@implementation FShareWeiXinHanlder

- (BOOL)isAppInstalled
{
    return [WXApi isWXAppInstalled];
}

- (void)registerApp:(NSString *)appID
{
    self.appID = appID;
    [WXApi registerApp:appID];
}

- (void)authorizeWithParam:(FShareParam *)param complete:(AuthorizeComplete)complete
{
    FShareWeiXinOAuthParam *wxParam = nil;
    if (![param isKindOfClass:[FShareWeiXinOAuthParam class]]) {
        return;
    }
    self.authorizeComplete = complete;
    wxParam = (FShareWeiXinOAuthParam *)param;
    
    SendAuthReq *req = [[SendAuthReq alloc] init];
    req.scope = wxParam.scope;
    req.state = wxParam.state;
    [WXApi sendReq:req];
}

- (void)shareWithParam:(FShareRequestParam *)param
{
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.bText = (param.thumbImage == nil);
    if (param.thumbImage) {
        WXMediaMessage *mediaMessage = [WXMediaMessage message];
        mediaMessage.title = param.title;
        mediaMessage.description = param.message;
        [mediaMessage setThumbImage:param.thumbImage];
        
        if (param.imageData) {
            WXImageObject *mediaObject = [WXImageObject object];
            mediaObject.imageData = param.imageData;
            mediaMessage.mediaObject = mediaObject;
        }else if (param.linkUrl){
            WXWebpageObject *mediaObject = [WXWebpageObject object];
            mediaObject.webpageUrl = param.linkUrl;
            mediaMessage.mediaObject = mediaObject;
        }
        req.message = mediaMessage;
    }else{
        req.text = param.message;
    }
    
    enum WXScene wxScene = WXSceneSession;
    switch (param.scene) {
        case FShareSceneWeiXinSession:
        {
            wxScene = WXSceneSession;
        }
            break;
        case FShareSceneWeiXinTimeline:
        {
            wxScene = WXSceneTimeline;
        }
            break;
        case FShareSceneFavorite:
        {
            wxScene = WXSceneFavorite;
        }
            break;
        default:
            break;
    }
    
    [WXApi sendReq:req];
}

- (void)userWithAccessToken:(NSString *)accessToken userId:(NSString *)userId complete:(UseroComplete)complete
{
    NSString *url_str=[NSString stringWithFormat:@"https://api.weixin.qq.com/sns/userinfo?access_token=%@&openid=%@&lang=zh-CN",accessToken, userId];
    
    NSURL *url = [NSURL URLWithString:url_str];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *result_str = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
        NSData *result_data = [result_str dataUsingEncoding:NSUTF8StringEncoding];
        if (result_data) {
            
            NSDictionary *result = [NSJSONSerialization JSONObjectWithData:result_data options:NSJSONReadingMutableContainers error:nil];
            
            FShareUser *user = [FShareUser userbyTranslateWeiXinResult:result];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (complete) {
                    complete(user, nil);
                }
            });
            
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                if (complete) {
                    complete(nil, getError(@"weixin user failed"));
                }
            });
        }
    });
}

- (BOOL)handleOpenURL:(NSURL *)url
{
    return [WXApi handleOpenURL:url delegate:self];
}

#pragma mark- WXApiDelegate

- (void)onResp:(BaseResp *)resp
{
    if ([resp isKindOfClass:[SendAuthResp class]]) {//授权结果
        
        SendAuthResp *response = (SendAuthResp *)resp;

        NSError *error = nil;
        NSString *code = nil;
        if (response.errCode == WXSuccess) {
            code = response.code;
        }else{
            if (resp.errCode == WXErrCodeUserCancel) {
                error = getError(@"user cancel");
            }else{
                error = getError(@"weixin authorize failed");
            }
        }
        if(self.authorizeComplete) {
            FShareOAuthResult *oauthresult = [[FShareOAuthResult alloc] init];
            oauthresult.code = code;
            dispatch_async(dispatch_get_main_queue(), ^{
                self.authorizeComplete(oauthresult, error);
            });
        }

    }else  if([resp isKindOfClass:[SendMessageToWXResp class]]){
        if (resp.errCode==WXSuccess) {
          
        }else {
           
        }
    }else if ([resp isKindOfClass:[PayResp class]]) {
        //微信支付返回
        PayResp *response = (PayResp *)resp;
        NSLog(@"returnKey:%@,errStr:%@",response.returnKey,response.errStr);
        if (response.errCode == WXSuccess) {
           
        } else if (response.errCode == WXErrCodeUserCancel) {
//               @"取消支付"
        }
    }
}

@end

@implementation FShareWeiXinHanlder (WeiXinExtension)

+ (void)weixinAccessTokenWithCode:(NSString *)code appid:(NSString *)appid appSecret:(NSString *)appSecret complete:(void (^)(NSString *, NSString *, NSError *))complete;
{
    NSString *url_str=[NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/access_token?appid=%@&secret=%@&code=%@&grant_type=authorization_code", appid, appSecret, code];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *url = [NSURL URLWithString:url_str];
        NSString *result_str = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
        NSData *result_data = [result_str dataUsingEncoding:NSUTF8StringEncoding];
        if (result_data) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:result_data options:NSJSONReadingMutableContainers error:nil];
            NSString *accessToken = [dict objectForKey:@"access_token"];
            NSString *openid = [dict objectForKey:@"openid"];/** 用户授权登录后对该用户的唯一标识 */
            dispatch_async(dispatch_get_main_queue(), ^{
                if (complete) {
                    complete(accessToken, openid, nil);
                }
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                if (complete) {
                    complete(nil, nil, getError(@"weixin AccessToken failed"));
                }
            });
        }
    });
}

@end

