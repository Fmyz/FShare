//
//  FShareAuthorize.h
//  FShareDemo
//
//  Created by Fmyz on 16/8/22.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FShareDef.h"

@interface FShareAuthorize : NSObject

@property (copy, nonatomic) NSString *appid;

@property (assign, nonatomic) FShareOAuthType oauthType;

- (void)login;
- (void)logout;

@end

@interface FShareTencentAuthorize: FShareAuthorize
/**
 permissions 授权信息列表
 */
@property (nonatomic, strong) NSArray *permissions;

@end

@interface FShareWeiXinAuthorize : FShareAuthorize
/**
 微信开放平台第三方应用scope，多个scrope用逗号分隔
 */
@property (nonatomic, strong) NSString *scope;

/** 由用户微信号和AppID组成的唯一标识，发送请求时第三方程序必须填写，用于校验微信用户是否换号登录*/
@property (nonatomic, retain) NSString* openID;

/** 第三方程序本身用来标识其请求的唯一性，最后跳转回第三方程序时，由微信终端回传。
 * @note state字符串长度不能超过1K
 */
@property (nonatomic, retain) NSString* state;

@end

@interface FShareSinaAuthorize : FShareAuthorize

/**
 微博开放平台第三方应用scope，多个scrope用逗号分隔
 */
@property (nonatomic, strong) NSString *scope;

/**
 微博开放平台第三方应用授权回调页地址，默认为`https://api.weibo.com/oauth2/default.html`
 @warning 必须保证和在微博开放平台应用管理界面配置的“授权回调页”地址一致，如未进行配置则默认为`https://api.weibo.com/oauth2/default.html`
 */
@property (nonatomic, strong) NSString *redirectURI;

/**
 自定义信息字典，用于数据传输过程中存储相关的上下文环境数据
 第三方应用给微博客户端程序发送 request 时，可以在 userInfo 中存储请求相关的信息。
 @warning userInfo中的数据必须是实现了 `NSCoding` 协议的对象，必须保证能序列化和反序列化
 @warning 序列化后的数据不能大于10M
 */
@property (nonatomic, strong) NSDictionary *userInfo;

@end
