//
//  CTAssetsCollectionViewCell.m
//  CTAssetsPicker
//
//  Created by wshaolin on 15/7/9.
//  Copyright (c) 2015年 神州锐达（北京）科技有限公司. All rights reserved.
//

#import "CTAssetsCollectionViewCell.h"
#import "CTAssetsPickerAssetData.h"
#import "CTAssetsToolBarButtonItem.h"

@interface CTAssetsCollectionViewCell(){
    UIImageView *_displayImageView;
    UIImageView *_videoImageView;
    UIView *_selectedMask;
    CTAssetsToolBarButtonItem *_selectButton;
    UILabel *_videoDurationLabel;
}

@end

@implementation CTAssetsCollectionViewCell

+ (instancetype)assetCellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"CTAssetsCollectionViewCell";
    return [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        _displayImageView = [[UIImageView alloc] init];
        _displayImageView.clipsToBounds = YES;
        _displayImageView.contentMode = UIViewContentModeScaleAspectFill;
        
        _selectedMask = [[UIView alloc] init];
        _selectedMask.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.4];
        _selectedMask.hidden = YES;
        
        _selectButton = [CTAssetsToolBarButtonItem buttonWithType:UIButtonTypeCustom];
        _selectButton.enableHighlighted = NO;
        _selectButton.backgroundColor = [UIColor clearColor];
        [_selectButton setImage:[UIImage imageNamed:@"CTAssetsPicker.bundle/CTAssetsPickerSelectButtonNormal"] forState:UIControlStateNormal];
        [_selectButton setImage:[UIImage imageNamed:@"CTAssetsPicker.bundle/CTAssetsPickerSelectButtonSelected"] forState:UIControlStateSelected];
        [_selectButton addTarget:self action:@selector(didClickSelectButton:)];
        
        _videoImageView = [[UIImageView alloc] init];
        _videoImageView.image = [UIImage imageNamed:@"CTAssetsPicker.bundle/CTAssetsPickerVideo"];
        _videoImageView.contentMode = UIViewContentModeCenter;
        _videoImageView.hidden = YES;
        
        _videoDurationLabel = [[UILabel alloc] init];
        _videoDurationLabel.textAlignment = NSTextAlignmentRight;
        _videoDurationLabel.textColor = [UIColor whiteColor];
        _videoDurationLabel.font = [UIFont systemFontOfSize:11.0];
        
        [self.contentView addSubview:_displayImageView];
        [self.contentView addSubview:_selectedMask];
        [self.contentView addSubview:_selectButton];
        [self.contentView addSubview:_videoImageView];
        [self.contentView addSubview:_videoDurationLabel];
        
        self.backgroundView = nil;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setAssetData:(CTAssetsPickerAssetData *)assetData{
    _assetData = assetData;
    _displayImageView.image = [UIImage imageWithCGImage:_assetData.asset.aspectRatioThumbnail];
    _selectedMask.hidden = !_assetData.isSelected;
    _selectButton.selected = _assetData.isSelected;
    _videoImageView.hidden = _assetData.assetDataType != CTAssetsPickerAssetDataTypeVideo;
    _videoDurationLabel.hidden = _videoImageView.isHidden;
    _videoDurationLabel.text = _assetData.videoDuration;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    _displayImageView.frame = self.bounds;
    _selectedMask.frame = self.bounds;
    
    CGFloat selectButton_W = 30.0;
    CGFloat selectButton_H = selectButton_W;
    CGFloat selectButton_X = self.bounds.size.width - selectButton_W;
    CGFloat selectButton_Y = 0;
    _selectButton.frame = CGRectMake(selectButton_X, selectButton_Y, selectButton_W, selectButton_H);
    
    CGFloat video_M = 5.0;
    CGFloat videoImageView_W = 16.0;
    CGFloat videoImageView_H = 9.0;
    CGFloat videoImageView_X = video_M;
    CGFloat videoImageView_Y = self.bounds.size.height - videoImageView_H - video_M;
    _videoImageView.frame = CGRectMake(videoImageView_X, videoImageView_Y, videoImageView_W, videoImageView_H);
    
    CGFloat videoDurationLabel_X = CGRectGetMaxX(_videoImageView.frame) + video_M;
    CGFloat videoDurationLabel_H = 20.0;
    CGFloat videoDurationLabel_W = self.bounds.size.width - videoDurationLabel_X - video_M;
    CGFloat videoDurationLabel_Y = self.bounds.size.height - videoDurationLabel_H;
    _videoDurationLabel.frame = CGRectMake(videoDurationLabel_X, videoDurationLabel_Y, videoDurationLabel_W, videoDurationLabel_H);
}

- (void)didClickSelectButton:(UIButton *)button{
    BOOL shouldSelection = YES;
    if(!button.isSelected){
        if(self.delegate && [self.delegate respondsToSelector:@selector(assetsCollectionViewCell:shouldSelectAtIndexPath:)]){
            shouldSelection = [self.delegate assetsCollectionViewCell:self shouldSelectAtIndexPath:self.indexPath];
        }
    }
    
    if(shouldSelection){
        _assetData.selected = !_assetData.isSelected;
        self.assetData = _assetData;
        
        if(self.delegate && [self.delegate respondsToSelector:@selector(assetsCollectionViewCell:didSelectedAssetData:withIndexPath:)]){
            [self.delegate assetsCollectionViewCell:self didSelectedAssetData:_assetData.isSelected withIndexPath:self.indexPath];
        }
    }
}

@end
