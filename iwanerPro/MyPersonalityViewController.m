//
//  MyPersonalityViewController.m
//  iwanerPro
//
//  Created by dengyanzhou on 15/8/16.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import "MyPersonalityViewController.h"
#import "SKTagView.h"



@interface MyPersonalityViewController ()<UITableViewDataSource,UITableViewDelegate>
/**tableView*/
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation MyPersonalityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_WITH_RGB(233, 234, 241);
    self.title = @"个性标签";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"按钮-返回-灰"] style:UIBarButtonItemStylePlain target:self action:@selector(gotoBack)];
    //标签
    SKTagView *headView = [[SKTagView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 250)];
    headView.padding    = UIEdgeInsetsMake(10, 25, 10, 25);
    headView.insets    = 5;
    headView.lineSpace = 2;
    //Handle tag's click event 选中标签的回调
    headView.didClickTagAtIndex = ^(NSUInteger index){
      
    
    };
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //完成
    UIView *footView  = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    footView.backgroundColor = [UIColor purpleColor];
    UIButton *finishBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
    finishBtn.backgroundColor = [UIColor redColor];
    [finishBtn setTitle:@"完成" forState:UIControlStateNormal];
    finishBtn.frame = CGRectMake(20, 10,SCREEN_WIDTH - 40 ,40);
    [finishBtn addTarget:self action:@selector(gotoFinish) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:finishBtn];
    
    //滑动视图
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
        tableView.backgroundColor = [UIColor yellowColor];
        tableView.delegate = self;
    
        tableView.dataSource = self;
        tableView.tableHeaderView = headView;
        tableView.tableFooterView = footView;
        [self.view addSubview: tableView];
        tableView;
    
    });
    
    [@[@"在校学生",@"互联网/计算机",@"金融/银行/投资",@"商业/服务/个体",@"媒体/广告/文化",@"制造/公益",@"艺术/娱乐",@"医疗/护理",@"律师/法务",@"教育/培训",@"公务员"] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
        SKTag *tag = [SKTag tagWithText:obj];
        tag.textColor = UIColor.whiteColor;
        tag.bgImg = [[UIImage getPathImageWithName:@"登录注册_标签背景-30-白"]stretchableImageWithLeftCapWidth:5 topCapHeight:0];
        tag.bgColor = [UIColor blackColor];
        tag.cornerRadius = 3;
        tag.fontSize = 15;
        tag.padding = UIEdgeInsetsMake(13.5, 12.5, 13.5, 12.5);
        [(SKTagView*)self.tableView.tableHeaderView addTag:tag];
    }
     ];

    
    [self.view addSubview:_tableView];
    
    
    // Do any additional setup after loading the view.
}

#pragma mark -  UItableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell  = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    return  cell;
}



#pragma mark -  完成
- (void)gotoFinish
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
