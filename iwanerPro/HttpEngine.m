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

- (instancetype)init
{
    if (self = [super initWithHostName:HTTP_HOST]) {
    }
    return self;
}


//注册之前发送手机验证码
- (MKNetworkOperation *)sendIphoneNumberVerificationCode:(NSString *)iphoneNumber
                                     onCompletionHandler:(MKNKResponseBlock) response
                                            errorHandler:(MKNKResponseErrorBlock) error
{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSMutableArray *apiArray = [NSMutableArray array];
    
    
    
    //系统级参数
    [dic setObject:@"FW0KCZP6" forKey:@"app_key"];
    [dic setObject:@"1.0" forKey:@"v"];
    [dic setObject:@"iphone" forKey:@"client"];
    
    
    //api级参数
    [dic setObject:@"api" forKey:@"c"];
    [dic setObject:@"sendcode" forKey:@"a"];
    [dic setObject:iphoneNumber forKey:@"phone"];
    

    //api级别参数加上数据对象，与系统级别数据对象参与排序，加密
    IWKeyObject *keyObject1 = [IWKeyObject keyObjectWithKey:@"c" andObject:@"api"];
    IWKeyObject *keyObject2 = [IWKeyObject keyObjectWithKey:@"a" andObject:@"sendcode"];
    IWKeyObject *keyObject3 = [IWKeyObject keyObjectWithKey:@"phone" andObject:iphoneNumber];
    
    [apiArray addObject:keyObject1];
    [apiArray addObject:keyObject2];
    [apiArray addObject:keyObject3];


    //过去最后的加密sign值
    NSString *paramsStr = [self signValue:apiArray forGET:@"GET"];
    [dic setObject:paramsStr forKey:@"sign"];

    
     MKNetworkOperation *op = [self operationWithPath:nil params:dic httpMethod:@"GET"];
    
    [op addCompletionHandler:response errorHandler:error];
    [self enqueueOperation:op];
    
    
    return op;
}







//手机注册
- (MKNetworkOperation *)signInIphoneNumber:(NSString *)iphoneNumber
                                  password:(NSString *)password
                                verifyCode:(NSString *)verifyCode
                                      type:(NSString *)type
                       onCompletionHandler:(MKNKResponseBlock) response
                              errorHandler:(MKNKResponseErrorBlock) error
{
    
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSMutableArray *apiArray = [NSMutableArray array];
    
    
    
    //系统级参数
    [dic setObject:@"FW0KCZP6" forKey:@"app_key"];
    [dic setObject:@"1.0" forKey:@"v"];
    [dic setObject:@"iphone" forKey:@"client"];
    
    
    //api级参数
    [dic setObject:@"api" forKey:@"c"];
    [dic setObject:@"regist" forKey:@"a"];
    [dic setObject:password forKey:@"password"];
    [dic setObject:verifyCode forKey:@"verifycode"];
    [dic setObject:type forKey:@"type"];
    [dic setObject:iphoneNumber forKey:@"username"];
    
    
    //api级别参数加上数据对象，与系统级别数据对象参与排序，加密
    IWKeyObject *keyObject1 = [IWKeyObject keyObjectWithKey:@"c" andObject:@"api"];
    IWKeyObject *keyObject2 = [IWKeyObject keyObjectWithKey:@"a" andObject:@"regist"];
    IWKeyObject *keyObject3 = [IWKeyObject keyObjectWithKey:@"password" andObject:password];
    IWKeyObject *keyObject4 = [IWKeyObject keyObjectWithKey:@"verifycode" andObject:verifyCode];
    IWKeyObject *keyObject5 = [IWKeyObject keyObjectWithKey:@"type" andObject:type];
    IWKeyObject *keyObject6 = [IWKeyObject keyObjectWithKey:@"username" andObject:iphoneNumber];
    
    [apiArray addObject:keyObject1];
    [apiArray addObject:keyObject2];
    [apiArray addObject:keyObject3];
    [apiArray addObject:keyObject4];
    [apiArray addObject:keyObject5];
    [apiArray addObject:keyObject6];
    
    
    //过去最后的加密sign值
    NSString *paramsStr = [self signValue:apiArray forGET:@"POST"];
    [dic setObject:paramsStr forKey:@"sign"];
    
    
    MKNetworkOperation *op = [self operationWithPath:nil params:dic httpMethod:@"POST"];
    
    [op addCompletionHandler:response errorHandler:error];
    [self enqueueOperation:op];
    
    
    return op;
    
    
}



