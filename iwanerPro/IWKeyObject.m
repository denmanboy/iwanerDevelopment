//
//  IWKeyObject.m
//  iwanerPro
//
//  Created by liyuanbo on 8/24/15.
//  Copyright (c) 2015 iwaner. All rights reserved.
//

#import "IWKeyObject.h"

@implementation IWKeyObject

+ (instancetype)keyObjectWithKey:(NSString *)key andObject:(NSString *)object
{
    IWKeyObject *keyObject = [[IWKeyObject alloc] init];
    
    keyObject.key = key;
    keyObject.object = object;
    return keyObject;
}

@end
