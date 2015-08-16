//
//  CTAssetsPreviewController.h
//  CTAssetsPickerDemo
//
//  Created by wshaolin on 15/7/13.
//  Copyright (c) 2015年 神州锐达（北京）科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CTAssetsPreviewController;
@class CTAssetsPickerAssetData;

@protocol CTAssetsPreviewControllerDelegate <NSObject>

@optional
- (void)assetsPreviewController:(CTAssetsPreviewController *)assetsPreviewController didSelectedAssetData:(CTAssetsPickerAssetData *)assetData;
- (void)assetsPreviewControllerDidCompleted:(CTAssetsPreviewController *)assetsPreviewController;

@end

@interface CTAssetsPreviewController : UIViewController

@property (nonatomic, strong) NSArray *assetDataArray;
@property (nonatomic, assign) NSUInteger currentAssetIndex;
@property (nonatomic, weak) id<CTAssetsPreviewControllerDelegate> delegate;

@property (nonatomic, assign) NSInteger seletedCount;

@end
