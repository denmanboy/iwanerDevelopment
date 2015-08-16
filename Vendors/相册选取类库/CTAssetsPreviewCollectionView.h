//
//  CTAssetsPreviewCollectionView.h
//  CTAssetsPickerDemo
//
//  Created by wshaolin on 15/7/27.
//  Copyright (c) 2015年 神州锐达（北京）科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTAssetsPreviewCollectionView : UICollectionView

- (instancetype)initWithDataSource:(id<UICollectionViewDataSource>)dataSource delegate:(id<UICollectionViewDelegate>)delegate;

- (void)scrollToItemAtIndexPath:(NSIndexPath *)indexPath;

@end
