//
//  NSObjectAdditions.m
//  Satellite
//
//  Created by yuanbo on 14-3-5.
//  Copyright 2014 yuanbo. All rights reserved.
//

#import "NSObjectAdditions.h"

@implementation NSObject (Extends)


- (NSDictionary *)readLoadPlistFile:(NSString *)courseName andPlistName:(NSString *)plistName
{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@/%@.plist",courseName,plistName]];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    

    
    
    return dic;
}



//读取资源文件
- (NSMutableArray *)fileArrayrFromReadLoadSource:(NSString *)courseName
{
    
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,  NSUserDomainMask,YES);
    NSString *classPath = [NSString stringWithFormat:@"%@/%@",[documentPaths objectAtIndex:0],courseName];
    
    NSFileManager *fileManage = [NSFileManager defaultManager];
    NSArray *fileArray = [fileManage subpathsOfDirectoryAtPath: classPath error:nil];
    
    NSMutableArray *classSourceFileArray1 = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < fileArray.count; i++) {
        NSString *subPath = [fileArray objectAtIndex:i];
        if([subPath rangeOfString:@"__MACOSX"].location == NSNotFound)
        {
            [classSourceFileArray1 addObject:subPath];
        }
    }
    
    
    NSMutableArray *classSourceFileArray2 = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < classSourceFileArray1.count; i++) {
        
        NSString *subPath = [classSourceFileArray1 objectAtIndex:i];
        
        if([subPath rangeOfString:@"svn"].location == NSNotFound)//_roaldSearchText
        {
            [classSourceFileArray2 addObject:subPath];
        }
    }
    
    return classSourceFileArray2;
    
    
}



//把传进来的数据为NSNull的对象移除
+ (id)turnNullToNilForObject:(id)item
{
    if([item isKindOfClass:[NSDictionary class]]){
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:item];
        for (NSString *key in [dic allKeys]) {
            id value = [dic objectForKey:key];
            id o = [self turnNullToNilForObject:value];
            if (o) {
                [dic setObject:o forKey:key];
            }
            else {
                [dic removeObjectForKey:key];
            }
        }
        return dic;
    }
    else if([item isKindOfClass:[NSArray class]]){
        NSMutableArray *arr= [NSMutableArray arrayWithArray:item];
        for (NSInteger i = [arr count]-1; i >= 0; i--) {
            id value = [arr objectAtIndex:i];
            id o = [self turnNullToNilForObject:value];
            if (o) {
                [arr replaceObjectAtIndex:i withObject:o];
            }
            else {
                [arr removeObjectAtIndex:i];
            }
        }
        return arr;
    }
    return [item nullTonil];
}
- (id)nullTonil
{
    if ([self isKindOfClass:[NSNull class]]) {
        return nil;
    }
    if ([self isKindOfClass:[NSString class]]) {
        if([(NSString *)self length] == 0)
        {
            return nil;
        }
    }
    return self;
    
}
- (in)objcetByRemoveNullObjects
{
    return [NSObject turnNullToNilForObject:self];
}
- (void)setArchiveredObject:(NSObject *)object forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:object] forKey:key];
}
- (id)archiveredObjectForKey:(NSString *)key
{
    return [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:key]];
}

- (void)showAlertWith:(NSString *)title andMessage:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}


@end
