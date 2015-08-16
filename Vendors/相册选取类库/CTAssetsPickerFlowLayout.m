//
//  CTAssetsPickerFlowLayout.m
//  CTAssetsPicker
//
//  Created by wshaolin on 15/7/10.
//  Copyright (c) 2015年 神州锐达（北京）科技有限公司. All rights reserved.
//

#import "CTAssetsPickerFlowLayout.h"

@implementation CTAssetsPickerFlowLayout

- (instancetype)init{
    if(self = [super init]){
        CGFloat assetMargin = 5.0;
        CGFloat assetColunm = 4;
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
        if(screenWidth > screenHeight){
            screenWidth = screenHeight;
        }
        CGFloat assetWidth = (screenWidth - (assetColunm + 1) * assetMargin) / assetColunm;
        CGFloat assetHeight = assetWidth;
        
        self.itemSize = CGSizeMake(assetWidth, assetHeight);
        self.sectionInset = UIEdgeInsetsMake(assetMargin, assetMargin, assetMargin, assetMargin);
        self.minimumInteritemSpacing = assetMargin;
        self.minimumLineSpacing = assetMargin;
        self.headerReferenceSize = CGSizeZero;
        self.footerReferenceSize = CGSizeZero;
    }
    return self;
}

@end
