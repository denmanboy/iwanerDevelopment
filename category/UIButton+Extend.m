//
//  UIButton+Extend.m
//  iwanerPro
//
//  Created by liyuanbo on 9/8/15.
//  Copyright (c) 2015 iwaner. All rights reserved.
//

#import "UIButton+Extend.h"

@implementation UIButton (Extend)

    UIColor *normalBackgroundColor;
    UIColor *highBackgroundColor;




- (void)setBackgroundColor:(UIColor *)backgroundColor andHiglightGroundColor:(UIColor *)highColor
{
    
    normalBackgroundColor = backgroundColor;
    highBackgroundColor = highColor;
    
    
}


//- (void)setHighlighted:(BOOL)highlighted
//{
//    if (highlighted)
//    {
//        if (highBackgroundColor) {
//            self.backgroundColor = highBackgroundColor;
//        }else
//        {
//            [super setHighlighted:highlighted];
//        }
//
//        
//    }else
//    {
//        if (normalBackgroundColor) {
//            self.backgroundColor = normalBackgroundColor;
//        }else
//        {
//            [super setHighlighted:highlighted];
//        }
//
//    }
//    
//}

@end
