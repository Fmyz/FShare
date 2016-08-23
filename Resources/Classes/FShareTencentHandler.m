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

@interface FShareTencentHandler () <TencentSessionDelegate>

@property (strong, nonatomic) TencentOAuth *tcOAuth;

@end

@implementation FShareTencentHandler

- (void)registerApp:(NSString *)appID
{
    self.tcOAuth = [[TencentOAuth alloc] initWithAppId:appID andDelegate:self];
}

@end
