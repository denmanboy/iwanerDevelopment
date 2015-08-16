//
//  CTAssetsPreviewCollectionViewCell.m
//  CTAssetsPickerDemo
//
//  Created by wshaolin on 15/7/17.
//  Copyright (c) 2015年 神州锐达（北京）科技有限公司. All rights reserved.
//

#import "CTAssetsPreviewCollectionViewCell.h"
#import "CTAssetView.h"

@interface CTAssetsPreviewCollectionViewCell()<CTAssetViewDelegate>{
    CTAssetView *_assetView;
}

@end

@implementation CTAssetsPreviewCollectionViewCell

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"CTAssetsPreviewCollectionViewCell";
    return [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        _assetView = [[CTAssetView alloc] init];
        _assetView.customDelegate = self;
        
        [self.contentView addSubview:_assetView];
        self.backgroundView = nil;
        self.contentView.backgroundColor = [UIColor clearColor];
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    return self;
}

- (void)setAssetData:(CTAssetsPickerAssetData *)assetData{
    _assetData = assetData;
    _assetView.assetData = _assetData;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect assetViewFrame = self.bounds;
    assetViewFrame.size.width -= CTAssetsPreviewCollectionViewCellImageRightIntervalSpacing;
    _assetView.frame = assetViewFrame;
}

- (void)assetViewDidSingleTouch:(CTAssetView *)assetView{
    if(self.delegate && [self.delegate respondsToSelector:@selector(assetsPreviewCollectionViewCellDidSingleTouch:)]){
        [self.delegate assetsPreviewCollectionViewCellDidSingleTouch:self];
    }
}

@end
