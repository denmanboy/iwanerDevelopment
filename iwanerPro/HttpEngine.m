//
//  HttpEngine.m
//  MobbyAssistant
//
//  Created by liyuanbo on 5/5/15.
//  Copyright (c) 2015 mobby. All rights reserved.
//

#import "HttpEngine.h"



#define Systerm_AppKey @"FW0KCZP6"
#define Systerm_Version @"1.0"
#define Systerm_Clinet @"iphone"
#define SystermAppSecret @"8f00b204e98009989rd45qoyjdddrx5l"


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
    [dic setValueReal:Systerm_AppKey forKey:@"app_key"];
    [dic setValueReal:Systerm_Version forKey:@"v"];
    [dic setValueReal:Systerm_Clinet forKey:@"client"];
    
    //api级参数
    [dic setValueReal:@"api" forKey:@"c"];
    [dic setValueReal:@"sendcode" forKey:@"a"];
    [dic setValueReal:iphoneNumber forKey:@"phone"];

    //api级别参数加上数据对象，与系统级别数据对象参与排序，加密
    IWKeyObject *keyObject1 = [IWKeyObject keyObjectWithKey:@"c" andObject:@"api"];
    IWKeyObject *keyObject2 = [IWKeyObject keyObjectWithKey:@"a" andObject:@"sendcode"];
    IWKeyObject *keyObject3 = [IWKeyObject keyObjectWithKey:@"phone" andObject:iphoneNumber];
    
    [apiArray addObject:keyObject1];
    [apiArray addObject:keyObject2];
    [apiArray addObject:keyObject3];

    //过去最后的加密sign值
    NSString *paramsStr = [self signValue:apiArray forGET:@"GET"];
    [dic setValueReal:paramsStr forKey:@"sign"];
     MKNetworkOperation *op = [self operationWithPath:nil params:dic httpMethod:@"GET"];
    
    [op addCompletionHandler:response errorHandler:error];
    [self enqueueOperation:op];
    
    return op;
}





//2_手机注册
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
    [dic setValueReal:Systerm_AppKey forKey:@"app_key"];
    [dic setValueReal:Systerm_Version forKey:@"v"];
    [dic setValueReal:Systerm_Clinet forKey:@"client"];
    
    //api级参数
    [dic setValueReal:@"api" forKey:@"c"];
    [dic setValueReal:@"regist" forKey:@"a"];
    [dic setValueReal:password forKey:@"password"];
    [dic setValueReal:verifyCode forKey:@"verifycode"];
    [dic setValueReal:type forKey:@"type"];
    [dic setValueReal:iphoneNumber forKey:@"username"];
    
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
    [dic setValueReal:paramsStr forKey:@"sign"];
    
    
    MKNetworkOperation *op = [self operationWithPath:nil params:dic httpMethod:@"POST"];
    
    [op addCompletionHandler:response errorHandler:error];
    [self enqueueOperation:op];
    
    
    return op;
    
    
}



//3_登录
- (MKNetworkOperation *)loginWithPhoneNumber:(NSString *)iphoneNumber
                                    password:(NSString *)password
                         onCompletionHandler:(MKNKResponseBlock) response
                                errorHandler:(MKNKResponseErrorBlock) error
{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSMutableArray *apiArray = [NSMutableArray array];

    //系统级参数
    [dic setValueReal:Systerm_AppKey forKey:@"app_key"];
    [dic setValueReal:Systerm_Version forKey:@"v"];
    [dic setValueReal:Systerm_Clinet forKey:@"client"];
    
    //api级参数
    [dic setValueReal:@"api" forKey:@"c"];
    [dic setValueReal:@"login" forKey:@"a"];
    [dic setValueReal:password forKey:@"password"];
    [dic setValueReal:iphoneNumber forKey:@"username"];
    
    //api级别参数加上数据对象，与系统级别数据对象参与排序，加密
    IWKeyObject *keyObject1 = [IWKeyObject keyObjectWithKey:@"c" andObject:@"api"];
    IWKeyObject *keyObject2 = [IWKeyObject keyObjectWithKey:@"a" andObject:@"login"];
    IWKeyObject *keyObject3 = [IWKeyObject keyObjectWithKey:@"password" andObject:password];
    IWKeyObject *keyObject4 = [IWKeyObject keyObjectWithKey:@"username" andObject:iphoneNumber];
    
    [apiArray addObject:keyObject1];
    [apiArray addObject:keyObject2];
    [apiArray addObject:keyObject3];
    [apiArray addObject:keyObject4];
    
    
    //过去最后的加密sign值
    NSString *paramsStr = [self signValue:apiArray forGET:@"POST"];
    [dic setValueReal:paramsStr forKey:@"sign"];
    
    
    MKNetworkOperation *op = [self operationWithPath:nil params:dic httpMethod:@"GET"];
    
    [op addCompletionHandler:response errorHandler:error];
    [self enqueueOperation:op];
    
    return op;
    
}



