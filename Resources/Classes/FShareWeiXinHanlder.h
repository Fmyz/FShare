//
//  FShareWeiXinHanlder.h
//  FShareDemo
//
//  Created by Fmyz on 16/8/23.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import "FShareHandler.h"

@interface FShareWeiXinHanlder : FShareHandler


@end

@interface FShareWeiXinHanlder (WeiXinExtension)

//该步骤建议放在服务器
+ (void)weixinAccessTokenWithCode:(NSString *)code appid:(NSString *)appid appSecret:(NSString *)appSecret complete:(void(^)(NSString *accessToken, NSString *openid, NSError *error))complete;

@end
