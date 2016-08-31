//
//  FShareUser.m
//  FShareDemo
//
//  Created by Fmyz on 16/8/26.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import "FShareUser.h"
#import "WeiboUser.h"

@implementation FShareUser

+ (FShareUser *)userbyTranslateSinaResult:(id)result
{
    FShareUser *user = [[FShareUser alloc] init];
    user.handlerType = FShareHandlerTypeSina;
    
    if ([result isKindOfClass:[WeiboUser class]]) {
        WeiboUser *wbUser = (WeiboUser *)result;
        user.nickname = wbUser.screenName;
        user.gender = wbUser.gender;
        user.largeAvatar = wbUser.avatarLargeUrl;
        user.thumbAvatar = wbUser.profileImageUrl;
        user.province = wbUser.province;
        user.city = wbUser.city;
        user.location = wbUser.location;
    }
    return user;
}

+ (FShareUser *)userbyTranslateWeiXinResult:(id)result
{
    FShareUser *user = [[FShareUser alloc] init];
    user.handlerType = FShareHandlerTypeWeiXin;
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        user.userId = result[@"openid"];
        user.nickname = result[@"nickname"];
        user.province = result[@"province"];
        user.city = result[@"city"];
        user.country = result[@"country"];
        user.thumbAvatar = result[@"headimgurl"];
        user.unionid = result[@"unionid"];
    }
    return user;
}

+ (FShareUser *)userbyTranslateTencentResult:(id)result
{
    FShareUser *user = [[FShareUser alloc] init];
    user.handlerType = FShareHandlerTypeTencent;
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        user.gender = [result objectForKey:@"gender"];
        user.nickname = [result objectForKey:@"nickname"];
        user.largeAvatar = [result objectForKey:@"figureurl_qq_2"];
        user.thumbAvatar = [result objectForKey:@"figureurl_qq_1"];
        NSString *year = [result objectForKeyedSubscript:@"year"];
        NSDateFormatter *dateFoematter = [[NSDateFormatter alloc] init];
        [dateFoematter setDateFormat:@"yyyy"];
        NSString *currDate = [dateFoematter stringFromDate:[NSDate date]];
        int ageNum = [currDate intValue] - [year intValue];
        user.age = [NSString stringWithFormat:@"%d",ageNum];
    }
    return user;
}

@end
