//
//  FindPwdViewController.m
//  iwanerPro
//
//  Created by MobbyDeveloper on 15/8/2.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import "FindPwdViewController.h"
#import "FindPwdDetailViewController.h"
#import "JKCountDownButton.h"





@interface FindPwdViewController ()

@end

@implementation FindPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}





- (IBAction)clickBackBtn:(id)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)clickNextStep:(id)sender
{

    NSString *number = @"^[0-9]*$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", number];
    BOOL isNumber = [pred evaluateWithObject:_phoneNumTextfield.text];
    
    
    
    NSString *number2 = @"^[0-9]*$";
    NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", number2];
    BOOL isNumber2 = [pred2 evaluateWithObject:_authcodeTextfield.text];

    
    
    if (isNumber == NO || [_phoneNumTextfield.text length] != 11  || isNumber2 == NO  || [_authcodeTextfield.text length] != 6)
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"请输入11位手机号或6位验证码"
                                                       delegate:self cancelButtonTitle:@"确认"
                                              otherButtonTitles:nil, nil];
        
        [alert show];
        return;
        
    }else
    {
       
        //判断验证码接口
        
        [[HttpEngine sharedHttpEngine]judgeSendCodeIsRightWithCode:_authcodeTextfield.text onCompletionHandler:^(MKNetworkOperation *completedOperation) {
            
            
            NSDictionary *dic = [completedOperation responseJSON];
            
            if ([[dic objectForKey:@"errMsg"] nullTonil]) {
                if ([[dic objectForKey:@"errMsg"] isEqualToString:@"success"]) {
                    FindPwdDetailViewController * findVc = [[FindPwdDetailViewController alloc] init];
                    [self.navigationController pushViewController:findVc animated:YES];
                }
            }
       
            
            
            
            
            
            NSLog(@"ddd=====%@",dic);
            
            
            
            
            
        } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
            
        }];
        
        
        //验证码错误
        
        
        //验证码正确
        
    
        
    }

}



- (IBAction)regetAuthcode:(JKCountDownButton *)sender

{
    NSString *number = @"^[0-9]*$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", number];
    BOOL isNumber = [pred evaluateWithObject:_phoneNumTextfield.text];
    if (isNumber == NO || [_phoneNumTextfield.text length] != 11)
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"请输入11位手机号"
                                                       delegate:self cancelButtonTitle:@"确认"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }else
    {
        
        
        [[HttpEngine sharedHttpEngine] sendIphoneNumberVerificationCode:_phoneNumTextfield.text
                                                    onCompletionHandler:^(MKNetworkOperation *completedOperation) {
                                                        
                                                        
                                                    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
                                                        
                                                        
                                                        
                                                        
                                                    }];
        
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
        
        
    }
    
    

}



- (void)viewDidLayoutSubviews
{
    
    
    //
    

    
    
    
    
    
    
    
    
    
}



- (void)didReceiveMemoryWarning
{
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