//4_完善资料
- (MKNetworkOperation *)complementUserInfoUsername:(NSString *)nickname
                                               dis:(NSString *)dis
                                               sex:(NSString *)sex
                                             img:(UIImage *)img
                               onCompletionHandler:(MKNKResponseBlock) response
                                      errorHandler:(MKNKResponseErrorBlock) error
{
    
    NSData *data = UIImageJPEGRepresentation(img, 0.1);
    if (data == nil) {
        data = UIImagePNGRepresentation(img);
    }
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSMutableArray *apiArray = [NSMutableArray array];
    
    //系统级参数
    [dic setValueReal:Systerm_AppKey forKey:@"app_key"];
    [dic setValueReal:Systerm_Version forKey:@"v"];
    [dic setValueReal:Systerm_Clinet forKey:@"client"];
    
    //api级参数
    [dic setValueReal:@"api" forKey:@"c"];
    [dic setValueReal:@"upuserinfo" forKey:@"a"];
    [dic setValueReal:dis forKey:@"dis"];
    [dic setValueReal:sex forKey:@"sex"];
    [dic setValueReal:data forKey:@"img"];
    
    IWKeyObject *keyObject1 = [IWKeyObject keyObjectWithKey:@"c" andObject:@"api"];
    IWKeyObject *keyObject2 = [IWKeyObject keyObjectWithKey:@"a" andObject:@"upuserinfo"];
    IWKeyObject *keyObject3 = [IWKeyObject keyObjectWithKey:@"dis" andObject:dis];
    IWKeyObject *keyObject4 = [IWKeyObject keyObjectWithKey:@"sex" andObject:sex];
    
    [apiArray addObject:keyObject1];
    [apiArray addObject:keyObject2];
    [apiArray addObject:keyObject3];
    [apiArray addObject:keyObject4];
    
    
    //过去最后的加密sign值
    NSString *paramsStr = [self signValue:apiArray forGET:@"POST"];
    [dic setValueReal:paramsStr forKey:@"sign"];
    
    MKNetworkOperation *op = [self operationWithPath:nil params:dic httpMethod:@"POST"];
    [op addCompletionHandler:response errorHandler:error];
    [self enqueueOperation:op];
    
    return op;
    
}


//5_退出登录
- (MKNetworkOperation *)logoutOnCompletionHandler:(MKNKResponseBlock) response
                                     errorHandler:(MKNKResponseErrorBlock) error
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSMutableArray *apiArray = [NSMutableArray array];
    
    //系统级参数
    [dic setValueReal:Systerm_AppKey forKey:@"app_key"];
    [dic setValueReal:Systerm_Version forKey:@"v"];
    [dic setValueReal:Systerm_Clinet forKey:@"client"];
    
    //api级参数
    [dic setValueReal:@"api" forKey:@"c"];
    [dic setValueReal:@"logout" forKey:@"a"];
    [dic setValueReal:@"token" forKey:@"token"];
    
    
    IWKeyObject *keyObject1 = [IWKeyObject keyObjectWithKey:@"c" andObject:@"api"];
    IWKeyObject *keyObject2 = [IWKeyObject keyObjectWithKey:@"a" andObject:@"logout"];
    IWKeyObject *keyObject3 = [IWKeyObject keyObjectWithKey:@"token" andObject:@"token"];
    
    [apiArray addObject:keyObject1];
    [apiArray addObject:keyObject2];
    [apiArray addObject:keyObject3];
    
    //过去最后的加密sign值
    NSString *paramsStr = [self signValue:apiArray forGET:@"POST"];
    [dic setValueReal:paramsStr forKey:@"sign"];
    
    MKNetworkOperation *op = [self operationWithPath:nil params:dic httpMethod:@"POST"];
    [op addCompletionHandler:response errorHandler:error];
    [self enqueueOperation:op];
    
    return op;
}


