//
//  MyCollectDetailViewController.m
//  iwanerPro
//
//  Created by dengyanzhou on 15/8/2.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import "MyCollectDetailViewController.h"
#define kHead_Space  5
#define kHead_Width  30
#define kHead_Height 30

@implementation MyCollectDetailTopCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}
- (void)createUI
{
    WS(wealSelf);
    self.backImageVeiw = ({
        UIImageView *imageView =  [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.size.width, 130)];
        imageView.image = [UIImage imageNamed:@"hongzi"];
        imageView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:imageView];
        
        imageView;
    });
    
    self.headImageView = ({
        UIImageView *imageView = [UIImageView new];
        imageView.image = [UIImage imageNamed:@"邀请玩友-QQ"];
        imageView.layer.cornerRadius = 8;
        imageView.layer.masksToBounds = YES;
        [self.contentView addSubview:imageView];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(wealSelf.contentView).offset(10);
            make.bottom.equalTo(wealSelf.backImageVeiw.mas_bottom).offset(10);
            make.height.equalTo(@50);
            make.width.equalTo(@50);
            
        }];
        imageView;
        
    });
    
    
    [self.contentView insertSubview:self.imageView aboveSubview:self.backImageVeiw];
    self.subjectLabel = ({
        UILabel *textLabel = [UILabel new];
        textLabel.text = @"周末欢乐行,骑马,免费试吃";
        textLabel.font = [UIFont systemFontOfSize:14];
        textLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:textLabel];
        [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(wealSelf.backImageVeiw);
            make.bottom.equalTo(wealSelf.backImageVeiw).offset(-5);
            
            
        }];
        textLabel;
        
    });
    
    self.timeImageView = ({
        UIImageView *imageView = [UIImageView new];
        imageView.image = [UIImage imageNamed:@"图标-主题详情-时间"];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(wealSelf.contentView).offset(10);
            make.top.equalTo(wealSelf.backImageVeiw.mas_bottom).offset(20);
            make.height.equalTo(@10);
            make.width.equalTo(@10);
            
        }];
        imageView;
    });
    self.timeLabel = ({
        UILabel *label  = [UILabel new];
        label.text = @"11-1 15:00(周六) 至 11-2 15：00(周日)";
        label.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(wealSelf.timeImageView);
            make.left.equalTo(wealSelf.timeImageView.mas_right).offset(10);
        }];
        
        label;
    });
    
    
    
    UIView  *lineView1 = [[UIView alloc]init];
    lineView1.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(wealSelf.timeLabel.mas_bottom).offset(5);
        make.height.equalTo(@0.5);
        make.left.equalTo(wealSelf.contentView).offset(10);
        make.right.equalTo(wealSelf.contentView);
        
        
        
    }];
    
    
    self.addressImageView = ({
        UIImageView *imageView = [UIImageView new];
        imageView.image = [UIImage imageNamed:@"图标-主题详情-地点"];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(wealSelf.contentView).offset(10);
            make.top.equalTo(wealSelf.timeImageView.mas_bottom).offset(15);
            make.height.equalTo(@10);
            make.width.equalTo(@10);
            
        }];
        imageView;
    });
    
    self.addressLabel = ({
        UILabel *label  = [UILabel new];
        label.text = @"北京市海淀区中关村大街7号T.IT创意园";
        label.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(wealSelf.addressImageView);
            make.left.equalTo(wealSelf.addressImageView.mas_right).offset(10);
        }];
        
        label;
    });
    
    
    UIView  *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(wealSelf.addressLabel.mas_bottom).offset(5);
        make.height.equalTo(@0.5);
        make.left.equalTo(wealSelf.contentView).offset(10);
        make.right.equalTo(wealSelf.contentView);
        
        
        
    }];
    
    
    self.averageImageView = ({
        UIImageView *imageView = [UIImageView new];
        imageView.image = [UIImage imageNamed:@"图标-主题详情-花费"];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(wealSelf.contentView).offset(10);
            make.top.equalTo(wealSelf.addressImageView.mas_bottom).offset(15);
            make.height.equalTo(@10);
            make.width.equalTo(@10);
            
        }];
        imageView;
    });
    self.averageLabel = ({
        UILabel *label  = [UILabel new];
        label.text = @"人均55元";
        label.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(wealSelf.averageImageView);
            make.left.equalTo(wealSelf.averageImageView.mas_right).offset(10);
        }];
        
        label;
    });
    
    
    UIView  *lineView3 = [[UIView alloc]init];
    lineView3.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:lineView3];
    [lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(wealSelf.averageLabel.mas_bottom).offset(5);
        make.height.equalTo(@0.5);
        make.left.equalTo(wealSelf.contentView).offset(10);
        make.right.equalTo(wealSelf.contentView);
        
        
        
    }];
    
    
    self.aAImageView = ({
        UIImageView *imageView = [UIImageView new];
        imageView.image = [UIImage imageNamed:@"图标-主题详情-消费方式"];
        
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(wealSelf.contentView).offset(10);
            make.top.equalTo(wealSelf.averageImageView.mas_bottom).offset(15);
            make.height.equalTo(@10);
            make.width.equalTo(@10);
            
        }];
        imageView;
    });
    
    self.aALabel = ({
        UILabel *label  = [UILabel new];
        label.text = @"AA制/女士免单/玩主免单";
        label.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(wealSelf.aAImageView);
            make.left.equalTo(wealSelf.aAImageView.mas_right).offset(10);
        }];
        
        label;
    });
    
    UIView  *lineView4 = [[UIView alloc]init];
    lineView4.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:lineView4];
    [lineView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(wealSelf.aALabel.mas_bottom).offset(5);
        make.height.equalTo(@0.5);
        make.left.equalTo(wealSelf.contentView).offset(10);
        make.right.equalTo(wealSelf.contentView);
        
        
        
    }];
    
    
    
    
    [self createHeadImageViewWithNum:10];
    
}

