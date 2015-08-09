//
//  UILabelButton.m
//  iwanerPro
//
//  Created by liyuanbo on 7/29/15.
//  Copyright (c) 2015 iwaner. All rights reserved.
//

#import "UILabelButton.h"

@implementation UILabelButton

- (void)addLabelInsertButton
{

    _label = [[UILabel alloc] initWithFrame:self.bounds];
    [self addSubview:_label];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
