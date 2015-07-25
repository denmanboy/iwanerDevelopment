//
//  MeViewController.h
//  iwanerPro
//
//  Created by liyuanbo on 7/25/15.
//  Copyright (c) 2015 iwaner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *myTableView;
@property (nonatomic,strong) NSMutableArray *itemTextArray,*itemImageArray;
@property (nonatomic,strong) UIImageView *redMessageSign;
@end
