//
//  FShareHandler.h
//  FShareDemo
//
//  Created by Fmyz on 16/8/23.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FShareParam;
@interface FShareHandler : NSObject

@property (copy, nonatomic) NSString *appID;

- (void)registerApp:(NSString *)appID;

- (void)authorizeWithParam:(FShareParam *)param;

- (BOOL)handleOpenURL:(NSURL *)url;

@end