//6_获取用户基本信息
- (MKNetworkOperation *)userBaseInfoOnCompletionHandler:(MKNKResponseBlock) response
                                           errorHandler:(MKNKResponseErrorBlock) error
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSMutableArray *apiArray = [NSMutableArray array];
    
    //系统级参数
    [dic setValueReal:Systerm_AppKey forKey:@"app_key"];
    [dic setValueReal:Systerm_Version forKey:@"v"];
    [dic setValueReal:Systerm_Clinet forKey:@"client"];
    
    //api级参数
    [dic setValueReal:@"api" forKey:@"c"];
    [dic setValueReal:@"userbaseinfo" forKey:@"a"];
    [dic setValueReal:@"token" forKey:@"token"];
    
    
    IWKeyObject *keyObject1 = [IWKeyObject keyObjectWithKey:@"c" andObject:@"api"];
    IWKeyObject *keyObject2 = [IWKeyObject keyObjectWithKey:@"a" andObject:@"userbaseinfo"];
    IWKeyObject *keyObject3 = [IWKeyObject keyObjectWithKey:@"token" andObject:@"token"];
    
    [apiArray addObject:keyObject1];
    [apiArray addObject:keyObject2];
    [apiArray addObject:keyObject3];
    
    //过去最后的加密sign值
    NSString *paramsStr = [self signValue:apiArray forGET:@"GET"];
    [dic setValueReal:paramsStr forKey:@"sign"];
    
    MKNetworkOperation *op = [self operationWithPath:nil params:dic httpMethod:@"GET"];
    [op addCompletionHandler:response errorHandler:error];
    [self enqueueOperation:op];
    
    return op;
}



//7_修改密码
- (MKNetworkOperation *)modifyUserPasswordWithOldPassword:(NSString *)password
                                      onCompletionHandler:(MKNKResponseBlock) response
                                             errorHandler:(MKNKResponseErrorBlock) error
{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSMutableArray *apiArray = [NSMutableArray array];
    
    //系统级参数
    [dic setValueReal:Systerm_AppKey forKey:@"app_key"];
    [dic setValueReal:Systerm_Version forKey:@"v"];
    [dic setValueReal:Systerm_Clinet forKey:@"client"];
    
    //api级参数
    [dic setValueReal:@"api" forKey:@"c"];
    [dic setValueReal:@"changepwd" forKey:@"a"];
    [dic setValueReal:@"token" forKey:@"token"];
    [dic setValueReal:password forKey:@"password"];
    
    
    IWKeyObject *keyObject1 = [IWKeyObject keyObjectWithKey:@"c" andObject:@"api"];
    IWKeyObject *keyObject2 = [IWKeyObject keyObjectWithKey:@"a" andObject:@"changepwd"];
    IWKeyObject *keyObject3 = [IWKeyObject keyObjectWithKey:@"token" andObject:@"token"];
    IWKeyObject *keyObject4 = [IWKeyObject keyObjectWithKey:@"password" andObject:password];
    
    [apiArray addObject:keyObject1];
    [apiArray addObject:keyObject2];
    [apiArray addObject:keyObject3];
    [apiArray addObject:keyObject4];
    
    //过去最后的加密sign值
    NSString *paramsStr = [self signValue:apiArray forGET:@"GET"];
    [dic setValueReal:paramsStr forKey:@"sign"];
    
    MKNetworkOperation *op = [self operationWithPath:nil params:dic httpMethod:@"GET"];
    [op addCompletionHandler:response errorHandler:error];
    [self enqueueOperation:op];
    
    return op;
    
    
}




