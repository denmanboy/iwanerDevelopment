//
//  NSDataAdditions.h
//  TestFont
//
//  Created by yuanbo on 13-4-10.
//  Copyright (c) 2013年 yuanbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Extends)

/**
 * Calculate the md5 hash of this data using CC_MD5.
 *
 * @return md5 hash of this data
 */

- (void)showAlertWith:(NSString *)title andMessage:(NSString *)message;

@end
