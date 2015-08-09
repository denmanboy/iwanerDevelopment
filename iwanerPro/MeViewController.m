//
//  MeViewController.m
//  iwanerPro
//
//  Created by liyuanbo on 7/25/15.
//  Copyright (c) 2015 iwaner. All rights reserved.
//

#import "MeViewController.h"
#import "MyInfoViewController.h"

@interface MeViewController ()

/**头像*/
@property(nonatomic,strong)UIButton *headBtn;
/**昵称*/
@property(nonatomic,strong)UILabel *nickNameLabel;
/**地点*/
@property(nonatomic,strong)UILabel *addressLabel;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = COLOR_WITH_RGB(235, 235, 241);
    WS(weakSelf);
    self.automaticallyAdjustsScrollViewInsets =  NO;
    UIImage *backHeadImage  = [UIImage imageNamed:@"hongzi"];
    UIImageView *backHeadImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    backHeadImageView.image = backHeadImage;
    backHeadImageView.userInteractionEnabled = YES;
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 44) style:UITableViewStyleGrouped];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    _myTableView.tableHeaderView = backHeadImageView;
    [self.view addSubview:_myTableView];
    
    /*********************个人信息*************************/
    self.headBtn = ({
        UIButton  *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.layer.cornerRadius = 40;
        button.layer.masksToBounds= YES;
        [button setImage:[UIImage imageNamed:@"Default-568h"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(gotoMyInfo) forControlEvents:UIControlEventTouchUpInside];
        [backHeadImageView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@80);
            make.height.equalTo(@80);
            make.centerX.equalTo(backHeadImageView);
            make.centerY.equalTo(backHeadImageView).offset(-20);
            
        }];
    
        button;

    });
    self.nickNameLabel = ({
    
        UILabel *lable = [UILabel new];
        lable.text = @"酥酥的小饼干";
        lable.backgroundColor = [UIColor clearColor];
        lable.textColor = [UIColor whiteColor];
        lable.textAlignment = NSTextAlignmentCenter;
        [backHeadImageView addSubview:lable];
        [lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(weakSelf.headBtn);
            make.top.equalTo(weakSelf.headBtn.mas_bottom).offset(10);
            
        }];
        lable;
        
    });
    self.addressLabel = ({
        UILabel *label = [UILabel new];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"北京朝阳";
        label.textColor = COLOR_WITH_RGB(238, 236, 240);
        label.font = [UIFont systemFontOfSize:13];
        label.backgroundColor = [UIColor clearColor];
        [backHeadImageView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
        
            make.centerX.equalTo(weakSelf.nickNameLabel);
            make.top.equalTo(weakSelf.nickNameLabel.mas_bottom).offset(5);
            
        }];
        
        label;
        
    });
    
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:@"图标-主题详情-地点@3x"];
    [backHeadImageView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.addressLabel);
        make.right.equalTo(weakSelf.addressLabel.mas_left).offset(-2);
    }];
    
    /*********************个人信息*************************/
    

    _itemImageArray = [[NSMutableArray alloc] initWithObjects:@"图标-我-我的消息",@"图标-我-我的主题",@"图标-我-我的看见",@"图标-我-我的收藏", nil];
    _itemTextArray = [[NSMutableArray alloc] initWithObjects:@"我的消息",@"我的主题",@"我的看见",@"我的收藏", nil];
    
}

#pragma mark - 头像点击的回调
- (void)gotoMyInfo
{

    MyInfoViewController *myCtrl = [[MyInfoViewController alloc]init];
    myCtrl.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:myCtrl animated:YES];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (cell) {
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        if (indexPath.section == 0) {
            
            
            UIImage *image = [UIImage getPathImageWithName:[_itemImageArray objectAtIndex:indexPath.row]];
            NSInteger i = 0;
            
            if (indexPath.row == 0) {
                
                _redMessageSign = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 40, 17, 8, 8)];
                _redMessageSign.backgroundColor = COLOR_WITH_RGB(248, 56, 52);
                _redMessageSign.image = [UIImage getPathImageWithName:@"导航-爱玩-红"];
                _redMessageSign.layer.cornerRadius = 4;
                [cell.contentView addSubview:_redMessageSign];
                
                
                
                
                i = 2;
            }
            else if (indexPath.row == 1)
            {
                i = 1;
                
            }
            else if (indexPath.row == 2)
            {
                i = 3;
            }else if (indexPath.row == 3)
            {
                i = 1;
            }
            
            UIImageView *imageViewSign = [[UIImageView alloc] initWithFrame:CGRectMake(16 + i, 12, image.size.width, image.size.height)];
            imageViewSign.image = image;
            [cell.contentView addSubview:imageViewSign];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 10.5, 160, 22)];
            [cell.contentView addSubview:label];
            label.text = [_itemTextArray objectAtIndex:indexPath.row];
            
            
            
            
        }
        else
        {

            UIImage *image = [UIImage getPathImageWithName:@"图标-我-设置"];
            
            UIImageView *imageViewSign = [[UIImageView alloc] initWithFrame:CGRectMake(19, 12, image.size.width, image.size.height)];
            imageViewSign.image = image;
            [cell.contentView addSubview:imageViewSign];
            
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 10.5, 160, 22)];
            [cell.contentView addSubview:label];
            label.text = @"设置";
            
        }

    }
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 4;
    }
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 43;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
 
    if (section == 0) {
        return 0.01;
    }
    return 3;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 4;
    }
    return 2;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
     
        switch (indexPath.row) {
            case 0:
            {
                MyMessageViewController *control = [[MyMessageViewController alloc] init];
                [self.navigationController pushViewController:control animated:YES];
            }
                break;
            case 1:
            {
                MyItemViewController *control = [[MyItemViewController alloc] init];
                [self.navigationController pushViewController:control animated:YES];
            }
                break;
            case 2:
            {
                MyLookViewController *control = [[MyLookViewController alloc] init];
                [self.navigationController pushViewController:control animated:YES];
            }
                break;
            case 3:
            {
                MyCollectViewController *control = [[MyCollectViewController alloc] init];
                [self.navigationController pushViewController:control animated:YES];
            }
                break;
                
            default:
                break;
        }
    }else if (indexPath.section == 1)
    {
        if (indexPath.row == 0) {
            SettingViewController *control = [[SettingViewController alloc] init];
            [self.navigationController pushViewController:control animated:YES];
        }
    }
        
    
}
//- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
//    
//}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    //    self.navigationController.navigationBar.barTintColor = COLOR_WITH_RGB(248, 56, 52);
    
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
