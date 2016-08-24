//
//  FShareHandler.m
//  FShareDemo
//
//  Created by Fmyz on 16/8/23.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import "FShareHandler.h"

@implementation FShareHandler

- (void)registerApp:(NSString *)appKey{/*子类重写该方法*/}

- (void)authorizeWithParam:(FShareParam *)param{/*子类重写该方法*/}

/*子类重写该方法*/
- (BOOL)handleOpenURL:(NSURL *)url{return NO;}

- (void)shareWithScene:(FShareScene)scene title:(NSString *)title message:(NSString *)message thumbImage:(UIImage *)thumbImage imageData:(NSData *)imageData imgaeUrl:(NSString *)imageUrl linkUrl:(NSString *)linkUrl{/*子类重写该方法*/};

@end
