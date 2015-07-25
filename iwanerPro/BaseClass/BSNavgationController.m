//
//  BSNavgationController.m
//  iwanerPro
//
//  Created by liyuanbo on 7/25/15.
//  Copyright (c) 2015 iwaner. All rights reserved.
//

#import "BSNavgationController.h"

@interface BSNavgationController ()

@end

@implementation BSNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = self;
    }
        
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
 
    [super pushViewController:viewController animated:animated];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {

    return YES;
    
}


- (void)didReceiveInfo
{
    [self preferredStatusBarStyle];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    
        return UIStatusBarStyleDefault;
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
