//
//  CTAssetsPickerAssetData.m
//  CTAssetsPicker
//
//  Created by wshaolin on 15/7/9.
//  Copyright (c) 2015年 神州锐达（北京）科技有限公司. All rights reserved.
//

#import "CTAssetsPickerAssetData.h"

static inline NSString *CTAssetsPickerAssetDataVideoTime(NSTimeInterval timeInterval){
    int timeValue = (int)lroundf(timeInterval);
    if(timeValue > 0){
        int timeHour = 0; // 小时
        int timeMinute = 0; // 分钟
        int timeSecond = timeValue; // 秒
        int timeUnitValue = 60; // 时间单位值
        
        if(timeSecond >= timeUnitValue){
            timeMinute = timeValue / timeUnitValue;
            timeSecond = timeValue % timeUnitValue;
        }
        
        if (timeMinute >= timeUnitValue) {
            timeHour = timeMinute / timeUnitValue;
            timeMinute = timeMinute % timeUnitValue;
        }
        
        if(timeHour > 0){
            return [NSString stringWithFormat:@"%d:%.2d:%.2d", timeHour, timeMinute, timeSecond];
        }else{
            return [NSString stringWithFormat:@"%d:%.2d", timeMinute, timeSecond];
        }
    }
    return nil;
}

@implementation CTAssetsPickerAssetData

- (instancetype)initWithAsset:(ALAsset *)asset{
    if(self = [super init]){
        _asset = asset;
        _assetDataType = CTAssetsPickerAssetDataTypeUnknown;
        if([self isPhoto]){
            _assetDataType = CTAssetsPickerAssetDataTypePhoto;
        }else if([self isVideo]){
            _assetDataType = CTAssetsPickerAssetDataTypeVideo;
            NSTimeInterval timeInterval = [[_asset valueForProperty:ALAssetPropertyDuration] floatValue];
            _videoDuration = CTAssetsPickerAssetDataVideoTime(timeInterval);
        }
        _selected = NO;
    }
    return self;
}

- (BOOL)isPhoto{
    return [ALAssetTypePhoto isEqualToString:[_asset valueForProperty:ALAssetPropertyType]];
}

- (BOOL)isVideo{
    return [ALAssetTypeVideo isEqualToString:[_asset valueForProperty:ALAssetPropertyType]];
}

- (BOOL)isUnknown{
    return [ALAssetTypeUnknown isEqualToString:[_asset valueForProperty:ALAssetPropertyType]];
}

@end
