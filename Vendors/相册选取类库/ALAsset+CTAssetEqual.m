//
//  ALAsset+CTAssetEqual.m
//  CTAssetsPickerDemo
//
//  Created by wshaolin on 15/7/13.
//  Copyright (c) 2015年 神州锐达（北京）科技有限公司. All rights reserved.
//

#import "ALAsset+CTAssetEqual.h"

@implementation ALAsset (CTAssetEqual)

- (BOOL)isEqual:(id)object{
    if([object isKindOfClass:[ALAsset class]]){
        NSURL *selfURL = [self valueForProperty:ALAssetPropertyAssetURL];
        NSURL *assetURL = [(ALAsset *)object valueForProperty:ALAssetPropertyAssetURL];
        return [selfURL.absoluteString isEqualToString:assetURL.absoluteString];
    }
    return NO;
}

@end
