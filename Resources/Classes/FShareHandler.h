//
//  FShareHandler.h
//  FShareDemo
//
//  Created by Fmyz on 16/8/23.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FShareDef.h"

@interface FShareHandler : NSObject

@property (copy, nonatomic) NSString *appID;

- (void)registerApp:(NSString *)appID;

- (void)authorizeWithParam:(FShareParam *)param;

- (BOOL)handleOpenURL:(NSURL *)url;

- (void)shareWithScene:(FShareScene)scene title:(NSString *)title message:(NSString *)message thumbImage:(UIImage *)thumbImage imageData:(NSData *)imageData imgaeUrl:(NSString *)imageUrl linkUrl:(NSString *)linkUrl;

@end
