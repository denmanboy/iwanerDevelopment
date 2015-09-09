//
//  LoginEnterViewController.m
//  iwanerPro
//
//  Created by MobbyDeveloper on 15/8/1.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import "LoginEnterViewController.h"
#import "LoginViewController.h"
#import "FindPwdViewController.h"
#import "AppDelegate.h"
#import "UMSocial.h"



#import "PrefectInfoViewController.h"

@interface LoginEnterViewController ()<UMSocialUIDelegate,WXApiDelegate>

@end

@implementation LoginEnterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    
}


- (void)viewDidLayoutSubviews
{
    _userNameTextFiled.keyboardType = UIKeyboardTypePhonePad;
    _userNameTextFiled.delegate = self;
    _userNameTextFiled.returnKeyType = UIReturnKeyDone;
    
    _userPwdTextfield.returnKeyType =  UIReturnKeyDone;
    _userPwdTextfield.delegate = self;
    _userPwdTextfield.secureTextEntry = YES;
    
}





- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    IWUserInfo *info = [IWUserInfo sharedIWUserInfo];
    if (info.iphoneSizeType == IPHONE_SIZE_TYPE_4s) {
        
        [textField resignFirstResponder];
        
    }
    return YES;
}




- (IBAction)clickBackBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}



- (IBAction)clickLogin:(id)sender {
    
    
    
    if ([_userNameTextFiled.text length] == 0 || [_userPwdTextfield.text length] == 0) {
        
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"账号或密码为空"
                                                       delegate:self cancelButtonTitle:@"确认"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
        
    }
    
    NSString *number = @"^[0-9]*$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", number];
    BOOL isNumber = [pred evaluateWithObject:_userNameTextFiled.text];
    if (isNumber == NO || [_userNameTextFiled.text length] != 11)
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"请输入11位手机号"
                                                       delegate:self cancelButtonTitle:@"确认"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
        
    }

    
    IWUserInfo * userInfo = [IWUserInfo sharedIWUserInfo];
    
    
    [MBProgressHUD showHUDAddedTo:WINDOW animated:YES];
    
    
    WS(weakSelf);
    [[HttpEngine sharedHttpEngine] loginWithPhoneNumber:_userNameTextFiled.text
                                               password:[_userPwdTextfield.text md5]
                                    onCompletionHandler:^(MKNetworkOperation *completedOperation) {
                                       
                                        
                                        [MBProgressHUD hideHUDForView:WINDOW animated:YES];
                                        
                                        
                                        NSDictionary *dic = [completedOperation responseJSON];
                                        
//                                        NSLog(@"dic=======%@",dic);
                                        
                                        
                                        NSString *errMsg = [[dic objectForKey:@"errMsg"] nullTonil];
                                        if (errMsg)
                                        {
                                            if ([errMsg isEqualToString:@"success"]) {
                                                
                                                NSDictionary *dataDic = [[dic objectForKey:@"data"] nullTonil];
                                                if (dataDic)
                                                {
                                                    
                                                    userInfo.token = [[dataDic objectForKey:@"token"] nullTonil];
                                                    
                                                    

                                                    [weakSelf loginSuccessRetureView];
                                                    
                                                    
                                                }
                                                
                                            }else if ([errMsg isEqualToString:@"fail"])
                                            {
                                                
                                                NSDictionary *dataDic = [[dic objectForKey:@"data"] nullTonil];
                                                if (dataDic)
                                                {
                                                    
                                                    NSString *info = [[dataDic objectForKey:@"info"] nullTonil];
                                                    if (info) {
                                                        
                                                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                                                        message:info
                                                                                                       delegate:self cancelButtonTitle:@"确认"
                                                                                              otherButtonTitles:nil, nil];
                                                        [alert show];
                                                        
                                                    }
                                                    
                                                }
                                                
                                            }
                                            
                                        }
                                     
                                    
                                    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
                                        
                                        
                                        
                                        [MBProgressHUD hideHUDForView:WINDOW animated:YES];
//                                        NSDictionary *dic = [completedOperation responseJSON];
                                        
                                        
                                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                                        message:@"登录异常"
                                                                                       delegate:self cancelButtonTitle:@"确认"
                                                                              otherButtonTitles:nil, nil];
                                        [alert show];
                                        
//                                        NSLog(@"dic====2===%@",dic);
                                        
                                        
                                    }];
    
    
    
}


- (void)loginSuccessRetureView
{
    LoginViewController *loginVC = [((AppDelegate *)[[UIApplication sharedApplication] delegate]) loginViewController];
    if (loginVC.delegate && [loginVC.delegate respondsToSelector:@selector(loginAuthenticationSuccess)]) {
        [loginVC.delegate loginAuthenticationSuccess];
    }

}



