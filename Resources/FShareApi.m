//
//  FShareApi.m
//  FShareDemo
//
//  Created by Fmyz on 16/8/22.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import "FShareApi.h"







@interface FShareApi ()

@property (strong, nonatomic) FShareTencentHandler *tencentHandler;
@property (strong, nonatomic) FShareWeiXinHanlder *wxHandler;
@property (strong, nonatomic) FShareSinaHandler *sinaHandler;

@end

@implementation FShareApi

+ (instancetype)manager
{
    static FShareApi *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!manager) {
            manager = [[FShareApi alloc] init];
        }
    });
    return manager;
}

+ (void)registerApps:(NSDictionary *)apps
{
    if (!apps || [apps allKeys].count == 0) {
        return;
    }
    for (NSNumber *key in apps.allKeys) {
        NSString *appid = [apps objectForKey:key];
        [FShareApi registerApp:appid handlerType:key.integerValue];
    }
}

+ (void)registerApp:(NSString *)appID handlerType:(FShareHandlerType)handlerType
{
    FShareApi *share = [FShareApi manager];
    switch (handlerType) {
        case FShareHandlerTypeSina:
        {
            [share.sinaHandler registerApp:appID];
        }
            break;
        case FShareHandlerTypeTencent:
        {
            [share.tencentHandler registerApp:appID];
            
        }
            break;
        case FShareHandlerTypeWeiXin:
        {
            [share.wxHandler registerApp:appID];
        }
            break;
        default:
            break;
    }
}

+ (void)authorizeWithHandlerType:(FShareHandlerType)handlerType
{
    FShareApi *share = [FShareApi manager];
    switch (handlerType) {
        case FShareHandlerTypeSina:
        {
            [share.sinaHandler authorizeWithParam:[FShareSinaParam defaultParam]];
        }
            break;
        case FShareHandlerTypeTencent:
        {
            [share.tencentHandler authorizeWithParam:[FShareTencentParam defaultParam]];
        }
            break;
        case FShareHandlerTypeWeiXin:
        {
            [share.wxHandler authorizeWithParam:[FShareWeiXinParam defaultParam]];
        }
            break;
        default:
            break;
    }
}

+ (void)authorizeWithParam:(FShareParam *)param
{
    FShareApi *share = [FShareApi manager];
    FShareHandlerType handlerType = param.handlerType;
    switch (handlerType) {
        case FShareHandlerTypeSina:
        {
            [share.sinaHandler authorizeWithParam:param];
        }
            break;
        case FShareHandlerTypeTencent:
        {
            [share.tencentHandler authorizeWithParam:param];
        }
            break;
        case FShareHandlerTypeWeiXin:
        {
            [share.wxHandler authorizeWithParam:param];
        }
            break;
        default:
            break;
    }
}


@end
