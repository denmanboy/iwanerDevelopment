//
//  ModifyPasswordViewController.m
//  iwanerPro
//
//  Created by dengyanzhou on 15/7/31.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import "ModifyPasswordViewController.h"

@interface ModifyPasswordViewController ()

/**旧密码*/
@property(nonatomic,strong)UITextField *oPasswordField;

/**新密码*/
@property(nonatomic,strong)UITextField *nPasswordField;

/**确认密码*/
@property(nonatomic,strong)UITextField *cPasswordField;
@end

@implementation ModifyPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改密码";
    self.view.backgroundColor = COLOR_WITH_RGB(233, 234, 241);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(gotoCommit)];
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"按钮-返回-灰"] style:UIBarButtonItemStylePlain target:self action:@selector(gotoBack)];
    [self configurationUI];
  

    // Do any additional setup after loading the view.
}

- (void)configurationUI
{  WS(weakSelf);
    self.oPasswordField =  ({
        UITextField *textFeild = [UITextField new];
        textFeild.placeholder = @"旧密码";
        textFeild.secureTextEntry = YES;
        textFeild.borderStyle = UITextBorderStyleRoundedRect;
        [self.view addSubview:textFeild];
        [textFeild mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.view).offset(10);
            make.right.equalTo(weakSelf.view).offset(-10);
            make.left.equalTo(weakSelf.view).offset(10);
            make.height.equalTo(@40);
            
        }];
    
        textFeild;
    });
    
    self.nPasswordField =  ({
        UITextField *textFeild = [UITextField new];
        textFeild.placeholder = @"新密码";
        textFeild.secureTextEntry = YES;
        textFeild.borderStyle = UITextBorderStyleRoundedRect;
        [self.view addSubview:textFeild];
        [textFeild mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.oPasswordField.mas_bottom).offset(10);
            make.right.equalTo(weakSelf.view).offset(-10);
            make.left.equalTo(weakSelf.view).offset(10);
            make.height.equalTo(@40);
        }];
        
        textFeild;
    });
    self.cPasswordField =  ({
        UITextField *textFeild = [UITextField new];
        textFeild.placeholder = @"确认密码";
        textFeild.secureTextEntry = YES;
        textFeild.borderStyle = UITextBorderStyleRoundedRect;
        [self.view addSubview:textFeild];
        [textFeild mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.nPasswordField.mas_bottom).offset(10);
            make.right.equalTo(weakSelf.view).offset(-10);
            make.left.equalTo(weakSelf.view).offset(10);
            make.height.equalTo(@40);
        }];
        
        textFeild;
    });
    
    



}


//提交
- (void)gotoCommit
{
  




}
//返回
- (void)gotoBack
{
    UIViewController *topCtrl = self.navigationController.topViewController;
    if (topCtrl == self) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
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
