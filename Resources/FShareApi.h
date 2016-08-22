//
//  FShareApi.h
//  FShareDemo
//
//  Created by Fmyz on 16/8/22.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FShareAuthorize.h"
#import "FShareDef.h"

@interface FShareApi : NSObject

+ (instancetype)manager;


/*! @brief 注册第三方应用。
 *
 * 需要在每次启动第三方应用程序时调用。
 * @param apps key为@(FShareRegisterType) value为appid
 * @param type 开发者需要注册的应用
 * @return 成功返回YES，失败返回NO。
 */
+ (BOOL)registerApps:(NSDictionary *)apps;

/*! @brief 注册第三方应用。
 *
 * 需要在每次启动第三方应用程序时调用。
 * @param appid 开发者ID
 * @param type 开发者需要注册的应用
 * @return 成功返回YES，失败返回NO。
 */
+ (BOOL)registerApp:(NSString *)appid type:(FShareRegisterType)type;



/*! @brief 发送登录请求
 *
 * @param oauthType 根据oauthType进行登录 有使用默认FShareAuthorize实例
 * @return 成功返回YES，失败返回NO
 */
+ (void)authorizeWithOAuthType:(FShareOAuthType)oauthType;

/*! @brief 发送登录请求
 *
 * @param authorize 授权对象实例
 * @return 成功返回YES，失败返回NO
 */
+ (void)authorize:(FShareAuthorize *)authorize;



/*! @brief 处理微信通过URL启动App时传递的数据
 *
 * 需要在 application:openURL:sourceApplication:annotation:或者application:handleOpenURL中调用。
 * @param url 传递过来的URL
 * @return 成功返回YES，失败返回NO。
 */
+ (BOOL)handleOpenURL:(NSURL *)url;

@end
