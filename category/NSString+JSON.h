//
//  NSString+JSON.h
//  MobbyAssistant
//
//  Created by liyuanbo on 5/7/15.
//  Copyright (c) 2015 mobby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JSON)

+(NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString;

@end
