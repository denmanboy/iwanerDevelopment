//
//  NSDataAdditions.m
//  TestFont
//
//  Created by yuanbo on 13-4-10.
//  Copyright (c) 2013年 yuanbo. All rights reserved.
//

#import "NSDataAdditions.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSData (Extends)


- (void)showAlertWith:(NSString *)title andMessage:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}


@end
