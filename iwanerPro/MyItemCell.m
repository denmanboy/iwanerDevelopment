//
//  MyItemCell.m
//  iwanerPro
//
//  Created by dengyanzhou on 15/7/27.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import "MyItemCell.h"
#define kHeadImage_Width 30
#define kHeadImage_Height 30
#define kHeadImage_Tag 100

/**实现文件*/
@implementation MyItemData


- (void)parseInfoWithDic:(NSDictionary*)dic
{
    [super setValuesForKeysWithDictionary:dic];
    
}
/**
 *  重写父类方法
 *
 *  @param value <#value description#>
 *  @param key   <#key description#>
 */
- (void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:[value nullTonil] forKey:key];
    
}

/**找不到的key*/
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"该key没有找到");
    
}
- (id)valueForUndefinedKey:(NSString *)key
{
    return nil;
    
}






@end


@implementation MyItemCell


/**
 *  重写父类方法
 *
 *  @param style           <#style description#>
 *  @param reuseIdentifier <#reuseIdentifier description#>
 *
 *  @return <#return value description#>
 */

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self createUI];
    }
    return self;
}

/**布局UI*/
- (void)createUI
{
    WS(weakSelf);
    
    //上部图片
    self.topImageView = ({
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
        [self.contentView addSubview:imageView];
        imageView;
    });
    
    //进行中
    self.button = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"爱玩状态-正报名"] forState:UIControlStateNormal];
        button.enabled = NO;
        button.backgroundColor =[UIColor redColor];
        [self.contentView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(weakSelf.contentView).with.offset(10);
            make.right.equalTo(weakSelf.contentView);
        }];
        button;
    });
    
    
    //主题
    self.themeLabel = ({
        UILabel  *label = [UILabel new];
        label.text = @"周末欢乐行:骑马，免费试吃";
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor whiteColor];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
    
            make.centerX.equalTo(weakSelf.contentView);
            make.bottom.equalTo(weakSelf.topImageView).offset(-5);
        }];
        label;
    
    });
    
    
    //个人头像
    self.headImageView = ({
        UIImageView* imageView = [UIImageView new];
        imageView.layer.cornerRadius = 8;
        imageView.layer.masksToBounds = YES;
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@30);
            make.height.equalTo(@30);
            make.left.equalTo(weakSelf.contentView).offset(10);
            make.bottom.equalTo(weakSelf.topImageView).offset(10);
            
        }];
        imageView;
    
    });
    
    //时间图片
    self.timeView = ({
        UIImageView *imageView = [UIImageView new];
        imageView.image = [UIImage imageNamed:@"图标-爱玩-时间"];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.headImageView);
            make.top.equalTo(weakSelf.headImageView.mas_bottom).offset(5);
            
        }];
        imageView;
    
    });
    
    //时间标签
    self.timeLabel = ({
        UILabel *labele = [UILabel new];
        labele.text = @"11-1 15:00(周六) 至 11-2 15:00(周日)";
        labele.font = [UIFont systemFontOfSize:12];
        labele.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:labele];
        [labele mas_makeConstraints:^(MASConstraintMaker *make) {
         
            make.left.equalTo(weakSelf.timeView.mas_right).offset(2);
            make.centerY.equalTo(weakSelf.timeView);
        }];
        labele;
    });
    
    //地址图片
    self.addressView = ({
        UIImageView *imageView = [UIImageView new];
        imageView.image = [UIImage imageNamed:@"图标-爱玩-地点"];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.timeLabel.mas_bottom).offset(12);
            make.left.equalTo(self.headImageView);

        }];
        imageView;

    });
    
    //地点标签
    self.addressLabel  = ({
        UILabel  *label = [UILabel new];
        label.text = @"北京市海淀区中关村大街7好T.It创意园";
        label.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressView.mas_right).offset(2);
            make.centerY.equalTo(self.addressView);
            
        }];
        label;
    });
    
    //心星button
    self.heartButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"按钮-爱玩-赞-灰"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"按钮-爱玩-赞-红"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(zanButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.topImageView.mas_bottom).offset(10);
            make.right.equalTo(weakSelf.contentView).offset(-10);
        }];
        
        button;

    });
    
    //数字label
    self.numLabel = ({
        UILabel *label = [UILabel new];
        label.text = @"20";
        label.font = [UIFont systemFontOfSize:13];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(weakSelf.heartButton.mas_centerX);
            make.centerY.equalTo(weakSelf.addressLabel.mas_centerY);
        }];
    
        label;
    });
    
    
    //时间下面的背景条
    UIView *backView = [UIView new];
    backView.backgroundColor = COLOR_WITH_RGB(235, 235, 242);
    [self.contentView addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(weakSelf.addressLabel.mas_bottom).offset(10);
        make.height.equalTo(@40);
        make.left.right.equalTo(weakSelf.contentView);
        
    }];
    
    //竖线
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_WITH_RGB(250, 250, 251);
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.headImageView.mas_bottom);
        make.width.equalTo(@1);
        make.bottom.equalTo(backView.mas_top).offset(-5);
        make.right.equalTo(weakSelf.heartButton.mas_left).offset(-10);
    
    }];
    
    
   //循环创建头像
    CGFloat h_space = (self.contentView.width - kHeadImage_Width * 8)/9;
    for (NSInteger i = 0; i < 8; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake((h_space + kHeadImage_Width) * i + h_space, 5, kHeadImage_Width, kHeadImage_Height);
        button.layer.cornerRadius = 15;
        button.layer.masksToBounds = YES;
        button.tag = kHeadImage_Tag + i;
        if (i < 7) {
          [button setBackgroundImage:[UIImage imageNamed:@"分享-QQ"] forState:UIControlStateNormal];
        }else{
        
            button.backgroundColor = [UIColor redColor];
            button.titleLabel.font = [UIFont systemFontOfSize:13];
            [button setTitle:@"99+" forState:UIControlStateNormal];
        }

        [backView addSubview:button];
        
    }
}

/**配置UI*/
-(void)configureUIWith:(MyItemData*)itemData
{
//    if (!itemData) {
//        return;
//    }
    self.topImageView.image = [UIImage imageNamed:@"Default-568h"];
    self.headImageView.image = [UIImage imageNamed:@"导航-我-红@3x"];;
    
    
    

}


//button的回调
- (void)zanButtonClick:(UIButton*)sender
{
    sender.selected = !sender.selected;
    self.zanBlock();

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
