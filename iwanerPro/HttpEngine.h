//
//  HttpEngine.h
//  MobbyAssistant
//
//  Created by liyuanbo on 5/5/15.
//  Copyright (c) 2015 mobby. All rights reserved.
//

#import "MKNetworkEngine.h"

@interface HttpEngine : MKNetworkEngine
{
    Reachability* internetReach;
    NetworkStatus netStatus;
}

//+ (HttpEngine *)sharedHttpEngine;
//
////登陆
//- (MKNetworkOperation *)loginWithUsername:(NSString *)username
//                                 password:(NSString *)password
//                      onCompletionHandler:(MKNKResponseBlock) response
//                             errorHandler:(MKNKResponseErrorBlock) error;



//检测网络链接
- (BOOL)checkIsWifiOrWWAN;




@end
