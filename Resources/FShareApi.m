//
//  FShareApi.m
//  FShareDemo
//
//  Created by Fmyz on 16/8/22.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import "FShareApi.h"

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

@end