- (void)createHeadImageViewWithNum:(int)num
{
    CGFloat  start_Y = 250;
    for (int i = 0; i < num; i++) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((kHead_Space + kHead_Width) * i + 10, start_Y, kHead_Width, kHead_Height)];
        imageView.image = [UIImage imageNamed:@"邀请玩友-QQ"];
        if (CGRectGetMaxX(imageView.frame) > self.contentView.size.width - 10) {
            return;
        }
        imageView.layer.cornerRadius = 5;
        imageView.layer.masksToBounds = YES;
        [self.contentView addSubview:imageView];
        
    }
}

@end





//****************中间**************************//
@implementation MyCollectDetailMiddleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self createUI];
        
    }
    
    return self;
}
- (void)createUI
{
    WS(wealSelf);
    //补充详情
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:[UIImage imageNamed:@"图标-主题详情-补充详情"] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"补充详情" forState:UIControlStateNormal];
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 0,0,60);
    button.enabled = NO;
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 5,0,0);
    [self.contentView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(wealSelf.contentView).offset(5);
        make.left.equalTo(wealSelf.contentView).offset(10);
        make.width.equalTo(@75);
        make.height.equalTo(@15);
        
    }];
    
    self.timeLabel = ({
        UILabel *label = [UILabel new];
        label.text = @"[集合时间] 5月22日晚上7点半 (请尊重其他人,不要迟到)";
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:13];
        label.numberOfLines = 0;
        [self.contentView addSubview:label];
        CGFloat width  = self.contentView.size.width - 10;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(wealSelf.contentView).offset(10);
            make.top.equalTo(button.mas_bottom).offset(10);
            make.width.equalTo(@(width));
        }];
        
        label;
    });
    
    self.addressLabel = ({
        UILabel *label = [UILabel new];
        label.text = @"[集合地点] 人民广场地铁站1口";
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:13];
        label.numberOfLines = 0;
        [self.contentView addSubview:label];
        CGFloat width  = self.contentView.size.width - 10;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(wealSelf.contentView).offset(10);
            make.top.equalTo(wealSelf.timeLabel.mas_bottom).offset(5);
            make.width.equalTo(@(width));
        }];
        
        label;
    });
    self.symbolLabel = ({
        UILabel *label = [UILabel new];
        label.text = @"[集合标志] 暴走团旗帜";
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:13];
        label.numberOfLines = 0;
        [self.contentView addSubview:label];
        CGFloat width  = self.contentView.size.width - 10;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(wealSelf.contentView).offset(10);
            make.top.equalTo(wealSelf.addressLabel.mas_bottom).offset(5);
            make.width.equalTo(@(width));
        }];
        
        label;
    });
    
    
    
}


