//
//  CTAssetsPreviewCollectionViewCell.h
//  CTAssetsPickerDemo
//
//  Created by wshaolin on 15/7/17.
//  Copyright (c) 2015年 神州锐达（北京）科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CTAssetsPreviewCollectionViewCellImageRightIntervalSpacing 20.0

@class CTAssetsPreviewCollectionViewCell;
@class CTAssetsPickerAssetData;

@protocol CTAssetsPreviewCollectionViewCellDelegate <NSObject>

@optional
- (void)assetsPreviewCollectionViewCellDidSingleTouch:(CTAssetsPreviewCollectionViewCell *)collectionViewCell;

@end

@interface CTAssetsPreviewCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) CTAssetsPickerAssetData *assetData;
@property (nonatomic, weak) id<CTAssetsPreviewCollectionViewCellDelegate> delegate;

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;

@end
