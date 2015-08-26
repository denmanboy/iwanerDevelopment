//
//  LookSelectImageViewController.m
//  iwanerPro
//
//  Created by liyuanbo on 8/17/15.
//  Copyright (c) 2015 iwaner. All rights reserved.
//

#import "LookSelectImageViewController.h"

@interface LookSelectImageViewController ()

@end

@implementation LookSelectImageViewController

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    _mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:_mainScrollView];
    
    
    
    UIView *navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    [self.view addSubview:navigationView];
    
    
    UIButton *backBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBt setTitle:@"返回" forState:UIControlStateNormal];
    [backBt addTarget:self action:@selector(gotoBack) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *delectBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [delectBt setTitle:@"删除 " forState:UIControlStateNormal];
    [delectBt addTarget:self action:@selector(gotoDelect) forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:delectBt];

    // Do any additional setup after loading the view.
}


- (void)loadImageViews:(NSMutableArray *)array
{
    
    for (NSInteger i = 0; i < array.count; i++) {
        
        UIImage *image = [array objectAtIndex:i];
        UIImageView *selectImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, image.size.width, image.size.height)];
        [_mainScrollView addSubview:selectImageView];
        
        
        
    }
}


- (void)gotoBack
{
    /////////
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)gotoDelect
{
    //删除
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
