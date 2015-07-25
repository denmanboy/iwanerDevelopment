//
//  NSString+JSON.m
//  MobbyAssistant
//
//  Created by liyuanbo on 5/7/15.
//  Copyright (c) 2015 mobby. All rights reserved.
//

#import "NSString+JSON.h"

@implementation NSString (JSON)

+(NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString
{
    NSData *JSONData = [JSONString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
    return responseJSON;
}


@end
