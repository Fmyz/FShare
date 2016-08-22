//
//  FShareDef.h
//  FShareDemo
//
//  Created by Fmyz on 16/8/22.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, FShareRegisterType) { //用于Register app
    FShareRegisterTypeSina = 1, /*新浪微博*/
    FShareRegisterTypeTencent,  /*腾讯QQ*/
    FShareRegisterTypeWeiXin,   /*微信*/
};

typedef NS_ENUM(NSInteger, FShareOAuthType) { //用于登录请求 获取OAuth授权
    FShareOAuthTypeSina = 1, /*新浪微博*/
    FShareOAuthTypeTencent,  /*腾讯QQ*/
    FShareOAuthTypeWeiXin,   /*微信*/
};


