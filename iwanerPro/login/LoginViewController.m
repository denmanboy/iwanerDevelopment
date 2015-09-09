//
//  LoginViewController.m
//  iwanerPro
//
//  Created by MobbyDeveloper on 15/8/1.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setHidden:YES];
    
    
//    if (_delegate && [_delegate respondsToSelector:@selector(loginauthenticationSuccess)]) {
//        [_delegate loginauthenticationSuccess];
//    }
    
    // Do any additional setup after loading the view from its nib.
    
}



- (IBAction)clickLogin:(id)sender {
    _loginEnterVC = [[LoginEnterViewController alloc]init];
    
    [self.navigationController pushViewController:_loginEnterVC animated:YES];
}


- (IBAction)clickRegist:(id)sender
{
    
    
//    [[HttpEngine sharedHttpEngine] sendIphoneNumberVerificationCode:@"18911158938"
//                                                onCompletionHandler:^(MKNetworkOperation *completedOperation) {
//                                                    
//                                                    NSDictionary *dic = [completedOperation responseJSON];
//                                                    NSLog(@"ddd===1===%@",dic);
//        
//    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
//        
//        
//        NSDictionary *dic = [completedOperation responseJSON];
//        NSLog(@"ddd====2==%@",dic);
//        
//    }];
    
    NSLog(@"ddd===3===");
    
    _registVC = [[RegistViewController alloc]init];
    [self.navigationController pushViewController:_registVC animated:YES];
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
