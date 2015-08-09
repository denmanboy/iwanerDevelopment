//
//  MyItemCell.h
//  iwanerPro
//
//  Created by dengyanzhou on 15/7/27.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import <UIKit/UIKit.h>

/**数据源*/
@interface MyItemData : NSData
- (void)parseInfoWithDic:(NSDictionary*)dic;
@end




typedef void(^ZanButtonBlock) (void);
@interface MyItemCell : UITableViewCell

/**上面的图片*/
@property (nonatomic, strong) UIImageView *topImageView;
/**进行中*/
@property (nonatomic, strong) UIButton *button;
/**头像*/
@property (nonatomic, strong) UIImageView *headImageView;
/**主题*/
@property (nonatomic, strong) UILabel *themeLabel;
/**时间*/
@property (nonatomic, strong) UILabel *timeLabel;
/**时间图片*/
@property (nonatomic, strong) UIImageView *timeView;
/**地点*/
@property (nonatomic, strong) UILabel *addressLabel;
/**地点图片*/
@property (nonatomic, strong) UIImageView *addressView;
/**下面头像的数组*/
@property (nonatomic, strong) NSMutableArray *imageArray;
/**心图片*/
@property (nonatomic, strong) UIButton *heartButton;
/**数字*/
@property (nonatomic, strong) UILabel *numLabel;
/**赞button的回调*/
@property (nonatomic, copy) ZanButtonBlock zanBlock;


-(void)configureUIWith:(MyItemData*)itemData;
@end
