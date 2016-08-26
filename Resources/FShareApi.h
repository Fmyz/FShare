//
//  FShareApi.h
//  FShareDemo
//
//  Created by Fmyz on 16/8/22.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FShareSinaHandler.h"
#import "FShareTencentHandler.h"
#import "FShareWeiXinHanlder.h"
#import "FShareUser.h"
#import "FShareDef.h"

@interface FShareApi : NSObject

+ (instancetype)manager;


/*! @brief 注册第三方应用。
 *
 * 需要在每次启动第三方应用程序时调用。
 * @param apps key为@(FShareHandlerType) value为appID
 * @param type 开发者需要注册的应用
 * @return 成功返回YES，失败返回NO。
 */
+ (void)registerApps:(NSDictionary *)apps;

/*! @brief 注册第三方应用。
 *
 * 需要在每次启动第三方应用程序时调用。
 * @param appid 开发者ID
 * @param type 开发者需要注册的应用
 * @return 成功返回YES，失败返回NO。
 */
+ (void)registerApp:(NSString *)appID handlerType:(FShareHandlerType)handlerType;

/*! @brief 发送登录请求
 * 分享和获取个人信息，都需要先授权
 * @param oauthType 根据handlerType进行登录,使用默认FShareParam
 * @return 成功返回YES，失败返回NO
 */
+ (void)authorizeWithHandlerType:(FShareHandlerType)handlerType complete:(AuthorizeComplete)complete;

/*! @brief 发送登录请求
 *  分享和获取个人信息，都需要先授权
 * @param param 登录参数, 请使用其子类
 * @return 成功返回YES，失败返回NO
 */
+ (void)authorizeWithParam:(FShareOAuthParam *)param complete:(AuthorizeComplete)complete;

/*! @brief 发送分享
 *
 * @param scene 分享场景
 * @param title 标题
 * @param message 内容
 * @param image 图片 有图片的话 填一个就可以
 * @param imageData 图片二进制
 * @param imageUrl 图片Url
 * @param linkUrl 点击分享内容响应的URL
 */
+ (void)shareWithScene:(FShareScene)scene title:(NSString *)title message:(NSString *)message thumbImage:(UIImage *)thumbImage imageData:(NSData *)imageData imgaeUrl:(NSString *)imageUrl linkUrl:(NSString *)linkUrl;

/*! @brief 发送分享
 *
 * @param param 分享实例
 */
+ (void)shareWithParam:(FShareRequestParam *)param;

/*! @brief 获取个人信息，需要授权后调用
 *
 * 微信需要先获取accessToken @see WeiXinExtension
 *
 * @param handlerType 个人信息平台
 * @param accessToken 凭证
 * @param userId 授权后返回的用户唯一ID
 */
+ (void)userWithHandlerType:(FShareHandlerType)handlerType accessToken:(NSString *)accessToken userId:(NSString *)userId complete:(UseroComplete)complete;

/*! @brief 处理微信通过URL启动App时传递的数据
 *
 * 需要在 application:openURL:sourceApplication:annotation:或者application:handleOpenURL中调用。
 * @param url 传递过来的URL
 * @return 成功返回YES，失败返回NO。
 */
+ (BOOL)handleOpenURL:(NSURL *)url;

/*! @brief 是否安装APP
 *
 */
+ (BOOL)isAppInstalledWithHandlerType:(FShareHandlerType)handlerType;

@end
