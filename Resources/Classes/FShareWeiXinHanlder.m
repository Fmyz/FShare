//
//  FShareWeiXinHanlder.m
//  FShareDemo
//
//  Created by Fmyz on 16/8/23.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import "FShareWeiXinHanlder.h"
#import "FShareDef.h"

#import "WXApi.h"
#import "WechatAuthSDK.h"

@interface FShareWeiXinHanlder () <WXApiDelegate>

@end


@implementation FShareWeiXinHanlder

- (void)registerApp:(NSString *)appID
{
    self.appID = appID;
    [WXApi registerApp:appID];
}

- (void)authorizeWithParam:(FShareParam *)param
{
    FShareWeiXinParam *wxParam = nil;
    if (![param isKindOfClass:[FShareWeiXinParam class]]) {
        return;
    }
    wxParam = (FShareWeiXinParam *)param;
    
    SendAuthReq *req = [[SendAuthReq alloc] init];
    req.scope = wxParam.scope;
    req.state = wxParam.state;
    [WXApi sendReq:req];
}

- (BOOL)handleOpenURL:(NSURL *)url
{
    return [WXApi handleOpenURL:url delegate:self];
}

#pragma mark- WXApiDelegate

- (void)onResp:(BaseResp *)resp
{
    if ([resp isKindOfClass:[SendAuthResp class]]) {
        SendAuthResp *response = (SendAuthResp *)resp;
        if (response.errCode == 0) {
//            [WeChatLogin getWXLoginAccess_tokenWithCode:response.code delegate:self];
            
        }else{
            NSString *errMsg = nil;
            if (resp.errCode == WXErrCodeUserCancel) {
//                errMsg = STR(@"中途取消");
            }else{
//                errMsg = [NSString stringWithFormat:@"%@ code:%d",STR(@"其它错误"),resp.errCode];
            }
//            if(_loginComplete) {
//                _loginComplete(nil,getError(errMsg));
//            }
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