@end
@implementation MyCollectDetailBottomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self createUI];
    }
    
    return self;
}
- (void)createUI
{
    WS(wealSelf);
    
    self.commentBtn = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"图标-我-我的消息"] forState:UIControlStateNormal];
        [self.contentView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(wealSelf.contentView).offset(12);
            make.left.equalTo(wealSelf.contentView).offset(10);
            make.width.equalTo(@15);
            make.height.equalTo(@15);
            
        }];
        button;
    });
    self.heartBtn = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"导航-爱玩-红"] forState:UIControlStateNormal];
        [self.contentView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(wealSelf.contentView).offset(12);
            make.right.equalTo(wealSelf.contentView).offset(-10);
            make.width.equalTo(@15);
            make.height.equalTo(@15);
            
        }];
        button;
    });
    self.numBtn = ({
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.layer.cornerRadius = 15;
        button.layer.masksToBounds = YES;
        button.backgroundColor = [UIColor grayColor];
        [button setTitle:@"25+" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(wealSelf.contentView).offset(5);
            make.right.equalTo(wealSelf.contentView).offset(-35);
            make.width.equalTo(@30);
            make.height.equalTo(@30);
            
        }];
        button;
        
    });
    
    //创建头像
    [self createHeadImageWithNum:10];
    //分割线
    UIView  *lineView  = [[UIView alloc]initWithFrame:CGRectMake(10, 42, self.contentView.size.width - 10, 0.5)];
    lineView.backgroundColor = COLOR_WITH_RGB(47, 247, 249);
    [self.contentView addSubview:lineView];
    
    //创建评论
    [self createCommetMsgWithNum:5];
    
    
}
- (void)createHeadImageWithNum:(int)num
{   CGFloat start_X = 55;
    CGFloat start_Y = 7;
    CGFloat width = self.contentView.size.width - 70;
    for (int i = 0; i < num; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((kHead_Space + kHead_Width) * i + start_X, start_Y, kHead_Width, kHead_Height)];
        if (CGRectGetMaxX(imageView.frame) > width ) {
            return;
        }
        imageView.image = [UIImage imageNamed:@"邀请玩友-QQ"];
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 10;
        [self.contentView addSubview:imageView];
    }
    
    
    
}
- (void)createCommetMsgWithNum:(int)num
{      WS(wealSelf);
    NSString *text = @"小强:你这个活动很赞啊！我也想参加！";
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc]initWithString:text attributes:nil];
    [attribute addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, 2)];
    
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:wealSelf.commentBtn];
    for (int i = 0; i < num; i++) {
        
        UILabel *topLabel = array[i];
        UILabel *lalbel = [UILabel new];
        lalbel.attributedText = attribute ;
        lalbel.font = [UIFont systemFontOfSize:14];
        lalbel.numberOfLines = 0;
        [self.contentView addSubview:lalbel];
        [lalbel mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i ==  0) {
                make.top.equalTo(topLabel.mas_bottom).offset(25);
                
            }else{
                
                make.top.equalTo(topLabel.mas_bottom).offset(10);
                make.width.equalTo(wealSelf.mas_width).offset(10);
                
            }
            make.left.equalTo(wealSelf.contentView).offset(10);
            
            if (i == num) {
                make.bottom.equalTo(wealSelf.contentView).offset(-5);
            }
            
        }];
        
        [array addObject:lalbel];
        
    }
    
}



