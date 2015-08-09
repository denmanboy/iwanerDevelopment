//
//  MyLookViewController.m
//  iwanerPro
//
//  Created by liyuanbo on 7/26/15.
//  Copyright (c) 2015 iwaner. All rights reserved.
//

#import "MyLookViewController.h"
#import "MyLookCell.h"

@interface MyLookViewController ()<UITableViewDelegate,UITableViewDataSource>

/**tableView*/
@property(nonatomic,strong)UITableView *tableView;
/**数据源*/
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation MyLookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = COLOR_WITH_RGB(235, 235, 241);
    self.title = @"我的看见";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.tableView = ({
        UITableView *talbleView = [[UITableView  alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
        talbleView.delegate = self;
        talbleView.dataSource = self;
        talbleView.separatorStyle = UITableViewCellSeparatorStyleNone;
        talbleView.showsHorizontalScrollIndicator = NO;
        talbleView.showsVerticalScrollIndicator = YES;
        talbleView;
        
    });
    [self.view addSubview:_tableView];
    
    //    self.navigationController
    // Do any additional setup after loading the view.
}

#pragma mark - UITableviewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
    return  _dataArray.count;
}
//动态计算cell高度
/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return  220;

}
 */

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   static NSString* cellID = @"myLookCellID";
    MyLookCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[MyLookCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.row % 2 == 0) {
        
        cell.detailTextLabel.text = @"是谁那么慌 踩碎我一路的天光 是谁面无表情摇晃 醉倒我一眼的迷茫 烟花在绽放 却 绚烂不过心里的一次芬芳 岁月在疯狂 却 麻木不了雾里的一段悲伤 说不出 道不明的失望 只是因为心在流浪 破碎的脚印 开始在彷徨 就算遗忘了折断的翅膀 我是否还可以飞翔 结局和过程都有了，再去纠缠，连自己都觉得贪婪 我有没有跟你说过爱是我不变的信仰 我有没有告诉过你爱就是永远把一个人放在心上 男生的誓言往往像甜而脆的薄饼，进入嘴巴就会慢慢的溶化。可是它又会迅速地潜伏进你的体内，占领你的心";
    }else{
     
         cell.detailTextLabel.text = @"是谁那么慌 踩碎我一路的天光 是谁面无表情摇晃 醉倒我一眼的迷茫 烟花在绽放 却 绚烂不过心里的一次芬芳 岁月在疯狂 却 麻木不了雾里的一段悲伤 说不出 道不明的失望 只是因为心在流浪.";
    }
    cell.cellBtnBlock = ^(UIButton* sender){
        //评论
        if (sender.tag == 100) {
          //TODO:评论按钮点击触发的事件
            
            
        //删除
        }else{
        
          //TODO:删除按钮点击触发的事件
        
        }
    
    };
    MyLookData *data = _dataArray[indexPath.row];
    [cell configurationUIWithData:data];

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
