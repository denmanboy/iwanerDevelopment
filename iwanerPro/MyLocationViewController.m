//
//  MyLocationViewController.m
//  iwanerPro
//
//  Created by dengyanzhou on 15/8/16.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import "MyLocationViewController.h"

@interface MyLocationViewController ()

@end

@implementation MyLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"所在地";
    self.view.backgroundColor = COLOR_WITH_RGB(233, 234, 241);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"按钮-返回-灰"] style:UIBarButtonItemStylePlain target:self action:@selector(gotoBack)];
    

    // Do any additional setup after loading the view.
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
