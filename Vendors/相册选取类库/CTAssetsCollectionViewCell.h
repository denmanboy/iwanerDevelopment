//
//  CTAssetsCollectionViewCell.h
//  CTAssetsPicker
//
//  Created by wshaolin on 15/7/9.
//  Copyright (c) 2015年 神州锐达（北京）科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CTAssetsPickerAssetData;
@class CTAssetsCollectionViewCell;

@protocol CTAssetsCollectionViewCellDelegate <NSObject>

@optional
- (void)assetsCollectionViewCell:(CTAssetsCollectionViewCell *)assetsCollectionViewCell didSelectedAssetData:(BOOL)isSelected withIndexPath:(NSIndexPath *)indexPath;

- (BOOL)assetsCollectionViewCell:(CTAssetsCollectionViewCell *)assetsCollectionViewCell shouldSelectAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface CTAssetsCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) CTAssetsPickerAssetData *assetData;
@property (nonatomic, weak) id<CTAssetsCollectionViewCellDelegate> delegate;

+ (instancetype)assetCellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;

@end
