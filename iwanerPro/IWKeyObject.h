//
//  IWKeyObject.h
//  iwanerPro
//
//  Created by liyuanbo on 8/24/15.
//  Copyright (c) 2015 iwaner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IWKeyObject : NSObject
@property (nonatomic,strong) NSString *key;
@property (nonatomic,strong) NSString *object;

+ (instancetype)keyObjectWithKey:(NSString *)key andObject:(NSString *)object;
@end
