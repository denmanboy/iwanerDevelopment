//
//  ContactUsViewController.m
//  iwanerPro
//
//  Created by dengyanzhou on 15/7/30.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import "ContactUsViewController.h"

@interface ContactUsViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ContactUsViewController


#pragma mark - life_circle
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"联系我们";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"按钮-返回-灰"] style:UIBarButtonItemStylePlain target:self action:@selector(gotoBack)];
    self.view.backgroundColor = COLOR_WITH_RGB(233, 234, 241);
    self.automaticallyAdjustsScrollViewInsets = NO;
  
    self.tableView  = ({
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        tableView.backgroundColor = COLOR_WITH_RGB(236, 234, 243);
        tableView.autoresizingMask =  UIViewAutoresizingFlexibleHeight;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableFooterView = [[UIView alloc]init];
        [self.view addSubview:tableView];
        tableView;

    });
    
}


#pragma mark - UItableViewDelete

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    cell.textLabel.textColor = COLOR_WITH_RGB(52, 62, 55);
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 30, 30)];
    [cell.contentView addSubview:imageView];
    
    UILabel *textLabel = [UILabel new];
    [cell.contentView addSubview:textLabel];
      [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         
          make.centerY.equalTo(cell.contentView);
          make.left.equalTo(imageView.mas_right).offset(10);
          
      }];
    
    switch (indexPath.row) {
        case 0:
            
            imageView.image = [UIImage imageNamed:@"分享-QQ"];
            textLabel.text  = @"3146333829";
        
            break;
        case 1:
            imageView.image = [UIImage imageNamed:@"分享-QQ"];
            textLabel.text  = @"we@iwaner.com";
            break;
        case 2:
            imageView.image = [UIImage imageNamed:@"分享-微信"];
            textLabel.text  = @"爱玩（微信号：imiwaner)";
            break;
            
        case 3:
            imageView.image = [UIImage imageNamed:@"分享-QQ"];
            textLabel.text  = @"www.iwaner.com";
            break;
        default:
            break;
    }
    return cell;
    
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
