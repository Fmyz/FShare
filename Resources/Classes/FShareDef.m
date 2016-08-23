//
//  FShareDef.m
//  FShareDemo
//
//  Created by Fmyz on 16/8/22.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import "FShareDef.h"
#import <TencentOpenAPI/sdkdef.h>

NSError* getError(NSString *domain, NSInteger code, NSDictionary *userInfo)
{
    NSError *error = [NSError errorWithDomain:domain code:code userInfo:userInfo];
    return error;
}

@implementation FShareParam : NSObject

+ (NSString *)nonceStr
{
    NSString *nonce_str = [NSString string];
    for (int i = 0; i < 14; i++) {
        int y = arc4random()%10;
        nonce_str = [nonce_str stringByAppendingString:[NSString stringWithFormat:@"%d",y]];
    }
    return nonce_str;
}

+ (NSString *)timestamp
{
    NSString *timestamp = [NSString stringWithFormat:@"%.0f%d", [[NSDate date] timeIntervalSince1970],arc4random() % 100];
    return timestamp;
}

@end

@implementation FShareSinaParam : FShareParam

+ (instancetype)defaultParam
{
    FShareSinaParam *param = [[FShareSinaParam alloc] init];
    param.redirectURI = @"https://api.weibo.com/oauth2/default.html";
    /*
     all                                 请求下列所有scope权限
     email                               用户的联系邮箱
     direct_messages_write               私信发送接口
     direct_messages_read                私信读取接口
     invitation_write                    邀请发送接口
     friendships_groups_read             好友分组读取接口组
     friendships_groups_write            好友分组写入接口组
     statuses_to_me_read                 定向微博读取接口组
     follow_app_official_microblog       关注应用官方微博，该参数不对应具体接口，只需在应用控制台填写官方帐号即可。填写的路径：我的应用-选择自己的应用-应用信息-基本信息-官方运营账号（默认值是应用开发者帐号）
     */
    param.scope = @"all";
    
    param.userInfo = @{@"type": @"auth"};
    
    return param;
}

@end

@implementation FShareTencentParam : FShareParam

+ (instancetype)defaultParam
{
    FShareTencentParam *param = [[FShareTencentParam alloc] init];
    
    //依次为:
    //获取用户信息;移动端获取用户信息;获取登录用户自己的详细信息;获取会员用户详细信息;获取会员用户基本信息;
    //获取其他用户的详细信息;发表一条说说到 QQ 空间 (需要申请权限);发表一篇日志到 QQ 空间 (需要申请权限)
    //创建一个 QQ 空间相册 (需要申请权限);上传一张照片到 QQ 空间相册 (需要申请权限);获取用户 QQ 空间相册列表 (需要申请权限)
    //同步分享到 QQ 空间、腾讯微博;验证是否认证空间粉丝
    param.permissions = @[kOPEN_PERMISSION_GET_USER_INFO,
                          kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,
                          kOPEN_PERMISSION_GET_INFO,
                          kOPEN_PERMISSION_GET_VIP_RICH_INFO,
                          kOPEN_PERMISSION_GET_VIP_INFO,
                          kOPEN_PERMISSION_GET_OTHER_INFO,
                          kOPEN_PERMISSION_ADD_TOPIC,
                          kOPEN_PERMISSION_ADD_ONE_BLOG,
                          kOPEN_PERMISSION_ADD_ALBUM,
                          kOPEN_PERMISSION_UPLOAD_PIC,
                          kOPEN_PERMISSION_LIST_ALBUM,
                          kOPEN_PERMISSION_ADD_SHARE,
                          kOPEN_PERMISSION_CHECK_PAGE_FANS];
    
    return param;
}

@end

@implementation FShareWeiXinParam : FShareParam

+ (instancetype)defaultParam
{
    FShareWeiXinParam *param = [[FShareWeiXinParam alloc] init];
    
    //snsapi_message,snsapi_userinfo,snsapi_friend,snsapi_contact
    param.scope = @"snsapi_userinfo";
    param.state = [FShareParam nonceStr];
    
    return param;
}

@end