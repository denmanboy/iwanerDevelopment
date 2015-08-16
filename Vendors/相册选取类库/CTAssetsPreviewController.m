//
//  CTAssetsPreviewController.m
//  CTAssetsPickerDemo
//
//  Created by wshaolin on 15/7/13.
//  Copyright (c) 2015年 神州锐达（北京）科技有限公司. All rights reserved.
//

#import "CTAssetsPreviewController.h"
#import "CTAssetsViewToolBar.h"
#import "CTAssetView.h"
#import "CTAssetsPickerController.h"
#import "CTAssetsPickerAssetData.h"
#import "CTAssetsToolBarButtonItem.h"
#import "CTAssetsPreviewCollectionViewCell.h"
#import "CTAssetsPreviewCollectionView.h"

@interface CTAssetsPreviewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, CTAssetsPreviewCollectionViewCellDelegate, CTAssetsViewToolBarDelegate>{
    CTAssetsPreviewCollectionView *_collectionView;
    CTAssetsViewToolBar *_toolBar;
    CTAssetsToolBarButtonItem *_selectBarButtonItem;
    
    BOOL _initialStatusBarHidden;
    BOOL _initialNavigationBarTranslucent;
    
    __weak CTAssetsPickerController *_assetsPickerController;
}

@end

@implementation CTAssetsPreviewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
        self.title = NSLocalizedString(@"预览", nil);
        self.automaticallyAdjustsScrollViewInsets = NO;
        
        _toolBar = [[CTAssetsViewToolBar alloc] init];
        _toolBar.hiddenPreviewItem = YES;
        _toolBar.delegate = self;
        _toolBar.translucent = YES;
        
        _selectBarButtonItem = [CTAssetsToolBarButtonItem buttonWithType:UIButtonTypeCustom];
        _selectBarButtonItem.enableHighlighted = NO;
        [_selectBarButtonItem setImage:[UIImage imageNamed:@"CTAssetsPicker.bundle/CTAssetsPickerSelectButtonNormal"] forState:UIControlStateNormal];
        [_selectBarButtonItem setImage:[UIImage imageNamed:@"CTAssetsPicker.bundle/CTAssetsPickerSelectButtonSelected"] forState:UIControlStateSelected];
        _selectBarButtonItem.backgroundColor = [UIColor clearColor];
        [_selectBarButtonItem addTarget:self action:@selector(didClickSelectBarButtonItem:)];
        _selectBarButtonItem.frame = CGRectMake(0, 0, 40.0, 40.0);
        
        _collectionView = [[CTAssetsPreviewCollectionView alloc] initWithDataSource:self delegate:self];;
        [_collectionView registerClass:[CTAssetsPreviewCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([CTAssetsPreviewCollectionViewCell class])];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.translucent = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBar.translucent = _initialNavigationBarTranslucent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_selectBarButtonItem];
    
    _assetsPickerController = (CTAssetsPickerController *)self.navigationController;
    _initialStatusBarHidden = [UIApplication sharedApplication].statusBarHidden;
    _initialNavigationBarTranslucent = self.navigationController.navigationBar.isTranslucent;
    _toolBar.enableMaximumCount = _assetsPickerController.enableMaximumCount;
    [UIApplication sharedApplication].statusBarHidden = NO;
    
    // CTAssetsPreviewCollectionView的宽度多加CTAssetsPreviewCollectionViewCellImageRightIntervalSpacing
    // CTAssetsPreviewCollectionViewCell的Size等于CTAssetsPreviewCollectionView的Size
    // CTAssetsPreviewCollectionViewCell上的imageView的宽度减CTAssetsPreviewCollectionViewCellImageRightIntervalSpacing
    // 这样就留出了图片之间的空隙，空隙值为CTAssetsPreviewCollectionViewCellImageRightIntervalSpacing
    CGRect collectionViewFrame = self.view.bounds;
    collectionViewFrame.size.width += CTAssetsPreviewCollectionViewCellImageRightIntervalSpacing;
    _collectionView.frame = collectionViewFrame;
    [self.view addSubview:_collectionView];
    
    _toolBar.translucent = YES;
    _toolBar.frame = CGRectMake(0, self.view.bounds.size.height - _toolBar.frame.size.height, 0, 0);
    [self.view addSubview:_toolBar];
    
    // 滚动到指定的row
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:_currentAssetIndex inSection:0];
    if(self.assetDataArray.count > 0 && _currentAssetIndex < self.assetDataArray.count){
        [_collectionView scrollToItemAtIndexPath:indexPath];
        CTAssetsPickerAssetData *assetData = _assetDataArray[indexPath.row];
        _selectBarButtonItem.selected = assetData.isSelected;
    }
}

