//
//  IWButton.m
//  iwanerPro
//
//  Created by liyuanbo on 9/8/15.
//  Copyright (c) 2015 iwaner. All rights reserved.
//

#import "IWButton.h"

@implementation IWButton
{
    UIColor *normalBackgroundColor;
    UIColor *highBackgroundColor;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/




- (void)setBackgroundColor:(UIColor *)backgroundColor andHiglightGroundColor:(UIColor *)highColor
{
    
    normalBackgroundColor = backgroundColor;
    highBackgroundColor = highColor;
    
    
}


- (void)setHighlighted:(BOOL)highlighted
{
    if (highlighted)
    {
        self.backgroundColor = highBackgroundColor;
        
    }else
    {
        self.backgroundColor = normalBackgroundColor;
    }
    
}


@end
