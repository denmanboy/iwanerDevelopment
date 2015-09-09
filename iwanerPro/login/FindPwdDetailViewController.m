//
//  FindPwdDetailViewController.m
//  iwanerPro
//
//  Created by MobbyDeveloper on 15/8/2.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import "FindPwdDetailViewController.h"

@interface FindPwdDetailViewController ()

@end

@implementation FindPwdDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidLayoutSubviews
{
    
    _pwdTextfield.keyboardType = UIKeyboardTypeNamePhonePad;
    _pwdTextfield.secureTextEntry = YES;
    
    
    _affirmPwdTextfield.returnKeyType =  UIReturnKeyJoin;
    _affirmPwdTextfield.keyboardType = UIKeyboardTypeNamePhonePad;
    _affirmPwdTextfield.secureTextEntry = YES;
    
}


- (IBAction)clickSubmitBtn:(id)senderX
{
    
    
    if ([_pwdTextfield.text  length] > 0  &&  [_affirmPwdTextfield.text length] > 0) {
        
        
        if ([_pwdTextfield.text isEqualToString:_affirmPwdTextfield.text]) {
            
            
            
        }else
        {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"两次输入密码不一致" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alert show];
            
            
        }
        
        
        
    }else
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"密码或验证码不能为空" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
    }
}



- (IBAction)clickBackBtn:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