//8_忘记密码
- (MKNetworkOperation *)forgetMyPasswordWithOldPassword:(NSString *)password
                                                 username:(NSString *)username
                                               verifycode:(NSString *)verifycode
                                      onCompletionHandler:(MKNKResponseBlock) response
                                             errorHandler:(MKNKResponseErrorBlock) error
{
    
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSMutableArray *apiArray = [NSMutableArray array];
    
    //系统级参数
    [dic setValueReal:Systerm_AppKey forKey:@"app_key"];
    [dic setValueReal:Systerm_Version forKey:@"v"];
    [dic setValueReal:Systerm_Clinet forKey:@"client"];
    
    //api级参数
    [dic setValueReal:@"api" forKey:@"c"];
    [dic setValueReal:@"forgetpwd" forKey:@"a"];
    [dic setValueReal:username forKey:@"username"];
    [dic setValueReal:verifycode forKey:@"verifycode"];
    [dic setValueReal:password forKey:@"password"];
    
    
    IWKeyObject *keyObject1 = [IWKeyObject keyObjectWithKey:@"c" andObject:@"api"];
    IWKeyObject *keyObject2 = [IWKeyObject keyObjectWithKey:@"a" andObject:@"forgetpwd"];
    IWKeyObject *keyObject3 = [IWKeyObject keyObjectWithKey:@"username" andObject:username];
    IWKeyObject *keyObject4 = [IWKeyObject keyObjectWithKey:@"verifycode" andObject:verifycode];
    IWKeyObject *keyObject5 = [IWKeyObject keyObjectWithKey:@"password" andObject:password];
    
    [apiArray addObject:keyObject1];
    [apiArray addObject:keyObject2];
    [apiArray addObject:keyObject3];
    [apiArray addObject:keyObject4];
    [apiArray addObject:keyObject5];
    
    //过去最后的加密sign值
    NSString *paramsStr = [self signValue:apiArray forGET:@"GET"];
    [dic setValueReal:paramsStr forKey:@"sign"];
    
    MKNetworkOperation *op = [self operationWithPath:nil params:dic httpMethod:@"GET"];
    [op addCompletionHandler:response errorHandler:error];
    [self enqueueOperation:op];
    
    return op;
    
    
}

//9_获取用户详细信息
- (MKNetworkOperation *)userDetailInfoOnCompletionHandler:(MKNKResponseBlock) response
                                             errorHandler:(MKNKResponseErrorBlock) error
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSMutableArray *apiArray = [NSMutableArray array];
    
    //系统级参数
    [dic setValueReal:Systerm_AppKey forKey:@"app_key"];
    [dic setValueReal:Systerm_Version forKey:@"v"];
    [dic setValueReal:Systerm_Clinet forKey:@"client"];
    
    //api级参数
    [dic setValueReal:@"api" forKey:@"c"];
    [dic setValueReal:@"userdetail" forKey:@"a"];
    [dic setValueReal:@"token" forKey:@"token"];
    
    
    IWKeyObject *keyObject1 = [IWKeyObject keyObjectWithKey:@"c" andObject:@"api"];
    IWKeyObject *keyObject2 = [IWKeyObject keyObjectWithKey:@"a" andObject:@"userdetail"];
    IWKeyObject *keyObject3 = [IWKeyObject keyObjectWithKey:@"token" andObject:@"token"];
    
    [apiArray addObject:keyObject1];
    [apiArray addObject:keyObject2];
    [apiArray addObject:keyObject3];
    
    //过去最后的加密sign值
    NSString *paramsStr = [self signValue:apiArray forGET:@"GET"];
    [dic setValueReal:paramsStr forKey:@"sign"];
    
    MKNetworkOperation *op = [self operationWithPath:nil params:dic httpMethod:@"GET"];
    [op addCompletionHandler:response errorHandler:error];
    [self enqueueOperation:op];
    
    return op;
}





