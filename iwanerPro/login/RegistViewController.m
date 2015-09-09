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

- (void)viewDidLoad
{
    [super viewDidLoad];
}




//代码布局视图
- (void)viewDidLayoutSubviews
{
    _userNameTextfied.keyboardType = UIKeyboardTypePhonePad;
    _userNameTextfied.delegate = self;
    
    _aurhcodeTextfield.returnKeyType = UIReturnKeyDone;
    _aurhcodeTextfield.delegate = self;
    
    
    _pwdTextfield.secureTextEntry = YES;
    _pwdTextfield.delegate = self;
    _pwdTextfield.returnKeyType = UIReturnKeyDone;
    
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    IWUserInfo *info = [IWUserInfo sharedIWUserInfo];
    
    if (info.iphoneSizeType == IPHONE_SIZE_TYPE_4s) {
        
            
            [UIView animateWithDuration:0.3 animations:^{
                
                self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                
            } completion:^(BOOL finished) {
                
            }];
        
        [textField resignFirstResponder];
        
    }
    
    return YES;
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    
    IWUserInfo *info = [IWUserInfo sharedIWUserInfo];
    
    if (info.iphoneSizeType == IPHONE_SIZE_TYPE_4s) {
        
        
        if (_aurhcodeTextfield == textField) {
            
            [UIView animateWithDuration:0.3 animations:^{
                
                self.view.frame = CGRectMake(0, -70, SCREEN_WIDTH, SCREEN_HEIGHT + 70);
                
            } completion:^(BOOL finished) {
                
            }];
        }
        
        if (_pwdTextfield == textField) {
            
            [UIView animateWithDuration:0.3 animations:^{
                
                self.view.frame = CGRectMake(0, -100, SCREEN_WIDTH, SCREEN_HEIGHT + 100);
                
            } completion:^(BOOL finished) {
                
            }];
        }
        
        if (_userNameTextfied == textField) {
            
            [UIView animateWithDuration:0.3 animations:^{
                
                self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT );
                
            } completion:^(BOOL finished) {
                
            }];
            
        }
        
        
    }

    
    return YES;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}




- (IBAction)clickBackBtn:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}



- (IBAction)regetAuthcodeBtn:(JKCountDownButton *)sender
{
    
    if ([_userNameTextfied.text length] > 0)
    {
        
        NSString *number = @"^[0-9]*$";
        
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", number];
        BOOL isNumber = [pred evaluateWithObject:_userNameTextfied.text];

        
        if ([_userNameTextfied.text length] == 11 &&  isNumber == YES) {
            
            
            sender.enabled = NO;
            [sender startWithSecond:60];
            
            [sender didChange:^NSString *(JKCountDownButton *countDownButton,int second) {
                NSString *title = [NSString stringWithFormat:@"剩余%d秒",second];
                return title;
            }];
            
            
            [sender didFinished:^NSString *(JKCountDownButton *countDownButton, int second) {
                countDownButton.enabled = YES;
                return @"点击重新获取";
                
            }];
            
            
            
            [[HttpEngine sharedHttpEngine] sendIphoneNumberVerificationCode:_userNameTextfied.text onCompletionHandler:^(MKNetworkOperation *completedOperation) {
                
                NSDictionary *dic = [completedOperation responseJSON];
                NSLog(@"dic===1====%@",dic);
                
            } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error)
             {
                 NSDictionary *dic = [completedOperation responseJSON];
                 NSLog(@"dic===2====%@",dic);
             }];
            
            
        }else
        {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入11位手机号" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            return;
            
        }
        
        
        
    }else
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"手机号为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        return;
        
    }
    
    

}



- (IBAction)clickFinishBtn:(id)sender {
    
    
    
    [_userNameTextfied resignFirstResponder];
    [_pwdTextfield resignFirstResponder];
    [_aurhcodeTextfield resignFirstResponder];
    
    [UIView animateWithDuration:0.3 animations:^{
       
        self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    } completion:^(BOOL finished) {
        
        
        PrefectInfoViewController *prefectVC = [[PrefectInfoViewController alloc]init];
        [self.navigationController pushViewController:prefectVC animated:YES];
        
    }];
    
    
  
    
    return;
    
    
    
    if ([_userNameTextfied.text length] == 0) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"手机号不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    
    if ([_aurhcodeTextfield.text length] == 0) {
        
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"验证码不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        return;
        
    }
    
    
    if ([_pwdTextfield.text length] == 0) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"密码不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    
    
    
    NSString *number = @"^[0-9]*$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", number];
    BOOL isNumber = [pred evaluateWithObject:_userNameTextfied.text];
    if ([_userNameTextfied.text length] != 11 || isNumber != YES)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"手机号输入有误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }

    
    
    
    
    NSString *number2 = @"^[0-9]*$";
    NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", number2];
    BOOL isNumber2 = [pred2 evaluateWithObject:_aurhcodeTextfield.text];
    
    if ([_aurhcodeTextfield.text length] != 6 || isNumber2 != YES) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"验证码输入有误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        return;
        
    }
    
    
    
    
    if ([_pwdTextfield.text length] <  6) {
        
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"密码长度不小于6位" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    
        return;
    }
    

    
    
    
    [[HttpEngine sharedHttpEngine] signInIphoneNumber:_userNameTextfied.text
                                             password:[_pwdTextfield.text md5]
                                           verifyCode:_aurhcodeTextfield.text
                                                 type:@"1"
                                  onCompletionHandler:^(MKNetworkOperation *completedOperation) {
                                      
                                      
                                      NSDictionary *dic = [completedOperation responseJSON];
                                      if ([[dic objectForKey:@"errMsg"] nullTonil])
                                      {
                                          if ([[dic objectForKey:@"errMsg"]isEqualToString:@"success"])
                                          {
                                              
                                              PrefectInfoViewController *prefectVC = [[PrefectInfoViewController alloc]init];
                                              [self.navigationController pushViewController:prefectVC animated:YES];
                                              
                                          }
                                          else if ([[dic objectForKey:@"errMsg"] isEqualToString:@"fail"])
                                          {
                                              
                                              NSDictionary *dataDic = [[dic objectForKey:@"data"] nullTonil];
                                              
                                              
                                              if (dataDic)
                                              {
                                                 
                                                  
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
