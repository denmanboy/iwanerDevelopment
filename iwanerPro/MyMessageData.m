//
//  MyMessageData.m
//  iwanerPro
//
//  Created by dengyanzhou on 15/7/26.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import "MyMessageData.h"

@implementation MyMessageData

- (void)parseInfoWithDic:(NSDictionary*)dic
{
    [super setValuesForKeysWithDictionary:dic];

}
/**
 *  重写父类方法
 *
 *  @param value <#value description#>
 *  @param key   <#key description#>
 */
- (void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:[value nullTonil] forKey:key];

}

/**找不到的key*/
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"该key没有找到");

}
- (id)valueForUndefinedKey:(NSString *)key
{
    return nil;

}
@end
