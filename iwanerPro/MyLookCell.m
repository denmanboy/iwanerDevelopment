//
//  MyLookCell.m
//  iwanerPro
//
//  Created by dengyanzhou on 15/7/31.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import "MyLookCell.h"

#define kImage_Space  6
#define kHeadImage_Space 5
#define kHeadImage_width 30
#define kHeadImage_Height 30
@implementation MyLookData


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
{   //容错
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



@implementation MyLookCell

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
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self createUI];
    }
    return self;

}

- (void)createUI
{
    WS(weakSelf);
    
   //头像
    self.imageView.layer.cornerRadius = 5;
    self.imageView.layer.masksToBounds = YES;
    self.imageView.image = [UIImage imageNamed:@"分享-微信"];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.contentView).offset(10);
        make.left.equalTo(weakSelf.contentView).offset(10);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    //昵称
    self.textLabel.text = @"酥酥的小饼干";
    self.textLabel.font = [UIFont systemFontOfSize:13];
    self.textLabel.textAlignment = NSTextAlignmentLeft;
    self.textLabel.textColor = COLOR_WITH_RGB(4,4, 4);
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.imageView.mas_right).offset(10);
        make.centerY.equalTo(weakSelf.imageView);
    }];
  
    //时间
    self.timeLabel = ({
        UILabel *label = [UILabel new];
        label.text = @"2分钟前";
        label.font = [UIFont boldSystemFontOfSize:12];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(weakSelf.contentView).offset(-10) ;
            make.centerY.equalTo(weakSelf.textLabel);
        }];
        
        label;
    });
    self.detailTextLabel.text = @"是谁那么慌 踩碎我一路的天光 是谁面无表情摇晃 醉倒我一眼的迷茫 烟花在绽放 却 绚烂不过心里的一次芬芳 岁月在疯狂 却 麻木不了雾里的一段悲伤 说不出 道不明的失望 只是因为心在流浪 破碎的脚印 开始在彷徨 就算遗忘了折断的翅膀 我是否还可以飞翔 结局和过程都有了，再去纠缠，连自己都觉得贪婪 我有没有跟你说过爱是我不变的信仰 我有没有告诉过你爱就是永远把一个人放在心上 男生的誓言往往像甜而脆的薄饼，进入嘴巴就会慢慢的溶化。可是它又会迅速地潜伏进你的体内，占领你的心";
    self.detailTextLabel.numberOfLines = 0;
    self.detailTextLabel.font = [UIFont systemFontOfSize:13];
    [self.detailTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(weakSelf.imageView.mas_bottom).offset(10);
        make.left.equalTo(weakSelf.contentView).offset(10);
        make.right.equalTo(weakSelf.contentView).offset(-10);
        
    }];
    //左边
    self.lImageView = ({
    
        UIImageView *imageView = [UIImageView new];
        imageView.image = [UIImage imageNamed:@"Default-568h" ];
        imageView.layer.cornerRadius = 5;
        imageView.layer.masksToBounds = YES;
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
      
            make.top.equalTo(weakSelf.detailTextLabel.mas_bottom).offset(10);
            make.left.equalTo(weakSelf.contentView).offset(kImage_Space);
            make.height.equalTo(@60);
        }];
        imageView;
    });
    //中间
    self.mImageView = ({
    
        UIImageView *imageView = [UIImageView new];
        imageView.image = [UIImage imageNamed:@"Default-568h" ];
        imageView.layer.cornerRadius = 5;
        imageView.layer.masksToBounds = YES;
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(weakSelf.lImageView);
            make.left.equalTo(weakSelf.lImageView.mas_right).offset(kImage_Space);
            make.width.equalTo(weakSelf.lImageView.mas_width);
            make.height.equalTo(weakSelf.lImageView);
        }];
        imageView;
    
    
    });
    //右边
    self.mImageView = ({
        
        UIImageView *imageView = [UIImageView new];
        imageView.image = [UIImage imageNamed:@"Default-568h" ];
        imageView.layer.cornerRadius = 5;
        imageView.layer.masksToBounds = YES;
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(weakSelf.lImageView);
            make.left.equalTo(weakSelf.mImageView.mas_right).offset(kImage_Space);
            make.right.equalTo(weakSelf.contentView).offset(-kImage_Space);
            make.width.equalTo(weakSelf.lImageView);
            make.height.equalTo(weakSelf.lImageView);

        }];
        imageView;
        
        
    });
    //背景
    self.backView = ({
    UIView *backView = [UIView new];
    [self.contentView addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(weakSelf.contentView);
        make.height.equalTo(@40);
        make.top.equalTo(weakSelf.lImageView.mas_bottom);
        
    }];
        backView;
    });
   
    //评论
    self.commentBtn = ({
    
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 100;
        [button addTarget:self action:@selector(gotoCommentOrDelete:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundImage:[UIImage imageNamed:@"按钮-主题详情-留言"] forState:UIControlStateNormal];
        [_backView addSubview:button];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.backView).offset(10);
            make.centerY.equalTo(weakSelf.backView);
            make.height.equalTo(@20);
            make.width.equalTo(@20);
        }];
        button;
    });
    //删除
    self.deleteBtn = ({
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 200;
        [button addTarget:self action:@selector(gotoCommentOrDelete:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundImage:[UIImage imageNamed:@"按钮-我的主题-删除"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"按钮-我的主题-删除-按下"] forState:UIControlStateHighlighted];
        [weakSelf.backView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(weakSelf.backView).offset(-10);
            make.centerY.equalTo(weakSelf.backView);
            make.height.equalTo(@20);
            make.width.equalTo(@20);
           
        }];
        button;
    });
    
    //数量
    self.numBtn = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"25+" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:11];
        button.backgroundColor = COLOR_WITH_RGB(182, 177, 171);
        button.layer.cornerRadius = 12;
        button.layer.masksToBounds = YES;
        [weakSelf.backView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.centerY.equalTo(weakSelf.backView);
            make.right.equalTo(weakSelf.deleteBtn.mas_left).offset(-10);
            make.width.equalTo(@25);
            make.width.equalTo(@25);
            
            
        }];
        button;
    });
    
    //创建下部头像
    [self createHeadImage];

    //底部色条
    UIView *bottom_Color_View = [UIView new];
    bottom_Color_View.backgroundColor = COLOR_WITH_RGB(235, 235, 242);
    [self.contentView addSubview:bottom_Color_View];
    [bottom_Color_View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.contentView);
        make.right.equalTo(weakSelf.contentView);
        make.top.equalTo(weakSelf.backView.mas_bottom);
        make.height.equalTo(@10);
        make.bottom.equalTo(weakSelf.contentView);
        
    }];
}

- (void)createHeadImage
{
    CGFloat start_X = 45;

    for (int i = 0; i< 100 ;i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((kHeadImage_Space + kHeadImage_width) * i + start_X,5,  kHeadImage_width, kHeadImage_Height)];
        if (CGRectGetMaxX(imageView.frame)> (SCREEN_WIDTH - 70)) {
            return;
        }
        imageView.layer.cornerRadius = 13;
        imageView.layer.masksToBounds = YES;
        imageView.image = [UIImage imageNamed:@"分享-朋友圈"];
        [self.backView addSubview:imageView];
        
    }
}

//btn回调
- (void)gotoCommentOrDelete:(UIButton*)sender
{
    self.cellBtnBlock(sender);
}


//填充数据
- (void)configurationUIWithData:(MyLookData*)data{
    
    
    
}
/**
 *  从xib加载时的回调
 */
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