//登录
- (MKNetworkOperation *)loginWithPhoneNumber:(NSString *)iphoneNumber
                                    password:(NSString *)password
                         onCompletionHandler:(MKNKResponseBlock) response
                                errorHandler:(MKNKResponseErrorBlock) error
{

    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSMutableArray *apiArray = [NSMutableArray array];
    
    
    
    //系统级参数
    [dic setObject:@"FW0KCZP6" forKey:@"app_key"];
    [dic setObject:@"1.0" forKey:@"v"];
    [dic setObject:@"iphone" forKey:@"client"];
    
    
    //api级参数
    [dic setObject:@"api" forKey:@"m"];
    [dic setObject:@"login" forKey:@"a"];
    [dic setObject:password forKey:@"password"];
    [dic setObject:iphoneNumber forKey:@"username"];
    
    
    //api级别参数加上数据对象，与系统级别数据对象参与排序，加密
    IWKeyObject *keyObject1 = [IWKeyObject keyObjectWithKey:@"m" andObject:@"api"];
    IWKeyObject *keyObject2 = [IWKeyObject keyObjectWithKey:@"a" andObject:@"login"];
    IWKeyObject *keyObject3 = [IWKeyObject keyObjectWithKey:@"password" andObject:password];
    IWKeyObject *keyObject4 = [IWKeyObject keyObjectWithKey:@"username" andObject:iphoneNumber];
    
    [apiArray addObject:keyObject1];
    [apiArray addObject:keyObject2];
    [apiArray addObject:keyObject3];
    [apiArray addObject:keyObject4];
    
    
    //过去最后的加密sign值
    NSString *paramsStr = [self signValue:apiArray forGET:@"POST"];
    [dic setObject:paramsStr forKey:@"sign"];
    
    
    MKNetworkOperation *op = [self operationWithPath:nil params:dic httpMethod:@"POST"];
    
    [op addCompletionHandler:response errorHandler:error];
    [self enqueueOperation:op];
    
    return op;
    
}


#pragma mark  排序-拼接-加密-转码
- (NSString *)signValue:(NSMutableArray *)appLevelArray forGET:(NSString *)getOrPost
{
   
    NSMutableArray *systemArray = [NSMutableArray array];
    IWKeyObject *keyObject1 = [IWKeyObject keyObjectWithKey:@"app_key" andObject:@"FW0KCZP6"];
    IWKeyObject *keyObject2 = [IWKeyObject keyObjectWithKey:@"v" andObject:@"1.0"];
    IWKeyObject *keyObject3 = [IWKeyObject keyObjectWithKey:@"client" andObject:@"iphone"];
    
    [systemArray addObject:keyObject1];
    [systemArray addObject:keyObject2];
    [systemArray addObject:keyObject3];
    
    [systemArray addObjectsFromArray:appLevelArray];
    NSArray *arrayResultArray =  [self sortKeyObjectArray:systemArray];
    
    
    
    NSString *paramsStr = [[NSString alloc] init];
    
    for (NSInteger i = 0; i < arrayResultArray.count; i++)
    {
        IWKeyObject *keyObject = [arrayResultArray objectAtIndex:i];
        paramsStr = [paramsStr stringByAppendingString:keyObject.key];
        paramsStr = [paramsStr stringByAppendingString:keyObject.object];
        
    }

    
    paramsStr = [paramsStr stringByAppendingString:@"8f00b204e98009989rd45qoyjdddrx5l"];
    paramsStr = [paramsStr md5];
    paramsStr = [paramsStr uppercaseString];
    
    return paramsStr;
    
}



#pragma mark 对目标区域的答案数组进行排序
- (NSArray *)sortKeyObjectArray:(NSMutableArray *)answerArray
{
    
    NSArray *sortedArray = [answerArray sortedArrayUsingComparator:^NSComparisonResult(IWKeyObject *obj1, IWKeyObject *obj2)
    {
        NSComparisonResult result = [obj1.key compare:obj2.key];
        

        return result;
    }];

    return sortedArray;
}





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
