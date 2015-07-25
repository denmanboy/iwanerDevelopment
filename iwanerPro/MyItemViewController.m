//
//  MyItemViewController.m
//  iwanerPro
//
//  Created by liyuanbo on 7/26/15.
//  Copyright (c) 2015 iwaner. All rights reserved.
//

#import "MyItemViewController.h"

@interface MyItemViewController ()

@end

@implementation MyItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = COLOR_WITH_RGB(235, 235, 241);
    
    self.title = @"我的主题";
    //    self.navigationController
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    //    self.navigationController.navigationBar.barTintColor = COLOR_WITH_RGB(248, 56, 52);
    
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
