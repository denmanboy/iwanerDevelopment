//
//  MeViewController.m
//  iwanerPro
//
//  Created by liyuanbo on 7/25/15.
//  Copyright (c) 2015 iwaner. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = COLOR_WITH_RGB(235, 235, 241);
    
    UIImage *backHeadImage  = [UIImage imageNamed:@"hongzi"];
    UIImageView *backHeadImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    backHeadImageView.image = backHeadImage;
    [self.view addSubview:backHeadImageView];
    
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, SCREEN_HEIGHT - 200 - 44) style:UITableViewStyleGrouped];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    [self.view addSubview:_myTableView];

    _itemImageArray = [[NSMutableArray alloc] initWithObjects:@"图标-我-我的消息",@"图标-我-我的主题",@"图标-我-我的看见",@"图标-我-我的收藏", nil];
    _itemTextArray = [[NSMutableArray alloc] initWithObjects:@"我的消息",@"我的主题",@"我的看见",@"我的收藏", nil];

    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (cell) {
        
        
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




//- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
//    
//}
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
