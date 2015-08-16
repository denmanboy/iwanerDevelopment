//
//  CTAssetsPickerAssetData.h
//  CTAssetsPicker
//
//  Created by wshaolin on 15/7/9.
//  Copyright (c) 2015年 神州锐达（北京）科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

typedef NS_ENUM(NSInteger, CTAssetsPickerAssetDataType){
    CTAssetsPickerAssetDataTypePhoto,
    CTAssetsPickerAssetDataTypeVideo,
    CTAssetsPickerAssetDataTypeUnknown
};

@interface CTAssetsPickerAssetData : NSObject

@property (nonatomic, assign, readonly) CTAssetsPickerAssetDataType assetDataType;
@property (nonatomic, copy, readonly) NSString *videoDuration;
@property (nonatomic, strong, readonly) ALAsset *asset;
@property (nonatomic, assign, getter = isSelected) BOOL selected;

- (instancetype)initWithAsset:(ALAsset *)asset;

@end
