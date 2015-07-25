//
//  NSMutableDictionary+turnNil.h
//  NewClass
//
//  Created by liyuanbo on 14-3-12.
//  Copyright (c) 2014年 mobby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (turnNil)
- (void)setValueReal:(id)value forKey:(NSString *)key;
@end
