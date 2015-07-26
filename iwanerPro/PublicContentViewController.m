//
//  PublicContentViewController.m
//  iwanerPro
//
//  Created by liyuanbo on 7/25/15.
//  Copyright (c) 2015 iwaner. All rights reserved.
//

#import "PublicContentViewController.h"

@interface PublicContentViewController ()

@end



@implementation PublicContentViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    self.view.backgroundColor = COLOR_WITH_RGB(235, 235, 241);
    self.view.userInteractionEnabled = YES;
    
    NSLog(@"dadadddd=====%@",NSStringFromCGRect(    self.view.frame));
    
    UIView *locationNaViView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    locationNaViView.backgroundColor = COLOR_WITH_RGB(248, 56, 52);
    [self.view addSubview:locationNaViView];
    
    
  
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame =CGRectMake(0, 15, 60, 40);
    [button setTitle:@"取消" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    
    button.backgroundColor = [UIColor clearColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:COLOR_WITH_RGB(218, 218, 218) forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(gotoBack) forControlEvents:UIControlEventTouchUpInside];
    [locationNaViView addSubview:button];
    
    
    
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 80, 15, 160, 40)];
    titleLabel.text = @"发布主题";
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [locationNaViView addSubview:titleLabel];
    
    
    
    _backScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, SCREEN_HEIGHT - 60)];
    _backScrollView.backgroundColor = COLOR_WITH_RGB(235, 235, 241);
    _backScrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 940);
    [self.view addSubview:_backScrollView];
    
    

    
    
    
    _upPhotoesBack = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 112)];
    _upPhotoesBack.backgroundColor = [UIColor whiteColor];
    [_backScrollView addSubview:_upPhotoesBack];
    
    
    UILabel *upPhotoTip = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
    upPhotoTip.backgroundColor = [UIColor clearColor];
    upPhotoTip.text = @"上传封面图片";
    upPhotoTip.textColor = COLOR_WITH_ARGB(90, 95, 109, 1);
    upPhotoTip.font = [UIFont boldSystemFontOfSize:15];
    [_upPhotoesBack addSubview:upPhotoTip];
    
    
    UILabel *upPhotoTip2 = [[UILabel alloc] initWithFrame:CGRectMake(105, 10, 100, 30)];
    upPhotoTip2.backgroundColor = [UIColor clearColor];
    upPhotoTip2.text = @"(必填)";
    upPhotoTip2.textColor = [UIColor grayColor];
    upPhotoTip2.font = [UIFont systemFontOfSize:13];
    [_upPhotoesBack addSubview:upPhotoTip2];
    
    
    UIImage *upPhotoImage = [UIImage getPathImageWithName:@"按钮-添加图片"];
    UIImage *upPhotoImageHigh = [UIImage getPathImageWithName:@"按钮-添加图片-按下"];
    UIButton *upPhotoBt = [UIButton buttonWithType:UIButtonTypeCustom];
    upPhotoBt.frame = CGRectMake(14, 45, upPhotoImage.size.width, upPhotoImage.size.height);
    [upPhotoBt setImage:upPhotoImage forState:UIControlStateNormal];
    [upPhotoBt setImage:upPhotoImageHigh forState:UIControlStateHighlighted];
    [upPhotoBt addTarget:self action:@selector(gotoUphotoes) forControlEvents:UIControlEventTouchUpInside];
    [_upPhotoesBack addSubview:upPhotoBt];
    
    
    
    _itemTimeBack = [[UIView alloc] initWithFrame:CGRectMake(0, 122, SCREEN_WIDTH, 150)];
    _itemTimeBack.backgroundColor = [UIColor whiteColor];
    [self.backScrollView addSubview:_itemTimeBack];
    
    
    _mapBack = [[UIView alloc] initWithFrame:CGRectMake(0, 282, SCREEN_WIDTH, 364)];
    _mapBack.backgroundColor = [UIColor whiteColor];
    [self.backScrollView addSubview:_mapBack];
    
   
    
    _detailBack = [[UIView alloc] initWithFrame:CGRectMake(0, 656, SCREEN_WIDTH, 160)];
    _detailBack.backgroundColor = [UIColor whiteColor];
    [self.backScrollView addSubview:_detailBack];
    
    _competenceBack = [[UIView alloc] initWithFrame:CGRectMake(0, 826, SCREEN_WIDTH, 43)];
    _competenceBack.backgroundColor = [UIColor whiteColor];
    [self.backScrollView addSubview:_competenceBack];
    
    
    UILabel *competenceTip = [[UILabel alloc] initWithFrame:CGRectMake(10, 7, 80, 30)];
    competenceTip.backgroundColor = [UIColor clearColor];
    competenceTip.text = @"权限设置";
    competenceTip.textColor = COLOR_WITH_ARGB(90, 95, 109, 1);
    competenceTip.font = [UIFont boldSystemFontOfSize:15];
    [_competenceBack addSubview:competenceTip];
    
    
    UILabel *competenceTip2 = [[UILabel alloc] initWithFrame:CGRectMake(76, 7, 100, 30)];
    competenceTip2.backgroundColor = [UIColor clearColor];
    competenceTip2.text = @"(公开)";
    competenceTip2.textColor = [UIColor grayColor];
    competenceTip2.font = [UIFont systemFontOfSize:13];
    [_competenceBack addSubview:competenceTip2];
    
    
    _publicBt = [UIButton buttonWithType:UIButtonTypeCustom];
    _publicBt.backgroundColor = COLOR_WITH_RGB(248, 56, 52);
    [_publicBt setTitle:@"发布" forState:UIControlStateNormal];
    [_publicBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _publicBt.frame = CGRectMake(20, 882, SCREEN_WIDTH - 40, 45);
    [self.backScrollView  addSubview:_publicBt];
    
//    _detailBack
//    _mapBack
    // Do any additional setup after loading the view.
}



- (void)gotoUphotoes
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)gotoBack
{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
