//
//  FShareHandler.m
//  FShareDemo
//
//  Created by Fmyz on 16/8/23.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import "FShareHandler.h"

@implementation FShareHandler

- (BOOL)isAppInstalled{return NO;/*子类重写该方法*/}

- (void)registerApp:(NSString *)appKey{/*子类重写该方法*/}

- (void)authorizeWithParam:(FShareParam *)param complete:(AuthorizeComplete)complete{/*子类重写该方法*/}

- (void)userWithAccessToken:(NSString *)accessToken userId:(NSString *)userId complete:(UseroComplete)complete{/*子类重写该方法*/}

- (BOOL)handleOpenURL:(NSURL *)url{return NO;/*子类重写该方法*/}

- (void)shareWithParam:(FShareRequestParam *)param{/*子类重写该方法*/}

@end
