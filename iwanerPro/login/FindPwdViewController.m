//
//  FindPwdViewController.m
//  iwanerPro
//
//  Created by MobbyDeveloper on 15/8/2.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import "FindPwdViewController.h"
#import "FindPwdDetailViewController.h"

@interface FindPwdViewController ()

@end

@implementation FindPwdViewController

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
- (IBAction)clickNextStep:(id)sender {
    FindPwdDetailViewController *detailVC = [[FindPwdDetailViewController alloc]init];
    [self.navigationController pushViewController:detailVC animated:YES];
}
- (IBAction)regetAuthcode:(id)sender {
    NSLog(@"哈哈哈哈");
    
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
