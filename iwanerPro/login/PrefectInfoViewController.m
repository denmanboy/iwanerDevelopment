//
//  PrefectInfoViewController.m
//  iwanerPro
//
//  Created by MobbyDeveloper on 15/8/2.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import "PrefectInfoViewController.h"
#import "PersonalityViewController.h"
#import "LeisureSportsViewController.h"

@interface PrefectInfoViewController ()

@end

@implementation PrefectInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clickFinish:(id)sender {
    
    
    [[HttpEngine sharedHttpEngine] complementUserInfoUsername:_userNameTextfield.text
                                                          dis:_personalityLable.text
                                                          sex:_userSexBtn.titleLabel.text
                                                          img:_headImage
                                          onCompletionHandler:^(MKNetworkOperation *completedOperation) {
                                              
                                          } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
                                              
                                          }];
    
    
    
    
    
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)clickUserHeaderImg:(id)sender {
    
    
}
- (IBAction)clickSexBtn:(id)sender {
    UIButton *btn = (UIButton *)sender;
    if (btn.selected) {
        [btn setImage:[UIImage getPathImageWithName:@"登录注册_滑块-男"] forState:UIControlStateNormal];
    }else {
        [btn setImage:[UIImage getPathImageWithName:@"登录注册_滑块-女"] forState:UIControlStateNormal];

    }
    
    btn.selected = !btn.selected;
}
- (IBAction)clickPersonalityLable:(id)sender {
    PersonalityViewController *personalityVC = [[PersonalityViewController alloc]init];
    [self.navigationController pushViewController:personalityVC animated:YES];
    
}
- (IBAction)clickHobbyBtn:(id)sender {
    LeisureSportsViewController *leisureSportVC = [[LeisureSportsViewController alloc]init];
    [self.navigationController pushViewController:leisureSportVC animated:YES];
    
}
- (IBAction)clickMapBtn:(id)sender {
    
    
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
