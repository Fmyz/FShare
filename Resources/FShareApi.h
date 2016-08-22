//
//  FShareApi.h
//  FShareDemo
//
//  Created by Fmyz on 16/8/22.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FShareAuthorize.h"

@interface FShareApi : NSObject

+ (instancetype)manager;

+ (BOOL)registerApp:(NSString *)appid type:(FShareOAuthType)type;
+ (void)authorize:(FShareAuthorize *)authorize;

@end
