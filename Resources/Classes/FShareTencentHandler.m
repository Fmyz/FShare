//
//  FShareTencentHandler.m
//  FShareDemo
//
//  Created by Fmyz on 16/8/23.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import "FShareTencentHandler.h"

#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/TencentApiInterface.h>
#import <TencentOpenAPI/QQApiInterface.h>

@interface FShareTencentHandler () <TencentSessionDelegate, QQApiInterfaceDelegate>

@property (strong, nonatomic) TencentOAuth *tcOAuth;

@end

@implementation FShareTencentHandler

- (void)registerApp:(NSString *)appID
{
    self.appID = appID;
    self.tcOAuth = [[TencentOAuth alloc] initWithAppId:appID andDelegate:self];
}

- (void)authorizeWithParam:(FShareParam *)param
{
    FShareTencentParam *tcParam = nil;
    if (![param isKindOfClass:[FShareTencentParam class]]) {
        return;
    }
    tcParam = (FShareTencentParam *)param;
    [self.tcOAuth authorize:tcParam.permissions];
}

- (void)shareWithScene:(FShareScene)scene title:(NSString *)title message:(NSString *)message thumbImage:(UIImage *)thumbImage imageData:(NSData *)imageData imgaeUrl:(NSString *)imageUrl linkUrl:(NSString *)linkUrl
{
    QQApiNewsObject *newsObj;
    
    NSData *previewImageData = nil;
    if (imageData) {
        previewImageData = imageData;
    }else if (thumbImage){
        previewImageData = UIImageJPEGRepresentation(thumbImage, 1);
    }
    if (previewImageData) {
        newsObj = [QQApiNewsObject objectWithURL:[NSURL URLWithString:linkUrl] title:title description:message previewImageData:previewImageData targetContentType:QQApiURLTargetTypeNews];
    }else if (imageUrl){
        newsObj = [QQApiNewsObject objectWithURL:[NSURL URLWithString:linkUrl] title:title description:message previewImageURL:[NSURL URLWithString:imageUrl] targetContentType:QQApiURLTargetTypeNews];
    }
   
    if (scene == FShareSceneTencentQZone) {
        [newsObj setCflag: kQQAPICtrlFlagQZoneShareOnStart];
    }
    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:newsObj];
    if (scene == FShareSceneTencentQQ) {
        //将内容分享到qq
        [QQApiInterface sendReq:req];
    }else if (scene == FShareSceneTencentQZone){
        //将内容分享到qzone
        [QQApiInterface SendReqToQZone:req];
    }
}

- (BOOL)handleOpenURL:(NSURL *)url
{
    return [TencentOAuth HandleOpenURL:url] || [QQApiInterface handleOpenURL:url delegate:self];
}

#pragma mark- TencentLoginDelegate
/**
 * 登录成功后的回调
 */
- (void)tencentDidLogin
{

}

/**
 * 登录失败后的回调
 * \param cancelled 代表用户是否主动退出登录
 */
- (void)tencentDidNotLogin:(BOOL)cancelled
{

}

/**
 * 登录时网络有问题的回调
 */
- (void)tencentDidNotNetWork
{

}

#pragma mark- TencentSessionDelegate
/**
 * 退出登录的回调
 */
- (void)tencentDidLogout
{

}

/**
 * 因用户未授予相应权限而需要执行增量授权。在用户调用某个api接口时，如果服务器返回操作未被授权，则触发该回调协议接口，由第三方决定是否跳转到增量授权页面，让用户重新授权。
 * \param tencentOAuth 登录授权对象。
 * \param permissions 需增量授权的权限列表。
 * \return 是否仍然回调返回原始的api请求结果。
 * \note 不实现该协议接口则默认为不开启增量授权流程。若需要增量授权请调用\ref TencentOAuth#incrAuthWithPermissions: \n注意：增量授权时用户可能会修改登录的帐号
 */
- (BOOL)tencentNeedPerformIncrAuth:(TencentOAuth *)tencentOAuth withPermissions:(NSArray *)permissions
{
    return YES;
}

/**
 * 用户通过增量授权流程重新授权登录，token及有效期限等信息已被更新。
 * \param tencentOAuth token及有效期限等信息更新后的授权实例对象
 * \note 第三方应用需更新已保存的token及有效期限等信息。
 */
- (void)tencentDidUpdate:(TencentOAuth *)tencentOAuth
{

}

/**
 * 用户增量授权过程中因取消或网络问题导致授权失败
 * \param reason 授权失败原因，具体失败原因参见sdkdef.h文件中\ref UpdateFailType
 */
- (void)tencentFailedUpdate:(UpdateFailType)reason
{

}

/**
 * 获取用户个人信息回调
 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
 * \remarks 正确返回示例: \snippet example/getUserInfoResponse.exp success
 *          错误返回示例: \snippet example/getUserInfoResponse.exp fail
 */
- (void)getUserInfoResponse:(APIResponse*) response
{

}

/**
 * 分享到QZone回调
 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
 * \remarks 正确返回示例: \snippet example/addShareResponse.exp success
 *          错误返回示例: \snippet example/addShareResponse.exp fail
 */
- (void)addShareResponse:(APIResponse*) response
{

}

/**
 * 在QZone相册中创建一个新的相册回调
 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
 * \remarks 正确返回示例: \snippet example/addAlbumResponse.exp success
 *          错误返回示例: \snippet example/addAlbumResponse.exp fail
 */
- (void)addAlbumResponse:(APIResponse*) response
{

}

/**
 * 上传照片到QZone指定相册回调
 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
 * \remarks 正确返回示例: \snippet example/uploadPicResponse.exp success
 *          错误返回示例: \snippet example/uploadPicResponse.exp fail
 */
- (void)uploadPicResponse:(APIResponse*) response
{

}


/**
 * 在QZone中发表一篇日志回调
 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
 * \remarks 正确返回示例: \snippet example/addOneBlogResponse.exp success
 *          错误返回示例: \snippet example/addOneBlogResponse.exp fail
 */
- (void)addOneBlogResponse:(APIResponse*) response
{

}

/**
 * 在QZone中发表一条说说回调
 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
 * \remarks 正确返回示例: \snippet example/addTopicResponse.exp success
 *          错误返回示例: \snippet example/addTopicResponse.exp fail
 */
- (void)addTopicResponse:(APIResponse*) response{

}

/**
 * 设置QQ头像回调
 * \param response API返回结果，具体定义参见sdkdef.h文件中\ref APIResponse
 * \remarks 正确返回示例: \snippet example/setUserHeadpicResponse.exp success
 *          错误返回示例: \snippet example/setUserHeadpicResponse.exp fail
 */
- (void)setUserHeadpicResponse:(APIResponse*) response
{

}



#pragma mark- QQApiInterfaceDelegate
/**
 处理来至QQ的请求
 */
- (void)onReq:(QQBaseReq *)req
{

}

/**
 处理来至QQ的响应
 */
- (void)onResp:(QQBaseResp *)resp{
    if ([resp isKindOfClass:[SendMessageToQQResp class]]) {
        //        NSLog(@"type=%d,result=%@,error=%@,extendInfo=%@",resp.type,resp.result,resp.errorDescription,resp.extendInfo);
    }
}

/**
 处理QQ在线状态的回调
 */
- (void)isOnlineResponse:(NSDictionary *)response
{

}



@end