//10_获取主题列表
- (MKNetworkOperation *)userDetailInfoCurrentPage:(NSString *)p
                                          pagenum:(NSString *)pagenum
                                          looknum:(NSString *)looknum
                                          addtime:(NSString *)addtime
                                              lat:(NSString *)lat
                                              lng:(NSString *)lng
                              onCompletionHandler:(MKNKResponseBlock) response
                                     errorHandler:(MKNKResponseErrorBlock) error
{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSMutableArray *apiArray = [NSMutableArray array];
    
    //系统级参数
    [dic setValueReal:Systerm_AppKey forKey:@"app_key"];
    [dic setValueReal:Systerm_Version forKey:@"v"];
    [dic setValueReal:Systerm_Clinet forKey:@"client"];
    
    //api级参数
    [dic setValueReal:@"api" forKey:@"c"];
    [dic setValueReal:@"gettopiclist" forKey:@"a"];
    [dic setValueReal:@"token" forKey:@"token"];
    [dic setValueReal:p forKey:@"p"];
    [dic setValueReal:pagenum forKey:@"pagenum"];
    [dic setValueReal:looknum forKey:@"looknum"];
    [dic setValueReal:addtime forKey:@"addtime"];
    [dic setValueReal:lat forKey:@"lat"];
    [dic setValueReal:lng forKey:@"lng"];
    
    
    
    IWKeyObject *keyObject1 = [IWKeyObject keyObjectWithKey:@"c" andObject:@"api"];
    IWKeyObject *keyObject2 = [IWKeyObject keyObjectWithKey:@"a" andObject:@"gettopiclist"];
    IWKeyObject *keyObject3 = [IWKeyObject keyObjectWithKey:@"token" andObject:@"token"];
    IWKeyObject *keyObject4 = [IWKeyObject keyObjectWithKey:@"p" andObject:p];
    IWKeyObject *keyObject5 = [IWKeyObject keyObjectWithKey:@"pagenum" andObject:pagenum];
    IWKeyObject *keyObject6 = [IWKeyObject keyObjectWithKey:@"looknum" andObject:looknum];
    IWKeyObject *keyObject7 = [IWKeyObject keyObjectWithKey:@"addtime" andObject:addtime];
    IWKeyObject *keyObject8 = [IWKeyObject keyObjectWithKey:@"lat" andObject:lat];
    IWKeyObject *keyObject9 = [IWKeyObject keyObjectWithKey:@"lng" andObject:lng];
    
    [apiArray addObject:keyObject1];
    [apiArray addObject:keyObject2];
    [apiArray addObject:keyObject3];
    [apiArray addObject:keyObject4];
    [apiArray addObject:keyObject5];
    [apiArray addObject:keyObject6];
    [apiArray addObject:keyObject7];
    [apiArray addObject:keyObject8];
    [apiArray addObject:keyObject9];
    
    //过去最后的加密sign值
    NSString *paramsStr = [self signValue:apiArray forGET:@"GET"];
    [dic setValueReal:paramsStr forKey:@"sign"];
    
    MKNetworkOperation *op = [self operationWithPath:nil params:dic httpMethod:@"GET"];
    [op addCompletionHandler:response errorHandler:error];
    [self enqueueOperation:op];
    
    return op;
    
    
    
}


//11_添加玩友记
- (MKNetworkOperation *)addPlayDiaryContent:(NSString *)content
                                 uploadFile:(UIImage *)uploadFile
                        onCompletionHandler:(MKNKResponseBlock) response
                               errorHandler:(MKNKResponseErrorBlock) error
{
    
    
    NSData *data = UIImageJPEGRepresentation(uploadFile, 0.1);
    if (data == nil) {
        data = UIImagePNGRepresentation(uploadFile);
    }
    
    
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSMutableArray *apiArray = [NSMutableArray array];
    
    //系统级参数
    [dic setValueReal:Systerm_AppKey forKey:@"app_key"];
    [dic setValueReal:Systerm_Version forKey:@"v"];
    [dic setValueReal:Systerm_Clinet forKey:@"client"];
    
    //api级参数
    [dic setValueReal:@"api" forKey:@"c"];
    [dic setValueReal:@"adddiary" forKey:@"a"];
    [dic setValueReal:@"token" forKey:@"token"];
    [dic setValueReal:content forKey:@"content"];
    [dic setValueReal:data forKey:@"uploadFile"];
    
    
    
    IWKeyObject *keyObject1 = [IWKeyObject keyObjectWithKey:@"c" andObject:@"api"];
    IWKeyObject *keyObject2 = [IWKeyObject keyObjectWithKey:@"a" andObject:@"adddiary"];
    IWKeyObject *keyObject3 = [IWKeyObject keyObjectWithKey:@"token" andObject:@"token"];
    IWKeyObject *keyObject4 = [IWKeyObject keyObjectWithKey:@"content" andObject:content];
    
    [apiArray addObject:keyObject1];
    [apiArray addObject:keyObject2];
    [apiArray addObject:keyObject3];
    [apiArray addObject:keyObject4];
    
    //过去最后的加密sign值
    NSString *paramsStr = [self signValue:apiArray forGET:@"GET"];
    [dic setValueReal:paramsStr forKey:@"sign"];
    
    MKNetworkOperation *op = [self operationWithPath:nil params:dic httpMethod:@"GET"];
    [op addCompletionHandler:response errorHandler:error];
    [self enqueueOperation:op];
    
    return op;
    
}



