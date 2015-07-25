//
//  HttpEngine.m
//  MobbyAssistant
//
//  Created by liyuanbo on 5/5/15.
//  Copyright (c) 2015 mobby. All rights reserved.
//

#import "HttpEngine.h"

@implementation HttpEngine

SYNTHESIZE_SINGLETON_FOR_CLASS(HttpEngine)

//- (instancetype)init
//{
//    if (self = [super initWithHostName:HTTP_HOST]) {
//    }
//    return self;
//}
//
//
////登陆
//- (MKNetworkOperation *)loginWithUsername:(NSString *)username
//                                   password:(NSString *)password
//                        onCompletionHandler:(MKNKResponseBlock) response
//                               errorHandler:(MKNKResponseErrorBlock) error
//{
//    
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    [dic setValueReal:username forKey:@"username"];
//    [dic setValueReal:[password md5] forKey:@"password"];
//    MKNetworkOperation *op = [self operationWithPath:@"mobileStudents/login" params:dic httpMethod:@"GET"];
//    
//    
//    [op addCompletionHandler:response errorHandler:error];
//    [self enqueueOperation:op];
//    
//    return op;
//    
//
//}




//检测网络
- (BOOL)checkIsWifiOrWWAN
{
    Reachability* currentInternetReach = [Reachability reachabilityForInternetConnection];
    
    if ([currentInternetReach isReachable]) {
        return YES;
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"没有链接网络" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
 
    return NO;
   
}

@end
