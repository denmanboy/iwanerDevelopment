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



//1_注册之前发送手机验证码
- (MKNetworkOperation *)sendIphoneNumberVerificationCode:(NSString *)iphoneNumber
                                     onCompletionHandler:(MKNKResponseBlock) response
                                            errorHandler:(MKNKResponseErrorBlock) error;





//2_手机注册
- (MKNetworkOperation *)signInIphoneNumber:(NSString *)iphoneNumber
                                  password:(NSString *)password
                                verifyCode:(NSString *)verifyCode
                                      type:(NSString *)type
                       onCompletionHandler:(MKNKResponseBlock) response
                              errorHandler:(MKNKResponseErrorBlock) error;




////3_登录
- (MKNetworkOperation *)loginWithPhoneNumber:(NSString *)iphoneNumber
                                    password:(NSString *)password
                         onCompletionHandler:(MKNKResponseBlock) response
                                errorHandler:(MKNKResponseErrorBlock) error;






//4_完善资料
- (MKNetworkOperation *)complementUserInfoUsername:(NSString *)nickname
                                               dis:(NSString *)dis
                                               sex:(NSString *)sex
                                          industry:(NSString *)industry
                                             hobby:(NSString *)hobby
                                               img:(UIImage *)img
                                             label:(NSString *)label
                                           address:(NSString *)address
                               onCompletionHandler:(MKNKResponseBlock) response
                                      errorHandler:(MKNKResponseErrorBlock) error;




//5_退出登录
- (MKNetworkOperation *)logoutOnCompletionHandler:(MKNKResponseBlock) response
                                     errorHandler:(MKNKResponseErrorBlock) error;





//6_获取用户基本信息
- (MKNetworkOperation *)userBaseInfoOnCompletionHandler:(MKNKResponseBlock) response
                                           errorHandler:(MKNKResponseErrorBlock) error;




//7_修改密码
- (MKNetworkOperation *)modifyUserPasswordWithOldPassword:(NSString *)password
                                      onCompletionHandler:(MKNKResponseBlock) response
                                             errorHandler:(MKNKResponseErrorBlock) error;



//8_忘记密码
- (MKNetworkOperation *)forgetMyPasswordWithOldPassword:(NSString *)password
                                               username:(NSString *)username
                                             verifycode:(NSString *)verifycode
                                    onCompletionHandler:(MKNKResponseBlock) response
                                           errorHandler:(MKNKResponseErrorBlock) error;


//9_获取用户详细信息
- (MKNetworkOperation *)userDetailInfoOnCompletionHandler:(MKNKResponseBlock) response
                                             errorHandler:(MKNKResponseErrorBlock) error;




//10_获取主题列表
- (MKNetworkOperation *)userDetailInfoCurrentPage:(NSString *)p
                                          pagenum:(NSString *)pagenum
                                          looknum:(NSString *)looknum
                                          addtime:(NSString *)addtime
                                              lat:(NSString *)lat
                                              lng:(NSString *)lng
                              onCompletionHandler:(MKNKResponseBlock) response
                                     errorHandler:(MKNKResponseErrorBlock) error;




//11_添加玩友记
- (MKNetworkOperation *)addPlayDiaryContent:(NSString *)content
                                 uploadFile:(UIImage *)uploadFile
                        onCompletionHandler:(MKNKResponseBlock) response
                               errorHandler:(MKNKResponseErrorBlock) error;





//12_获取自己发布的主题列表
- (MKNetworkOperation *)getSelfPublicTopicOnCompletionHandler:(MKNKResponseBlock) response
                                                 errorHandler:(MKNKResponseErrorBlock) error;





//13_获取玩游记列表
- (MKNetworkOperation *)getplayListWithCurrentPage:(NSString *)p
                                           pagenum:(NSString *)pagenum
                               onCompletionHandler:(MKNKResponseBlock) response
                                      errorHandler:(MKNKResponseErrorBlock) error;




//14验证手机验证码
- (MKNetworkOperation *)judgeSendCodeIsRightWithCode:(NSString *)sendCode
                                 onCompletionHandler:(MKNKResponseBlock) response
                                        errorHandler:(MKNKResponseErrorBlock) error;


//检测网络链接
- (BOOL)checkIsWifiOrWWAN;




@end
