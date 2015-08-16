//
//  MyCollectViewController.m
//  iwanerPro
//
//  Created by liyuanbo on 7/26/15.
//  Copyright (c) 2015 iwaner. All rights reserved.
//
#import "MyCollectViewController.h"
#import "MyItemViewController.h"
#import "MyItemCell.h"
#import "MyCollectDetailViewController.h"


@interface MyCollectViewController ()<UITableViewDelegate,UITableViewDataSource>
/**tableView*/
@property(nonatomic,strong)UITableView *tableView;
/**数据源*/
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation MyCollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = COLOR_WITH_RGB(235, 235, 241);
    self.title = @"我的收藏";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"按钮-返回-灰"] style:UIBarButtonItemStylePlain target:self action:@selector(gotoBack)];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.tableView = ({
        UITableView *talbleView = [[UITableView  alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
        talbleView.delegate = self;
        talbleView.dataSource = self;
        talbleView.separatorStyle = UITableViewCellSeparatorStyleNone;
        talbleView.showsHorizontalScrollIndicator = NO;
        talbleView.showsVerticalScrollIndicator = NO;
        talbleView;
        
    });
    [self.view addSubview:_tableView];
    
    //    self.navigationController
    // Do any additional setup after loading the view.
}




#pragma mark - UITaleViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 15;
    return self.dataArray.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 260;
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellID = @"MyItemID";
    MyItemCell  *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[MyItemCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    MyItemData *data = _dataArray[indexPath.row];
    [cell configureUIWith:data];
    cell.zanBlock = ^(void){
        
        
        
    };
    return cell;
    
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCollectDetailViewController *collectDetailCtrl = [[MyCollectDetailViewController alloc]init];
    collectDetailCtrl.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:collectDetailCtrl animated:NO];
    
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
