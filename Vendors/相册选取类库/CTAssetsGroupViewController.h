//
//  CTAssetsGroupViewController.h
//  CTAssetsPicker
//
//  Created by wshaolin on 15/7/9.
//  Copyright (c) 2015年 神州锐达（北京）科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTAssetsGroupViewController : UIViewController

@property (nonatomic, strong, readonly) NSArray *selectedAssets;

@property (nonatomic, strong) UIColor *toolbarItemBackgroundColor;
@property (nonatomic, strong) UIColor *toolbarItemFontColor;

- (void)deselectAssetAtIndex:(NSUInteger)index;

@end
