//
//  UIImageViewAdditions.h
//  TestFont
//
//  Created by yuanbo on 14-3-5.
//  Copyright 2014 yuanbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (UIImageViewEx)

-(void)show;

@end


@interface UIImageView(create)
+ (UIImageView *)imageViewWithName:(NSString *)name;
+ (UIImageView *)imageViewWithFrame:(CGRect)frame andImage:(UIImage *)image;

@end
