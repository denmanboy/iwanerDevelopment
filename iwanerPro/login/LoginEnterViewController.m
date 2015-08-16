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

@interface LoginEnterViewController ()<UMSocialUIDelegate,WXApiDelegate>

@end

@implementation LoginEnterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIView *view;
//    view.layer.cornerRadius
//    [self.navigationController.navigationBar setHidden:NO];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)clickBackBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)clickLogin:(id)sender {
    
    LoginViewController *loginVC = [((AppDelegate *)[[UIApplication sharedApplication] delegate]) loginViewController];
    if (loginVC.delegate && [loginVC.delegate respondsToSelector:@selector(loginauthenticationSuccess)]) {
        [loginVC.delegate loginauthenticationSuccess];
    }
    
    
}
- (IBAction)clickFindPwd:(id)sender {
    FindPwdViewController *findPwdVC = [[FindPwdViewController alloc]init];
    [self.navigationController pushViewController:findPwdVC animated:YES];
    
}
- (IBAction)wechatLogin:(id)sender {
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession];
    
    NSLog(@"%@",[UMSocialAccountManager socialAccountDictionary]);
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary]valueForKey:UMShareToWechatSession];
            
            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            
        }
        
    });
    
    
}
- (IBAction)qqLogin:(id)sender {
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
    
    
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        NSLog(@"response is %@",response);
        
        [[UMSocialDataService defaultDataService]
         requestSocialAccountWithCompletion:^(UMSocialResponseEntity *response) {
             NSLog(@"QQUserInfo name = %@",response.data);
         }];
    });

    
    
}
- (IBAction)weiboLogin:(id)sender {
    
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
