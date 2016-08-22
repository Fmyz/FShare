//
//  FShareApi.m
//  FShareDemo
//
//  Created by Fmyz on 16/8/22.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import "FShareApi.h"

@interface FShareApi ()

@property (strong, nonatomic) FShareTencentAuthorize *tencentAuth;
@property (strong, nonatomic) FShareWeiXinAuthorize *wxAuth;
@property (strong, nonatomic) FShareSinaAuthorize *sinaAuth;

@end

@implementation FShareApi

+ (instancetype)manager
{
    static FShareApi *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!manager) {
            manager = [[FShareApi alloc] init];
        }
    });
    return manager;
}

//+ (BOOL)registerApp:(NSString *)appid type:(FShareRegisterType)type
//{
//
//}



@end