- (void)setSeletedCount:(NSInteger)seletedCount{
    _seletedCount = seletedCount;
    _toolBar.selectedCount = seletedCount;
}

- (void)didClickSelectBarButtonItem:(CTAssetsToolBarButtonItem *)barButtonItem{
    BOOL shouldSelection = YES;
    if(!barButtonItem.isSelected){
        if(_assetsPickerController.enableMaximumCount > 0 && _seletedCount == _assetsPickerController.enableMaximumCount){
            if(_assetsPickerController.delegate && [_assetsPickerController.delegate respondsToSelector:@selector(assetsPickerController:didSelectCountReachedEnableMaximumCount:)]){
                [_assetsPickerController.delegate assetsPickerController:_assetsPickerController didSelectCountReachedEnableMaximumCount:_assetsPickerController.enableMaximumCount];
            }
            shouldSelection = NO;
        }
    }
    
    if(shouldSelection){
        if(_currentAssetIndex < _assetDataArray.count){
            barButtonItem.selected = !barButtonItem.isSelected;
            CTAssetsPickerAssetData *assetData = _assetDataArray[_currentAssetIndex];
            assetData.selected = barButtonItem.isSelected;
            if(self.delegate && [self.delegate respondsToSelector:@selector(assetsPreviewController:didSelectedAssetData:)]){
                [self.delegate assetsPreviewController:self didSelectedAssetData:assetData];
            }
        }
    }
}

- (void)assetsPreviewCollectionViewCellDidSingleTouch:(CTAssetsPreviewCollectionViewCell *)collectionViewCell{
    BOOL animated = YES;
    if(self.navigationController.navigationBar.isHidden){
        [_toolBar show:animated];
        [[UIApplication sharedApplication] setStatusBarHidden:_initialStatusBarHidden withAnimation:UIStatusBarAnimationNone];
        [self.navigationController setNavigationBarHidden:NO animated:animated];
    }else{
        [_toolBar hide:animated];
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
        [self.navigationController setNavigationBarHidden:YES animated:animated];
    }
}

- (void)assetsViewToolBarDidCompleted:(CTAssetsViewToolBar *)assetsViewToolBar{
    if(self.delegate && [self.delegate respondsToSelector:@selector(assetsPreviewControllerDidCompleted:)]){
        [self.delegate assetsPreviewControllerDidCompleted:self];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _assetDataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CTAssetsPreviewCollectionViewCell *cell = [CTAssetsPreviewCollectionViewCell cellWithCollectionView:collectionView forIndexPath:indexPath];
    cell.assetData = _assetDataArray[indexPath.row];
    cell.delegate = self;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return collectionView.bounds.size;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _currentAssetIndex = (NSUInteger)lroundf(scrollView.contentOffset.x / scrollView.frame.size.width);
    if(_currentAssetIndex >= _assetDataArray.count){
        _currentAssetIndex = _assetDataArray.count - 1;
    }
    CTAssetsPickerAssetData *assetData = _assetDataArray[_currentAssetIndex];
    _selectBarButtonItem.selected = assetData.isSelected;
}

@end
