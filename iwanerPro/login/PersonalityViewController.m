//
//  PersonalityViewController.m
//  iwanerPro
//
//  Created by MobbyDeveloper on 15/8/2.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import "PersonalityViewController.h"
#import "SKTagView.h"
#import "SKTag.h"
#import "Masonry.h"


@interface PersonalityViewController ()<UIAlertViewDelegate>

@property (strong, nonatomic)SKTagView *tagView1;
@property (strong, nonatomic)SKTagView *tagView2;
@property (strong, nonatomic)NSMutableArray *arr1;
@property (nonatomic ,strong)NSMutableArray *arr2;



@end

@implementation PersonalityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)creatView {
    __weak PersonalityViewController *weakSelf = self;
    
    UILabel *selectIndustryLable = [UILabel new];
    [selectIndustryLable setText:@"请选择您的行业"];
    [selectIndustryLable setFont:[UIFont systemFontOfSize:16]];
    [selectIndustryLable setTextColor:[UIColor grayColor]];
    [self.view addSubview:selectIndustryLable];
    
    [selectIndustryLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        make.left.mas_equalTo(weakSelf.view).with.offset(20);
        make.height.mas_equalTo(25);
        make.top.mas_equalTo(weakSelf.view).with.offset(84);
    }];
    
    
    
    _tagView1 = [SKTagView new];
    _tagView1.padding = UIEdgeInsetsMake(10, 20, 10, 20);
    _tagView1.insets = 15;
    _tagView1.lineSpace = 10;
    [self.view addSubview:self.tagView1];
    __weak SKTagView *weakSelfTagView = _tagView1;
    
    [self.tagView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        UIView *superView = self.view;
        make.top.equalTo(selectIndustryLable.mas_bottom);
        make.leading.equalTo(superView.mas_leading).with.offset(0);
        make.trailing.equalTo(superView.mas_trailing);
        
    }];
    
    NSArray *titleArr = @[@"年轻",@"蹦蹦跳跳",@"不美不跑",@"6666666",@"FashionRun",@"嘻嘻哈哈"];
    self.arr1 = [NSMutableArray arrayWithArray:titleArr];
    
    [_arr1 enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        SKTag *tag = [[SKTag alloc]initWithText:obj];
        tag.padding = UIEdgeInsetsMake(10, 10, 10, 10);
        tag.fontSize = 15;
        tag.bgImg = [[UIImage getPathImageWithName:@"登录注册_标签背景-30-白"]stretchableImageWithLeftCapWidth:5 topCapHeight:0];
        [_tagView1 addTag:tag];
    }];
    
    

    
    
    
    UILabel *lable2 = [UILabel new];
    [lable2 setText:@"贴些标签"];
    [lable2 setFont:[UIFont systemFontOfSize:16]];
    [lable2 setTextColor:[UIColor grayColor]];
    [self.view addSubview:lable2];
    
    [lable2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelfTagView.mas_bottom).with.offset(50);
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        make.left.mas_equalTo(weakSelf.view).with.offset(20);
        make.height.mas_equalTo(25);
    }];
    
    
    
    
 
    _tagView2 = [SKTagView new];
    _tagView2.padding = UIEdgeInsetsMake(10, 20, 10, 20);
    _tagView2.insets = 15;
    _tagView2.lineSpace = 10;
    [self.view addSubview:self.tagView2];
    __weak SKTagView *weakSelfTagView2 = _tagView2;

    [self.tagView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        UIView *superView = self.view;
        make.top.equalTo(lable2.mas_bottom);
        make.leading.equalTo(superView.mas_leading).with.offset(0);
        make.trailing.equalTo(superView.mas_trailing);
        
    }];
 
    NSArray *titleArr2 = @[@"年轻",@"蹦蹦跳跳",@"不美不跑",@"无限动力",@"乐享其中的运动哈哈哈哈哈",@"一",@"二",@"三",@"四",@"五",@"六"];
    self.arr2 = [NSMutableArray arrayWithArray:titleArr2];
    
    [_arr2 enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        SKTag *tag = [[SKTag alloc]initWithText:obj];
        tag.bgImg = [[UIImage getPathImageWithName:@"登录注册_标签背景-30-白"]stretchableImageWithLeftCapWidth:5 topCapHeight:0];
        tag.padding = UIEdgeInsetsMake(10, 10, 10, 10);
        tag.fontSize = 15;
        [_tagView2 addTag:tag];
    }];
    
    SKTag *tag = [[SKTag alloc]init];
    tag.bgImg = [[UIImage getPathImageWithName:@"登录注册_标签-添加"]stretchableImageWithLeftCapWidth:5 topCapHeight:0];
    tag.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    [_tagView2 addTag:tag];


    
//    _tagView1.didClickTagAtIndex = ^(NSUInteger index){
//    
//        [weakSelfTagView removeTagAtIndex:index];
////        SKTag *tag = [[SKTag alloc]initWithText:[weakSelf.arr1 objectAtIndex:index]];
////        tag.padding = UIEdgeInsetsMake(10, 10, 10, 10);
////        tag.fontSize = 15;
////        tag.bgColor = [UIColor cyanColor];
////        tag.cornerRadius = 5;
////        [weakSelfTagView2 addTag:tag];
////        
////        [weakSelf.arr2 addObject:[weakSelf.arr1 objectAtIndex:index]];
////        [weakSelf.arr1 removeObjectAtIndex:index];
//        
//    };
//
    
    
    _tagView2.didClickTagAtIndex = ^(NSUInteger index){
        
        NSLog(@"hahah");
        
//        [weakSelfTagView2 removeTagAtIndex:index];
//        
//        SKTag *tag = [[SKTag alloc]initWithText:[weakSelf.arr2 objectAtIndex:index]];
//        tag.padding = UIEdgeInsetsMake(10, 10, 10, 10);
//        tag.fontSize = 15;
//        tag.bgColor = [UIColor cyanColor];
//        tag.cornerRadius = 5;
//        
//        [weakSelfTagView addTag:tag];
//        [weakSelf.arr1 addObject:[weakSelf.arr2 objectAtIndex:index]];
//        [weakSelf.arr2 removeObjectAtIndex:index];
        
//        if (index == weakSelf.arr2.count) {
//            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:@"" delegate:weakSelf cancelButtonTitle:@"" otherButtonTitles:@"", nil];
//            alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
//            [alertView show];
//            
//        }
        
    };

}



- (IBAction)clickBackBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)clickPublicBtn:(id)sender {
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
