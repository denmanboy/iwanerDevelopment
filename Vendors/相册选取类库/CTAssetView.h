//
//  CTAssetView.h
//  CTAssetsPickerDemo
//
//  Created by wshaolin on 15/7/13.
//  Copyright (c) 2015年 神州锐达（北京）科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CTAssetsPickerAssetData;
@class CTAssetView;

@protocol CTAssetViewDelegate <NSObject>

@optional
- (void)assetViewDidSingleTouch:(CTAssetView *)assetView;

@end

@interface CTAssetView : UIScrollView

@property (nonatomic, strong) CTAssetsPickerAssetData *assetData;
@property (nonatomic, weak) id<CTAssetViewDelegate> customDelegate;

@end
