//
//  MeViewController.h
//  iwanerPro
//
//  Created by liyuanbo on 7/25/15.
//  Copyright (c) 2015 iwaner. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MyMessageViewController.h"
#import "MyItemViewController.h"
#import "MyLookViewController.h"
#import "MyCollectViewController.h"
#import "SettingViewController.h"

@interface MeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *myTableView;
@property (nonatomic,strong) NSMutableArray *itemTextArray,*itemImageArray;
@property (nonatomic,strong) UIImageView *redMessageSign;
@end
