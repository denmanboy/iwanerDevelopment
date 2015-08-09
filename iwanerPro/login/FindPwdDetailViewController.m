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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clickSubmitBtn:(id)sender {
}
- (IBAction)clickBackBtn:(id)sender {
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
