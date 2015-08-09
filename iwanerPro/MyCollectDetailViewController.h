//
//  MyCollectDetailViewController.h
//  iwanerPro
//
//  Created by dengyanzhou on 15/8/2.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  topCell
 */
@interface  MyCollectDetailTopCell : UITableViewCell
/**背景*/
@property (nonatomic, strong) UIImageView *backImageVeiw;
@property (nonatomic, strong) UIImageView *headImageView;
//主题
@property (nonatomic, strong) UILabel *subjectLabel;
//时间
@property (nonatomic, strong) UIImageView *timeImageView;
//地点
@property (nonatomic, strong) UIImageView *addressImageView;
//人均
@property (nonatomic, strong) UIImageView *averageImageView;
//aa制
@property (nonatomic, strong) UIImageView *aAImageView;

/*******label********************************************/
//时间
@property (nonatomic, strong) UILabel *timeLabel;
//地点
@property (nonatomic, strong) UILabel *addressLabel;
//人均
@property (nonatomic, strong) UILabel *averageLabel;
//aa制
@property (nonatomic, strong) UILabel *aALabel;


@end

/**
 *  middleCell
 */
@interface  MyCollectDetailMiddleCell : UITableViewCell
//集合时间
@property (nonatomic, strong) UILabel *timeLabel;
//集合地点
@property (nonatomic, strong) UILabel *addressLabel;
//集合标志
@property (nonatomic, strong) UILabel *symbolLabel;




@end

/**
 * bottomCell
 */

@interface  MyCollectDetailBottomCell : UITableViewCell

//评论
@property (nonatomic, strong) UIButton *commentBtn;
//25+btn
@property (nonatomic, strong) UIButton *numBtn;
//心星
@property (nonatomic, strong) UIButton *heartBtn;









@end




/******************************详情类*****************************/

@interface MyCollectDetailViewController : UIViewController

@end
