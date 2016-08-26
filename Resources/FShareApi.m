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

+ (void)authorizeWithHandlerType:(FShareHandlerType)handlerType complete:(AuthorizeComplete)complete
{
    FShareApi *share = [FShareApi manager];
    switch (handlerType) {
        case FShareHandlerTypeSina:
        {
            [share.sinaHandler authorizeWithParam:[FShareSinaOAuthParam defaultParam] complete:complete];
        }
            break;
        case FShareHandlerTypeTencent:
        {
            [share.tencentHandler authorizeWithParam:[FShareTencentOAuthParam defaultParam] complete:complete];
        }
            break;
        case FShareHandlerTypeWeiXin:
        {
            [share.wxHandler authorizeWithParam:[FShareWeiXinOAuthParam defaultParam] complete:complete];
        }
            break;
        default:
            break;
    }
}

+ (void)authorizeWithParam:(FShareOAuthParam *)param complete:(AuthorizeComplete)complete
{
    FShareApi *share = [FShareApi manager];
    FShareHandlerType handlerType = param.handlerType;
    switch (handlerType) {
        case FShareHandlerTypeSina:
        {
            [share.sinaHandler authorizeWithParam:param complete:complete];
        }
            break;
        case FShareHandlerTypeTencent:
        {
            [share.tencentHandler authorizeWithParam:param complete:complete];
        }
            break;
        case FShareHandlerTypeWeiXin:
        {
            [share.wxHandler authorizeWithParam:param complete:complete];
        }
            break;
        default:
            break;
    }
}

+ (void)shareWithScene:(FShareScene)scene title:(NSString *)title message:(NSString *)message thumbImage:(UIImage *)thumbImage imageData:(NSData *)imageData imgaeUrl:(NSString *)imageUrl linkUrl:(NSString *)linkUrl
{
    FShareRequestParam *param = [[FShareRequestParam alloc] init];
    param.scene = scene;
    param.title = title;
    param.message = message;
    param.thumbImage = thumbImage;
    param.imageData = imageData;
    param.imageUrl = imageUrl;
    param.linkUrl = linkUrl;
    [FShareApi shareWithParam:param];
}

+ (void)shareWithParam:(FShareRequestParam *)param
{
    FShareApi *share = [FShareApi manager];
    switch (param.scene) {
        case FShareSceneSina:
        {
            [share.sinaHandler shareWithParam:param];
        }
            break;
        case FShareSceneTencentQQ:
        case FShareSceneTencentQZone:
        {
            [share.tencentHandler shareWithParam:param];
        }
            break;
        case FShareSceneWeiXinSession:
        case FShareSceneWeiXinTimeline:
        case FShareSceneFavorite:
        {
            [share.wxHandler shareWithParam:param];
        }
            break;
        default:
            break;
    }
}

+ (void)userWithHandlerType:(FShareHandlerType)handlerType accessToken:(NSString *)accessToken userId:(NSString *)userId complete:(UseroComplete)complete
{
    FShareApi *share = [FShareApi manager];
    switch (handlerType) {
        case FShareHandlerTypeSina:
        {
            [share.sinaHandler userWithAccessToken:accessToken userId:userId complete:complete];
        }
            break;
        case FShareHandlerTypeTencent:
        {
            [share.tencentHandler userWithAccessToken:accessToken userId:userId complete:complete];
        }
            break;
        case FShareHandlerTypeWeiXin:
        {
            [share.wxHandler userWithAccessToken:accessToken userId:userId complete:complete];
        }
            break;
        default:
            break;
    }
}

+ (BOOL)handleOpenURL:(NSURL *)url
{
    FShareApi *share = [FShareApi manager];
    return [share.sinaHandler handleOpenURL:url] || [share.wxHandler handleOpenURL:url] || [share.tencentHandler handleOpenURL:url];
}

+ (BOOL)isAppInstalledWithHandlerType:(FShareHandlerType)handlerType
{
    BOOL installed = NO;
    FShareApi *share = [FShareApi manager];
    switch (handlerType) {
        case FShareHandlerTypeSina:
        {
           installed = [share.sinaHandler isAppInstalled];
        }
            break;
        case FShareHandlerTypeTencent:
        {
            installed = [share.tencentHandler isAppInstalled];
        }
            break;
        case FShareHandlerTypeWeiXin:
        {
            installed = [share.wxHandler isAppInstalled];
        }
            break;
        default:
            break;
    }
    return installed;
}

@end
