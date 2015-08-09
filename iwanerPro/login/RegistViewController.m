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

@interface RegistViewController ()

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clickBackBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)regetAuthcodeBtn:(id)sender {
    
}
- (IBAction)clickFinishBtn:(id)sender {
    PrefectInfoViewController *prefectVC = [[PrefectInfoViewController alloc]init];
    [self.navigationController pushViewController:prefectVC animated:YES];
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
