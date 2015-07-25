//
//  NSObjectAdditions.h
//  Satellite
//
//  Created by yuanbo on 14-3-5.
//  Copyright 2014 yuanbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extends)

//把传进来的数据为NSNull的对象移除
+ (id)turnNullToNilForObject:(id)item;
- (id)nullTonil;
- (id)objcetByRemoveNullObjects;

- (void)setArchiveredObject:(NSObject *)object forKey:(NSString *)key;
- (id)archiveredObjectForKey:(NSString *)key;
- (void)showAlertWith:(NSString *)title andMessage:(NSString *)message;

- (NSDictionary *)readLoadPlistFile:(NSString *)courseName andPlistName:(NSString *)plistName;

- (NSMutableArray *)fileArrayrFromReadLoadSource:(NSString *)courseName;

@end
