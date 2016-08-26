//
//  FShareUser.h
//  FShareDemo
//
//  Created by Fmyz on 16/8/26.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FShareDef.h"

@interface FShareUser : NSObject

@property (assign, nonatomic) FShareHandlerType handlerType; //哪个平台
@property (copy, nonatomic) NSString *userId;

@property (copy, nonatomic) NSString *nickname; //昵称
@property (copy, nonatomic) NSString *gender; //性别
@property (copy, nonatomic) NSString *largeAvatar; //大头像
@property (copy, nonatomic) NSString *thumbAvatar; //小头像

@property (copy, nonatomic) NSString *country; //国家
@property (copy, nonatomic) NSString *province; //省份
@property (copy, nonatomic) NSString *city; //城市
@property (copy, nonatomic) NSString *age; //年龄
@property (copy, nonatomic) NSString *location; //坐标

@property (copy, nonatomic) NSString *unionid; //微信用户专有

+ (FShareUser *)userbyTranslateSinaResult:(id)result;
+ (FShareUser *)userbyTranslateWeiXinResult:(id)result;
+ (FShareUser *)userbyTranslateTencentResult:(id)result;

@end
