//
//  MyInfoViewController.m
//  iwanerPro
//
//  Created by dengyanzhou on 15/7/30.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import "MyInfoViewController.h"
#import "MySelectHeadViewController.h"
#import "MyPersonalityViewController.h"
#import "MyHobbyViewController.h"
#import "MyLocationViewController.h"


@interface MyInfoViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate>

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
    
//    UIButton *backButton  =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 22, 22)];
//    [backButton setBackgroundImage:[UIImage imageNamed:@"按钮-返回-灰"] forState:UIControlStateNormal];
//    [backButton  setBackgroundImage:[UIImage imageNamed:@"按钮-返回-白"] forState: UIControlStateHighlighted];
//    [backButton addTarget:self action:@selector(gotoBack) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"按钮-返回-灰"] style:UIBarButtonItemStylePlain target:self action:@selector(gotoBack)];
    
    self.view.backgroundColor = COLOR_WITH_RGB(235, 235, 242);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(gotoSave)];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    UIImageView *headView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.size.width, 200)];
    headView.userInteractionEnabled = YES;
//    headView.image = [UIImage imageNamed:@"hongzi"];
    self.tableView = ({
        
        UITableView  *tableView =  [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
        [self.view addSubview:tableView];
        tableView.backgroundColor = COLOR_WITH_RGB(235, 235, 242);
        tableView.tableHeaderView = headView;
        tableView.rowHeight  = 50;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.tableFooterView = [UIView new];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView;
        
        
    });
    self.headBtn = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [button setImage:[UIImage imageNamed:@"分享-朋友圈@3x"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(gotoSelectHeadImage:) forControlEvents:UIControlEventTouchUpInside];
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
            
            //箭头按钮
            UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"图标-列表右箭头"]];
            imageView.userInteractionEnabled = YES;
            [whiteView addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(whiteView);
                make.right.equalTo(whiteView).offset(-8);
                
            }];
            
        }
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row) {
        case 1: //所在地
        {
            MyLocationViewController *locationCtrl  =[[MyLocationViewController alloc]init];
            [self.navigationController pushViewController:locationCtrl animated:NO];
        }
            break;
        case 2://个性标签
        {
            MyPersonalityViewController *perCtrl = [[MyPersonalityViewController alloc]init];
            [self.navigationController pushViewController:perCtrl animated:NO];
            
        }
            break;
        case 3://休闲爱好
        {
            MyHobbyViewController *hobbyCtrl = [[MyHobbyViewController alloc]init];
            [self.navigationController pushViewController:hobbyCtrl animated:NO];

        }
            break;
            
        default:
            break;
    }
    
}

#pragma mark - 保存
- (void)gotoSave
{
    
    
    
    
    
}
//性别标签
- (void)switchAction:(UISwitch*)switchView
{
    //TOD0:保存本地 上传服务器
    
    
    
    
}
//选择头像
- (void)gotoSelectHeadImage:(UIButton*)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"选择来源" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"相册" otherButtonTitles:@"相机", nil];
    [actionSheet showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (buttonIndex == 0) {
     
        MySelectHeadViewController  *selectCtrl  = [[MySelectHeadViewController alloc]init];
        [self.navigationController pushViewController: selectCtrl  animated:YES];
        
    }else if(buttonIndex == 1){
        //TODO:选择相册
        
        
    }
    
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