//12_获取自己发布的主题列表
- (MKNetworkOperation *)getSelfPublicTopicOnCompletionHandler:(MKNKResponseBlock) response
                                                 errorHandler:(MKNKResponseErrorBlock) error
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSMutableArray *apiArray = [NSMutableArray array];
    
    //系统级参数
    [dic setValueReal:Systerm_AppKey forKey:@"app_key"];
    [dic setValueReal:Systerm_Version forKey:@"v"];
    [dic setValueReal:Systerm_Clinet forKey:@"client"];
    
    //api级参数
    [dic setValueReal:@"api" forKey:@"c"];
    [dic setValueReal:@"getusertopic" forKey:@"a"];
    [dic setValueReal:@"token" forKey:@"token"];
    
    
    
    IWKeyObject *keyObject1 = [IWKeyObject keyObjectWithKey:@"c" andObject:@"api"];
    IWKeyObject *keyObject2 = [IWKeyObject keyObjectWithKey:@"a" andObject:@"getusertopic"];
    IWKeyObject *keyObject3 = [IWKeyObject keyObjectWithKey:@"token" andObject:@"token"];

    
    [apiArray addObject:keyObject1];
    [apiArray addObject:keyObject2];
    [apiArray addObject:keyObject3];
    
    //过去最后的加密sign值
    NSString *paramsStr = [self signValue:apiArray forGET:@"GET"];
    [dic setValueReal:paramsStr forKey:@"sign"];
    
    MKNetworkOperation *op = [self operationWithPath:nil params:dic httpMethod:@"GET"];
    [op addCompletionHandler:response errorHandler:error];
    [self enqueueOperation:op];
    
    return op;
}




//13_获取玩游记列表
- (MKNetworkOperation *)getplayListWithCurrentPage:(NSString *)p
                                           pagenum:(NSString *)pagenum
                               onCompletionHandler:(MKNKResponseBlock) response
                                      errorHandler:(MKNKResponseErrorBlock) error
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSMutableArray *apiArray = [NSMutableArray array];
    
    //系统级参数
    [dic setValueReal:Systerm_AppKey forKey:@"app_key"];
    [dic setValueReal:Systerm_Version forKey:@"v"];
    [dic setValueReal:Systerm_Clinet forKey:@"client"];
    
    //api级参数
    [dic setValueReal:@"api" forKey:@"c"];
    [dic setValueReal:@"getdiarylist" forKey:@"a"];
    [dic setValueReal:@"token" forKey:@"token"];
    [dic setValueReal:p forKey:@"p"];
    [dic setValueReal:pagenum forKey:@"pagenum"];
    
    
    IWKeyObject *keyObject1 = [IWKeyObject keyObjectWithKey:@"c" andObject:@"api"];
    IWKeyObject *keyObject2 = [IWKeyObject keyObjectWithKey:@"a" andObject:@"getdiarylist"];
    IWKeyObject *keyObject3 = [IWKeyObject keyObjectWithKey:@"token" andObject:@"token"];
    IWKeyObject *keyObject4 = [IWKeyObject keyObjectWithKey:@"p" andObject:p];
    IWKeyObject *keyObject5 = [IWKeyObject keyObjectWithKey:@"pagenum" andObject:pagenum];
    
    
    [apiArray addObject:keyObject1];
    [apiArray addObject:keyObject2];
    [apiArray addObject:keyObject3];
    [apiArray addObject:keyObject4];
    [apiArray addObject:keyObject5];
    
    
    
    //过去最后的加密sign值
    NSString *paramsStr = [self signValue:apiArray forGET:@"GET"];
    [dic setValueReal:paramsStr forKey:@"sign"];
    
    MKNetworkOperation *op = [self operationWithPath:nil params:dic httpMethod:@"GET"];
    [op addCompletionHandler:response errorHandler:error];
    [self enqueueOperation:op];
    
    return op;
    
    
}

#pragma mark  排序-拼接-加密-转码
- (NSString *)signValue:(NSMutableArray *)appLevelArray forGET:(NSString *)getOrPost
{
   
    NSMutableArray *systemArray = [NSMutableArray array];
    IWKeyObject *keyObject1 = [IWKeyObject keyObjectWithKey:@"app_key" andObject:Systerm_AppKey];
    IWKeyObject *keyObject2 = [IWKeyObject keyObjectWithKey:@"v" andObject:Systerm_Version];
    IWKeyObject *keyObject3 = [IWKeyObject keyObjectWithKey:@"client" andObject:Systerm_Clinet];
    
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

    
    paramsStr = [paramsStr stringByAppendingString:SystermAppSecret];
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
