//
//  FShareAuthorize.h
//  FShareDemo
//
//  Created by Fmyz on 16/8/22.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, FShareOAuthType) {
    FShareOAuthTypeSina = 1, /*新浪微博*/
    FShareOAuthTypeTencent,  /*腾讯QQ*/
    FShareOAuthTypeWeiXin,   /*微信*/
};

@interface FShareAuthorize : NSObject

/**
 自定义信息字典，用于数据传输过程中存储相关的上下文环境数据
 
 第三方应用给微博客户端程序发送 request 时，可以在 userInfo 中存储请求相关的信息。
 
 @warning userInfo中的数据必须是实现了 `NSCoding` 协议的对象，必须保证能序列化和反序列化
 @warning 序列化后的数据不能大于10M
 */
@property (nonatomic, strong) NSDictionary *userInfo;

/**
 微博开放平台第三方应用scope，多个scrope用逗号分隔
 
 参考 http://open.weibo.com/wiki/%E6%8E%88%E6%9D%83%E6%9C%BA%E5%88%B6%E8%AF%B4%E6%98%8E#scope
 
 @warning 长度小于1K
 */
@property (nonatomic, strong) NSString *scope;

/**
 微博开放平台第三方应用授权回调页地址，默认为`http://`
 
 参考 http://open.weibo.com/wiki/%E6%8E%88%E6%9D%83%E6%9C%BA%E5%88%B6%E8%AF%B4%E6%98%8E#.E5.AE.A2.E6.88.B7.E7.AB.AF.E9.BB.98.E8.AE.A4.E5.9B.9E.E8.B0.83.E9.A1.B5
 
 @warning 必须保证和在微博开放平台应用管理界面配置的“授权回调页”地址一致，如未进行配置则默认为`http://`
 @warning 不能为空，长度小于1K
 */
@property (nonatomic, strong) NSString *redirectURI;

/**
 * 登录授权
 * \param permissions 授权信息列表
 * \param bInSafari 是否使用safari进行登录.<b>IOS SDK 1.3版本开始此参数废除</b>
 */
- (BOOL)authorize:(NSArray *)permissions;

@end