@end


/*******************************详情类*****************************************/
/**
 *  详情类
 */

@interface MyCollectDetailViewController ()<UIActionSheetDelegate,UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UIActionSheet *actionSheet;
//tableView
@property(nonatomic,strong)UITableView *tableView;
//报名
@property(nonatomic,strong)UIButton *applyButton;
@end

@implementation MyCollectDetailViewController


-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"主题详情";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"..." style:UIBarButtonItemStylePlain target:self action:@selector(gotoEdit)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"按钮-返回-灰"] style:UIBarButtonItemStylePlain target:self action:@selector(gotoBack)];
    self.actionSheet = ({
        
        UIActionSheet *actionSheet
        = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"分享" otherButtonTitles:@"评论",@"取消收藏",@"举报/编辑",@"取消报名/撤销主题" ,nil];
        actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
        actionSheet;
        
    });
    
    self.tableView  = ({
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.size.width, self.view.size.height - 64 - 40) style:UITableViewStylePlain];
        tableView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:tableView];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView;
        
    });
    
    self.applyButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame =  CGRectMake(0,self.view.size.height - 64 - 40, self.view.size.width , 40);
        [self.view addSubview:button];
        [button setTitle:@"邀请好友" forState:UIControlStateNormal];
        [button setTitle:@"我先报名" forState:UIControlStateSelected];
        [button addTarget:self action:@selector(gotoApply:) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor = COLOR_WITH_RGB(137, 137, 137);
        button;
    });
    // Do any additional setup after loading the view.
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        
        return 285;
    }else if(indexPath.section == 1){
        
        return 110;
    }else if(indexPath.section == 2){
        
        return 180;
    }

    return 0;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        MyCollectDetailTopCell * cell = [[MyCollectDetailTopCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
        
    }else if(indexPath.section == 1){
        
        
        MyCollectDetailMiddleCell * cell = [[MyCollectDetailMiddleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else if(indexPath.section == 2){
        
        
        MyCollectDetailBottomCell * cell = [[MyCollectDetailBottomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        [cell.commentBtn addTarget:self action:@selector(gotoComment:) forControlEvents:UIControlEventTouchUpInside];
        [cell.heartBtn addTarget:self action:@selector(gotoZan:) forControlEvents:UIControlEventTouchUpInside];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
        
        
    }else
    {
        return nil;
        
    }
    
    return nil;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }else{
        
        return 20;
        
    }
    
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0,self.view.size.width, 10)];
    view.backgroundColor = COLOR_WITH_RGB(235, 235, 240);
    return  view;
    
}

#pragma mark - 评论
- (void)gotoComment:(UIButton*)sender
{
    
    
    
}
#pragma mark - 赞
- (void)gotoZan:(UIButton*)sender
{
    sender.selected = !sender.selected;
    
    
}

#pragma mark - 分享回调
- (void)gotoEdit
{
    [_actionSheet showInView:self.view];
    
}
#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //分享
    if (buttonIndex == 0) {
        
        //评论
    }else if(buttonIndex == 1){
        
        //取消收藏
    }else if(buttonIndex == 2){
        
        //举报编辑
    }else if(buttonIndex == 3){
        
        //取消报名
    }else if(buttonIndex == 4){
        
        
        //取消
    }else if(buttonIndex == 5){
        
    }else{
        
    }
    
    
    
}
#pragma mark - 报名
- (void)gotoApply:(UIButton*)sender
{
    
    sender.selected = !sender.selected;
    if (sender.selected) {
        sender.backgroundColor = [UIColor redColor];
    }else{
        sender.backgroundColor = [UIColor grayColor];
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
