//
//  MyInfoViewController.m
//  iwanerPro
//
//  Created by dengyanzhou on 15/7/30.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import "MyInfoViewController.h"

@interface MyInfoViewController ()<UITableViewDelegate,UITableViewDataSource>

/**tableView*/
@property(nonatomic,strong)UITableView *tableView;
/**头像buton*/
@property(nonatomic,strong)UIButton *headBtn;
/**头像图片*/
@property(nonatomic,strong)NSArray *imageNameArray;
/**标题*/
@property(nonatomic,strong)NSArray *titleArray;


@end

@implementation MyInfoViewController



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我";
    self.view.backgroundColor = COLOR_WITH_RGB(235, 235, 242);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(gotoSave)];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    UIImageView *headView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.size.width, 240)];
    headView.image = [UIImage imageNamed:@"hongzi"];
    self.tableView = ({
        
        UITableView  *tableView =  [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
        [self.view addSubview:tableView];
        tableView.backgroundColor = COLOR_WITH_RGB(235, 235, 242);
        tableView.tableHeaderView = headView;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.tableFooterView = [UIView new];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView;
        
        
    });
    self.headBtn = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [button setImage:[UIImage imageNamed:@"分享-朋友圈@3x"] forState:UIControlStateNormal];
        [headView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(headView);
        }];
        
        button;
    });
    self.imageNameArray = [NSArray arrayWithObjects:@"图标-玩友圈-标签",@"图标-玩友圈-位置",@"图标-玩友圈-标签",@"图标-详细资料-爱好", nil];
    self.titleArray = [NSArray arrayWithObjects:@"酥酥的小饼干",@"所在地",@"个性标签",@"休闲爱好",nil];
    // Do any additional setup after loading the view.
}

#pragma mark - UITalbViewDeleta

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell* cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    if (cell) {
        
        
        cell.selectionStyle =  UITableViewCellSelectionStyleNone;
        cell.contentView.backgroundColor = COLOR_WITH_RGB(235, 235, 242);
        UIView *whiteView = [[UIView alloc]initWithFrame:CGRectMake(5, 5, cell.contentView.size.width - 10, 40)];
        whiteView.backgroundColor = COLOR_WITH_RGB(250, 250, 251);
        whiteView.layer.cornerRadius = 5;
        [cell insertSubview:whiteView aboveSubview:cell.contentView];
        
        cell.imageView.image = [UIImage imageNamed:_imageNameArray[indexPath.row]];
        [cell insertSubview:cell.imageView aboveSubview:whiteView];
        
        cell.textLabel.text = _titleArray[indexPath.row];
        
        [cell insertSubview:cell.textLabel aboveSubview:whiteView];
        if (indexPath.row == 0) {
            cell.textLabel.textColor = COLOR_WITH_RGB(90, 95, 109);
            UISwitch *switchView = [[UISwitch alloc]initWithFrame:CGRectZero];
            switchView.onImage  = [UIImage imageNamed:@"图标-爱玩-男.png"];
            switchView.offImage = [UIImage imageNamed:@"图标-爱玩-女.png"];
            switchView.on = NO;
            [switchView addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
            [whiteView addSubview:switchView];
            [switchView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(whiteView);
                make.right.equalTo(whiteView).offset(-8);
                
            }];
            
        }else{
            
            UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"图标-列表右箭头"]];
            [whiteView addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(whiteView);
                make.right.equalTo(whiteView).offset(-8);
                
            }];
            
        }
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    
    
}

#pragma mark - 保存
- (void)gotoSave
{
    
    
    
    
    
}
- (void)switchAction:(UISwitch*)switchView
{
    
    
    
    
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
