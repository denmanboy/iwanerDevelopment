//
//  UILabelButton.h
//  iwanerPro
//
//  Created by liyuanbo on 7/29/15.
//  Copyright (c) 2015 iwaner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabelButton : UIButton
@property (nonatomic,strong) UILabel *label;

- (void)addLabelInsertButton;
@end
