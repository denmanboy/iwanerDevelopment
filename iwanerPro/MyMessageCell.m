//
//  MyMessageCell.m
//  iwanerPro
//
//  Created by dengyanzhou on 15/7/26.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import "MyMessageCell.h"

@implementation MyMessageCell

- (void)awakeFromNib {
    // Initialization code
}

/**重写父类方法*/
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self creatUI];
        
    }
    return self;
}

/**创建其他UI空件*/
-(void)creatUI
{
    WS(weakSelf);
    self.timeLabel = ({
        
        UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:timeLabel];
        timeLabel.text = @"2分钟前";
        timeLabel.font = [UIFont systemFontOfSize:13.0f];
        timeLabel.textColor = COLOR_WITH_RGB(169, 191, 228);
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.contentView).with.offset(5);
            make.right.equalTo(weakSelf.contentView).with.offset(-10);
        }];
        timeLabel;
    });

    self.agreeButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:button];
        [button setTitle:@"同意" forState:UIControlStateNormal];
        [button setTitle:@"已添加" forState:UIControlStateSelected];
        [button setImage:[UIImage imageNamed:@"按钮-我的消息-同意"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"按钮-我的消息-同意-按下"] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"按钮-我的消息-已添加"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(gotoAgreen:) forControlEvents:UIControlEventTouchUpInside];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@20);
            make.width.equalTo(@55);
            make.right.equalTo(weakSelf.contentView).with.offset(-10);
            make.bottom.equalTo(weakSelf.contentView).with.offset(-5);
            
        }];
        button;
    });
    
    
       self.imageView.layer.cornerRadius = 8.0f;
       self.imageView.layer.masksToBounds = YES;
       self.timeLabel.textColor = COLOR_WITH_RGB(4, 4, 4);
       self.detailTextLabel.textColor = COLOR_WITH_RGB(162, 165, 189);
       self.detailTextLabel.lineBreakMode = NSLineBreakByCharWrapping;
       self.detailTextLabel.numberOfLines = 0;
}

- (void)gotoAgreen:(UIButton*)sender
{
    self.agreenBtnClick(sender);

}


- (void)configureUIWithData:(MyMessageData*)messageData
{
   /* if (!messageData) {
        return;
    }
   */
   //TODO:拿到数据赋值
    self.imageView.image = [UIImage imageNamed:@"图标-我-设置"];
    self.textLabel.text = @"酥酥的小饼干";
    self.detailTextLabel.text = @"申请加您为好友申请加您为好友申请加您为好友申请加您为好友申请加您为好友申请加您为好友申请加您为好友";
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
