//
//  MyItemViewController.m
//  iwanerPro
//
//  Created by liyuanbo on 7/26/15.
//  Copyright (c) 2015 iwaner. All rights reserved.
//

#import "MyItemViewController.h"
#import "MyItemCell.h"


@interface MyItemViewController ()<UITableViewDelegate,UITableViewDataSource>
/**tableView*/
@property(nonatomic,strong)UITableView *tableView;
/**数据源*/
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation MyItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = COLOR_WITH_RGB(235, 235, 241);
    self.title = @"我的主题";
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
