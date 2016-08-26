//
//  FShareDef.m
//  FShareDemo
//
//  Created by Fmyz on 16/8/22.
//  Copyright © 2016年 Fmyz. All rights reserved.
//

#import "FShareDef.h"


NSError* getError(NSString *errMsg)
{
    NSError *error = [NSError errorWithDomain:NSCocoaErrorDomain code:1 userInfo:[NSDictionary dictionaryWithObject:errMsg forKey:NSLocalizedDescriptionKey]];
    return error;
}
