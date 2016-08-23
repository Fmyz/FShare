//
//  FShareWeiXinHanlder.m
//  FShareDemo
//
//  Created by Fmyz on 16/8/23.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import "FShareWeiXinHanlder.h"

#import "WXApi.h"
#import "WechatAuthSDK.h"

@implementation FShareWeiXinHanlder

- (void)registerApp:(NSString *)appID
{
    [WXApi registerApp:appID];
}

@end
