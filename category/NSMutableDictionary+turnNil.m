//
//  NSMutableDictionary+turnNil.m
//  NewClass
//
//  Created by liyuanbo on 14-3-12.
//  Copyright (c) 2014年 mobby. All rights reserved.
//

#import "NSMutableDictionary+turnNil.h"

@implementation NSMutableDictionary (turnNil)
- (void)setValueReal:(id)value forKey:(NSString *)key
{
    if (value) {
//        if ([value isKindOfClass:[NSString class]]) {
//            if ([value intValue] < 0) {
//                int num = -1;
//                num = (-1) * [value intValue];
//                value = [NSString stringWithFormat:@"-%i",num];
//            }
//        }
        
        [self setValue:value forKey:key];
    }
}

@end
