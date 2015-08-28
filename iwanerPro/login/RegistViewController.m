//
//  RegistViewController.m
//  iwanerPro
//
//  Created by MobbyDeveloper on 15/8/1.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import "RegistViewController.h"
#import "PrefectInfoViewController.h"
#import "LoginEnterViewController.h"
#import "LoginViewController.h"
#import "JKCountDownButton.h"

@interface RegistViewController ()

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidLayoutSubviews
{
    _userNameTextfied.keyboardType = UIKeyboardTypePhonePad;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)clickBackBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}



- (IBAction)regetAuthcodeBtn:(JKCountDownButton *)sender {
    
    sender.enabled = NO;
    [sender startWithSecond:60];
    
    if ([_userNameTextfied.text length] == 11  ) {
        
        NSString *number = @"^[0-9]*$";
        
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", number];
        BOOL isNumber = [pred evaluateWithObject:_userNameTextfied.text];
        if (isNumber) {
            
            
            [[HttpEngine sharedHttpEngine] sendIphoneNumberVerificationCode:_userNameTextfied.text onCompletionHandler:^(MKNetworkOperation *completedOperation) {
                
                NSDictionary *dic = [completedOperation responseJSON];
                NSLog(@"dic===1====%@",dic);
                
            } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error)
             {
                 NSDictionary *dic = [completedOperation responseJSON];
                 NSLog(@"dic===2====%@",dic);
             }];
    
            
            
        }
        
    }
    

    
    
    
    
    [sender didChange:^NSString *(JKCountDownButton *countDownButton,int second) {
        NSString *title = [NSString stringWithFormat:@"剩余%d秒",second];
        return title;
    }];
    
    
    [sender didFinished:^NSString *(JKCountDownButton *countDownButton, int second) {
        countDownButton.enabled = YES;
        return @"点击重新获取";
        
    }];
    
}



- (IBAction)clickFinishBtn:(id)sender {
    
    
    
//    if ([_userNameTextfied.text length] == 11  ) {
//        
//        NSString *number = @"^[0-9]*$";
//        
//        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", number];
//        BOOL isNumber = [pred evaluateWithObject:_userNameTextfied.text];
//        
//        
//        
//        
//        if (isNumber) {
//         
//            
//            
//        }
    
            
    
    [[HttpEngine sharedHttpEngine] signInIphoneNumber:_userNameTextfied.text
                                             password:[_pwdTextfield.text md5]
                                           verifyCode:_aurhcodeTextfield.text
                                                 type:@"1"
                                  onCompletionHandler:^(MKNetworkOperation *completedOperation) {
                                      
                                      
                                      NSDictionary *dic = [completedOperation responseJSON];
                                      if ([[dic objectForKey:@"errMsg"] nullTonil]) {
                                          if ([[dic objectForKey:@"errMsg"]isEqualToString:@"success"]) {
                                              
                                              PrefectInfoViewController *prefectVC = [[PrefectInfoViewController alloc]init];
                                              [self.navigationController pushViewController:prefectVC animated:YES];
                                              
                                          }else if ([[dic objectForKey:@"errMsg"] isEqualToString:@"fail"])
                                          {
                                              NSDictionary *dataDic = [[dic objectForKey:@"data"] nullTonil];
                                              if (dataDic) {
                                                  NSString *info = [[dataDic objectForKey:@"info"] nullTonil];
                                                  
                                                  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:info delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                                                  [alert show];
                                                  
                                              }
                                       
                                              
                                          }
                                      }
                                    
                                      NSLog(@"dic===1====%@",dic);
                                      
                                      
                              
                                      
                                      
                                      
                                  } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
                                      
                                      
                                      NSDictionary *dic = [completedOperation responseJSON];
                                      NSLog(@"dic===2====%@",dic);
                                      
                                      
                                  }];
    
    
    
}

#pragma mark UIAlertDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
}





- (IBAction)usePwdLogin:(id)sender {
    
    LoginEnterViewController *loginEnterVC = [[LoginEnterViewController alloc]init];
    [self.navigationController pushViewController:loginEnterVC animated:YES];
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
