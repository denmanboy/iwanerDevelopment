//
//  HttpEngine.h
//  MobbyAssistant
//
//  Created by liyuanbo on 5/5/15.
//  Copyright (c) 2015 mobby. All rights reserved.
//

#import "MKNetworkEngine.h"
#import "IWKeyObject.h"
@interface HttpEngine : MKNetworkEngine
{
    Reachability* internetReach;
    NetworkStatus netStatus;
}

+ (HttpEngine *)sharedHttpEngine;



//手机注册
- (MKNetworkOperation *)sendIphoneNumberVerificationCode:(NSString *)iphoneNumber
                                     onCompletionHandler:(MKNKResponseBlock) response
                                            errorHandler:(MKNKResponseErrorBlock) error;





//手机注册
- (MKNetworkOperation *)signInIphoneNumber:(NSString *)iphoneNumber
                                  password:(NSString *)password
                                verifyCode:(NSString *)verifyCode
                                      type:(NSString *)type
                       onCompletionHandler:(MKNKResponseBlock) response
                              errorHandler:(MKNKResponseErrorBlock) error;




//登录
- (MKNetworkOperation *)loginWithPhoneNumber:(NSString *)iphoneNumber
                                  password:(NSString *)password
                       onCompletionHandler:(MKNKResponseBlock) response
                              errorHandler:(MKNKResponseErrorBlock) error;



//
////登陆
//- (MKNetworkOperation *)loginWithUsername:(NSString *)username
//                                 password:(NSString *)password
//                      onCompletionHandler:(MKNKResponseBlock) response
//                             errorHandler:(MKNKResponseErrorBlock) error;



//检测网络链接
- (BOOL)checkIsWifiOrWWAN;




@end
