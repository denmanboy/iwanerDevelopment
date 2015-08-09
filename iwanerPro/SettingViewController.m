//
//  SettingViewController.m
//  iwanerPro
//
//  Created by liyuanbo on 7/26/15.
//  Copyright (c) 2015 iwaner. All rights reserved.
//

#import "SettingViewController.h"
#import "ContactUsViewController.h"
#import "ModifyPasswordViewController.h"

@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>

/**tableView*/
@property(nonatomic,strong)UITableView *tableView;
/**title*/
@property(nonatomic,strong)NSArray *titleArray;
/**版本*/
@property(nonatomic,strong)UILabel *versionsLabel;
/**推出登陆*/
@property(nonatomic,strong)UIButton *logoutBtn;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = COLOR_WITH_RGB(235, 235, 241);
    self.title = @"设置";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64 - 170)];
    footerView.backgroundColor = COLOR_WITH_RGB(226, 226, 233);
    
    self.tableView = ({
        UITableView* tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.size.width, self.view.frame.size.height - 64)];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.tableFooterView = footerView;
        tableView.tableFooterView.userInteractionEnabled = YES;
        tableView.backgroundColor = COLOR_WITH_RGB(226, 226, 233);
        [self.view addSubview:tableView];
        tableView;
    
    });
    
    self.versionsLabel = ({
        UILabel *label = [UILabel new];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"当前版本V0.01";
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = COLOR_WITH_RGB(162, 165, 186);
        label.backgroundColor = [UIColor clearColor];
        [footerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(footerView).offset(10);
            make.centerX.equalTo(footerView);
        }];
        label;
    
    });
    
    self.logoutBtn = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor redColor];
        [footerView addSubview:button];
        footerView.userInteractionEnabled = YES;
        [button setTitle:@"推出登录" forState:UIControlStateNormal];
        button.layer.cornerRadius = 8;
        button.layer.masksToBounds = YES;
        [button addTarget:self action:@selector(gotoLogout) forControlEvents:UIControlEventTouchUpInside];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.right.equalTo(footerView.mas_right).offset(-10);
            make.left.equalTo(footerView.mas_left).offset(10);
            make.height.equalTo(@40);
            make.bottom.equalTo(footerView.mas_bottom).offset(-10);
            
        }];
        
        button;
    
    
    });
    
    self.titleArray = @[@[@"修改密码",@"联系我们"],
                        @[@"用户协议",@"给APP评分"],
                       ];
    
    //    self.navigationController
    // Do any additional setup after loading the view.
}

#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }else
    {
        return 10;
    }


}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 40;


}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle =  UITableViewCellSelectionStyleNone;
    cell.textLabel.text = _titleArray[indexPath.section][indexPath.row];
    return cell;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
       
        if (indexPath.row == 0) {
            
            ModifyPasswordViewController *modifyCtrl = [[ModifyPasswordViewController alloc]init];
            modifyCtrl.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:modifyCtrl animated:YES];
            
        }else{
            ContactUsViewController *contactCtrl = [[ContactUsViewController alloc]init];
            contactCtrl.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:contactCtrl animated:YES];
        
        }
        
        
        
    }else{
    
        if (indexPath.row == 0) {
            
        }else{
            
            
        }
        
        
        
    }
    
    


}








#pragma mark - 推出登录
- (void)gotoLogout
{






}

















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    //    self.navigationController.navigationBar.barTintColor = COLOR_WITH_RGB(248, 56, 52);
    
}


- (void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;
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
