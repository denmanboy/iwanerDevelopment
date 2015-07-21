//
//  ViewController.m
//  iwanerPro
//
//  Created by liyuanbo on 7/21/15.
//  Copyright (c) 2015 iwaner. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    
    
    
    UIButton*button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(150, 300, 100, 60);
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(gotoClink:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)gotoClink:(UIButton *)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
