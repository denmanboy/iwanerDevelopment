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

@interface LoginEnterViewController ()

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
    
}
- (IBAction)qqLogin:(id)sender {
    
}
- (IBAction)weiboLogin:(id)sender {
    
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
