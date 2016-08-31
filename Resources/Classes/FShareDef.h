//
//  FShareDef.h
//  FShareDemo
//
//  Created by Fmyz on 16/8/22.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, FShareHandlerType) {
    FShareHandlerTypeNone = 0,
    FShareHandlerTypeSina, /*新浪微博*/
    FShareHandlerTypeTencent,  /*腾讯QQ*/
    FShareHandlerTypeWeiXin,   /*微信*/
};

typedef NS_ENUM(NSInteger, FShareScene) {
    FShareSceneNone = 0,
    
    FShareSceneSina = 10, /*新浪微博*/
    
    /*共同支持QQApiNewsObject, QQApiAudioObject, QQApiVideoObject*/
    FShareSceneTencentQQ = 20,  /*腾讯QQ*/ //单独支持QQApiTextObject, QQApiImageObject
    FShareSceneTencentQZone,    /*腾讯QQ空间*/
    
    FShareSceneWeiXinSession = 30,   /*微信聊天界面*/
    FShareSceneWeiXinTimeline,       /*微信朋友圈*/
    FShareSceneFavorite,             /*微信收藏*/
};

NSError* getError(NSString *errMsg);

