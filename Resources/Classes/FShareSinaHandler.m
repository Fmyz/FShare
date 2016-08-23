//
//  FShareSinaHandler.m
//  FShareDemo
//
//  Created by Fmyz on 16/8/23.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import "FShareSinaHandler.h"

#import "WeiboSDK.h"

@implementation FShareSinaHandler

- (void)registerApp:(NSString *)appID
{
    [WeiboSDK registerApp:appID];
}

@end
