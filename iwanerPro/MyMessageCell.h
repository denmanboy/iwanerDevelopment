//
//  MyMessageCell.h
//  iwanerPro
//
//  Created by dengyanzhou on 15/7/26.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyMessageData.h"


typedef void(^AgreenBtnClick)(UIButton*);

@interface MyMessageCell : UITableViewCell


/**时间*/
@property (nonatomic, strong) UILabel *timeLabel;
/**同意*/
@property (nonatomic, strong) UIButton *agreeButton;
/**同意的回调*/
@property (nonatomic, copy ) AgreenBtnClick agreenBtnClick;

/**配置UI*/
- (void)configureUIWithData:(MyMessageData*)messageData;

@end
