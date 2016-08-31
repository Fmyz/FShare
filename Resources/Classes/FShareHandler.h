//
//  FShareHandler.h
//  FShareDemo
//
//  Created by Fmyz on 16/8/23.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FShareDef.h"
#import "FShareParam.h"
#import "FShareUser.h"

typedef void(^AuthorizeComplete)(FShareOAuthResult *oauthresult, NSError *error);
typedef void(^UseroComplete)(FShareUser *user, NSError *error);

@interface FShareHandler : NSObject

@property (copy, nonatomic) NSString *appID;
@property (copy, nonatomic) AuthorizeComplete authorizeComplete;
@property (copy, nonatomic) UseroComplete useroComplete;

- (BOOL)isAppInstalled;

- (void)registerApp:(NSString *)appID;

- (void)authorizeWithParam:(FShareOAuthParam *)param complete:(AuthorizeComplete)complete;

- (void)shareWithParam:(FShareRequestParam *)param;

- (void)userWithAccessToken:(NSString *)accessToken userId:(NSString *)userId complete:(UseroComplete)complete;

- (BOOL)handleOpenURL:(NSURL *)url;
@end
