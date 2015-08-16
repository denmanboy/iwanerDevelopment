//
//  MyMessageViewController.m
//  iwanerPro
//
//  Created by liyuanbo on 7/26/15.
//  Copyright (c) 2015 iwaner. All rights reserved.
//

#import "MyMessageViewController.h"
#import "MyMessageCell.h"
@interface MyMessageViewController ()<UITableViewDelegate,UITableViewDataSource>
/**数据源*/
@property(nonatomic,strong)NSMutableArray *dataArray;
/**tableView*/
@property(nonatomic,strong)UITableView *tableView;



@end

@implementation MyMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = COLOR_WITH_RGB(235, 235, 241);
    self.title = @"我的消息";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"清空" style:UIBarButtonItemStylePlain target:self action:@selector(clearAll)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"按钮-返回-灰"] style:UIBarButtonItemStylePlain target:self action:@selector(gotoBack)];
    //适配
    [self autoFit];
    self.tableView  = ({
        UITableView  *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64 - 49) style:UITableViewStylePlain];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView;
    });
    [self.view addSubview:_tableView];
    
    //    self.navigationController
    // Do any additional setup after loading the view.
}

/**适配*/
- (void)autoFit
{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = NO;
    
}


#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
    return  self.dataArray.count;
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return  1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 100;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellID = @"messageCell";
    MyMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[MyMessageCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.agreenBtnClick = ^(UIButton* sender){
        sender.selected = YES;
        sender.backgroundColor = COLOR_WITH_RGB(195, 190, 186);
    };

    MyMessageData *msgData = _dataArray[indexPath.row];
    [cell configureUIWithData:msgData];
    return  cell;
    
}
//同意button的回调
- (void)gotoAgree
{
    //清空数组
    [self.dataArray removeAllObjects];
    [_tableView reloadData];
    

}





#pragma mark - tableView 的编辑模式
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;

}


- (NSString*)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{


 return @"删除";
    

}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{


    return UITableViewCellEditingStyleDelete;


}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        return;

        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationTop];

    }

}

#pragma mark - 右上角清空
- (void)clearAll
{

    
    
    
    
    
    
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
    //    self.navigationController.navigationBar.barTintColor = COLOR_WITH_RGB(248, 56, 52);
    
}

//- (void)viewDidDisappear:(BOOL)animated
//{
//    [super viewDidDisappear:animated];
//    self.navigationController.navigationBarHidden = YES;
//}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