//#pragma mark ------- 测试接口：获取用户基本资料
//- (void)userBaseInfo
//{
//    
//    
//    IWUserInfo *userInfo = [IWUserInfo sharedIWUserInfo];
//    
//    
//    [[HttpEngine sharedHttpEngine]userBaseInfoOnCompletionHandler:^(MKNetworkOperation *completedOperation) {
//        
//        
//        NSDictionary *dic = [completedOperation responseJSON];
//        
//        NSLog(@"dic=======%@",dic);
//        
//        NSDictionary *dataDic = [[dic objectForKey:@"data"] nullTonil];
//        if (dataDic) {
//            
//            NSDictionary *userDic = [[dataDic objectForKey:@"user"] nullTonil];
//            if (userDic) {
//                
//                [userInfo setValuesForKeysWithDictionary:userDic];
//            }
//        }
//    
//        
//    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
//        
//        
//        NSDictionary *dic = [completedOperation responseJSON];
//        
//        NSLog(@"dic====2===%@",dic);
//        
//        
//    } ];
//}
//
//
//
//#pragma mark ------- 测试接口：获取用户详细资料
//- (void)useDetailInfo
//{
//    [[HttpEngine sharedHttpEngine] userDetailInfoOnCompletionHandler:^(MKNetworkOperation *completedOperation) {
//        
//        
//        NSDictionary *dic = [completedOperation responseJSON];
//        
//        NSLog(@"dic=========detail====%@",dic);
//        
//    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
//        
//        NSDictionary *dic = [completedOperation responseJSON];
//        
//        NSLog(@"dic=========detail2====%@",dic);
//
//        
//        
//    }];
//    
//    
//}
//
//
//#pragma mark ------- 测试接口：发送验证码
//- (void)sendMessage
//{
//    
//    [[HttpEngine sharedHttpEngine] sendIphoneNumberVerificationCode:@"18911158938" onCompletionHandler:^(MKNetworkOperation *completedOperation) {
//        
//        NSDictionary *dic = [completedOperation responseJSON];
//        NSLog(@"dic===1====%@",dic);
//        
//    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error)
//     {
//         NSDictionary *dic = [completedOperation responseJSON];
//         NSLog(@"dic===2====%@",dic);
//     }];
//
//    
//}
//
//
//#pragma mark ------- 测试接口：忘记密码
//- (void)forgetPassword
//{
//    
//    IWUserInfo *userInfo = [IWUserInfo sharedIWUserInfo];
//    
//    [[HttpEngine sharedHttpEngine] forgetMyPasswordWithOldPassword:userInfo.password
//                                                          username:@"18911158938"
//                                                        verifycode:@"263894"
//                                               onCompletionHandler:^(MKNetworkOperation *completedOperation) {
//                                                   
//                                                   NSDictionary *dic = [completedOperation responseJSON];
//                                                   
//                                                   NSLog(@"dic=========forget====%@",dic);
//                                                   
//                                               } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
//                                                  
//                                                   
//                                                   NSDictionary *dic = [completedOperation responseJSON];
//                                                   
//                                                   NSLog(@"dic=========forgets====%@",dic);
//                                                   
//                                                   
//                                               }];
//    
//}
//
//#pragma mark ------- 测试接口：修改密码
//- (void)modifyOldPassword
//{
//    IWUserInfo *usetInfo = [IWUserInfo sharedIWUserInfo];
//
//    [[HttpEngine sharedHttpEngine] modifyUserPasswordWithOldPassword:usetInfo.password
//                                                 onCompletionHandler:^(MKNetworkOperation *completedOperation) {
//                                                     
//                                                     NSDictionary *dic = [completedOperation responseJSON];
//                                                        NSLog(@"dic=========modify====%@",dic);
//                                                     
//                                                     
//                                                 } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
//                                                     
//                                                     
//                                                     NSDictionary *dic = [completedOperation responseJSON];
//                                                    NSLog(@"dic=========modify====%@",dic);
//                                                     
//                                                 }];
//
//}
//
//
//
//#pragma mark ------- 测试接口：退出登录
//- (void)logoutForUser
//{
//    
//    [[HttpEngine sharedHttpEngine] logoutOnCompletionHandler:^(MKNetworkOperation *completedOperation) {
//        
//        NSDictionary *dic = [completedOperation responseJSON];
//        NSLog(@"dic===out====%@",dic);
//        
//    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
//        
//        
//        NSDictionary *dic = [completedOperation responseJSON];
//        NSLog(@"dic==out2=====%@",dic);
//        
//    }];
//    
//}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
}





- (IBAction)clickFindPwd:(id)sender
{
    FindPwdViewController *findPwdVC = [[FindPwdViewController alloc]init];
    [self.navigationController pushViewController:findPwdVC animated:YES];
    
}



#pragma mark 微信登陆
- (IBAction)wechatLogin:(id)sender
{
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession];
    
    NSLog(@"%@",[UMSocialAccountManager socialAccountDictionary]);
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary]valueForKey:UMShareToWechatSession];
            
            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            
        }
        
    });

}




#pragma mark qq登陆
- (IBAction)qqLogin:(id)sender
{
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
    
    
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        NSLog(@"response is %@",response);
        
        [[UMSocialDataService defaultDataService]
         requestSocialAccountWithCompletion:^(UMSocialResponseEntity *response) {
             NSLog(@"QQUserInfo name = %@",response.data);
         }];
    });

}

#pragma mark 微博登陆
- (IBAction)weiboLogin:(id)sender
{
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            NSLog(@"++++++%@",[UMSocialAccountManager socialAccountDictionary]);
            
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToSina];
            
            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            
        }});
    

    
}

//实现授权回调
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    if (response.viewControllerType == UMSViewControllerOauth) {
        
        NSLog(@"didFinishOauthAndGetAccount response is %@",response);
        
    }
    
    NSLog(@"%@",response);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
