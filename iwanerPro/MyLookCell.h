//
//  MyLookCell.h
//  iwanerPro
//
//  Created by dengyanzhou on 15/7/31.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyLookData : NSObject

//解析数据
- (void)parseInfoWithDic:(NSDictionary*)dic;

@end



typedef void (^LookCellBtnBlock)(UIButton* sender);

@interface MyLookCell : UITableViewCell

/**时间*/
@property (nonatomic, strong) UILabel *timeLabel;
/*评论*/   
@property (nonatomic, strong) UIButton *commentBtn;
/**删除*/
@property (nonatomic, strong) UIButton *deleteBtn;
/**lefImage*/
@property (nonatomic, strong) UIImageView* lImageView;
/**middleimage*/
@property (nonatomic, strong) UIImageView* mImageView;
/**rightImage*/
@property (nonatomic, strong) UIImageView* rImageView;
/**数量*/
@property (nonatomic, strong) UIButton* numBtn;
/**back*/
@property (nonatomic, strong) UIView *backView;

/**backImageView*/
//@property (nonatomic, strong) UIView *backImageView;
/**左右两边btn点击的回调*/
@property (nonatomic, copy) LookCellBtnBlock cellBtnBlock;

- (void)configurationUIWithData:(MyLookData*)data;
@end
