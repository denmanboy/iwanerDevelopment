//
//  CTAssetsViewController.m
//  CTAssetsPicker
//
//  Created by wshaolin on 15/7/9.
//  Copyright (c) 2015年 神州锐达（北京）科技有限公司. All rights reserved.
//

#import "CTAssetsViewController.h"
#import "CTAssetsPickerAssetData.h"
#import "CTAssetsCollectionViewCell.h"
#import "CTAssetsViewToolBar.h"
#import "CTAssetsPickerController.h"
#import "CTAssetsPickerCollectionView.h"
#import "CTAssetsPickerFlowLayout.h"
#import "CTAssetsPreviewController.h"
#import "ALAsset+CTAssetEqual.h"

@interface CTAssetsViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, CTAssetsViewToolBarDelegate, CTAssetsPreviewControllerDelegate, CTAssetsCollectionViewCellDelegate>{
    CTAssetsPickerCollectionView *_collectionView;
    NSMutableArray *_assetDatas;
    NSMutableArray *_selectAssets; // ALAsset
    NSMutableArray *_selectAssetDatas; // CTAssetsPickerAssetData
    CTAssetsViewToolBar *_toolBar;
    
    __weak CTAssetsPickerController *_assetsPickerController;
}

@end

@implementation CTAssetsViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
        _assetDatas = [NSMutableArray array];
        _selectAssets = [NSMutableArray array];
        _selectAssetDatas = [NSMutableArray array];
        
        _toolBar = [[CTAssetsViewToolBar alloc] init];
        _toolBar.delegate = self;
        
        _collectionView = [[CTAssetsPickerCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[CTAssetsPickerFlowLayout alloc] init]];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[CTAssetsCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([CTAssetsCollectionViewCell class])];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"取消", nil) style:UIBarButtonItemStylePlain target:self action:@selector(didClickCancelBarButtonItem:)];
    
    _assetsPickerController = (CTAssetsPickerController *)self.navigationController;
    
    _toolBar.enableMaximumCount = _assetsPickerController.enableMaximumCount;
    _toolBar.frame = CGRectMake(0, self.view.bounds.size.height - _toolBar.frame.size.height, 0, 0);
    _toolBar.hidden = _assetDatas.count == 0;
    _toolBar.translucent = self.navigationController.navigationBar.isTranslucent;
    
    _collectionView.frame = self.view.bounds;
    _collectionView.contentInsetBottom = _toolBar.frame.size.height;
    
    [self.view addSubview:_collectionView];
    [self.view addSubview:_toolBar];
}

- (void)didClickCancelBarButtonItem:(UIBarButtonItem *)barButtonItem{
    if(_assetsPickerController.delegate && [_assetsPickerController.delegate respondsToSelector:@selector(assetsPickerControllerDidCancel:)]){
        [_assetsPickerController.delegate assetsPickerControllerDidCancel:_assetsPickerController];
    }
    [_assetsPickerController dismissViewControllerAnimated:YES completion:NULL];
}

- (void)setAssetsGroup:(ALAssetsGroup *)assetsGroup{
    self.title = [assetsGroup valueForProperty:ALAssetsGroupPropertyName];
    
    [assetsGroup enumerateAssetsUsingBlock:^(ALAsset *asset, NSUInteger index, BOOL *stop) {
        if (asset != nil){
            CTAssetsPickerAssetData *assetData = [[CTAssetsPickerAssetData alloc] initWithAsset:asset];
            [_assetDatas addObject:assetData];
        }else{
            *stop = YES;
            [_collectionView reloadData];
        }
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _assetDatas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CTAssetsCollectionViewCell *cell = [CTAssetsCollectionViewCell assetCellWithCollectionView:collectionView forIndexPath:indexPath];
    cell.indexPath = indexPath;
    cell.delegate = self;
    cell.assetData = _assetDatas[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    CTAssetsPreviewController *assetsPreviewController = [[CTAssetsPreviewController alloc] init];
    assetsPreviewController.assetDataArray = [_assetDatas copy];
    assetsPreviewController.currentAssetIndex = indexPath.row;
    assetsPreviewController.delegate = self;
    assetsPreviewController.seletedCount = _selectAssets.count;
    [self.navigationController pushViewController:assetsPreviewController animated:YES];
}

- (void)assetsCollectionViewCell:(CTAssetsCollectionViewCell *)assetsCollectionViewCell didSelectedAssetData:(BOOL)isSelected withIndexPath:(NSIndexPath *)indexPath{
    CTAssetsPickerAssetData *assetData = _assetDatas[indexPath.row];
    assetData.selected = isSelected;
    if(assetData.isSelected){
        [_collectionView reloadItemsAtIndexPaths:@[indexPath]];
        [_selectAssets addObject:assetData.asset];
        [_selectAssetDatas addObject:assetData];
        _toolBar.selectedCount = _selectAssets.count;
        
        if(_assetsPickerController.delegate && [_assetsPickerController.delegate respondsToSelector:@selector(assetsPickerController:didSelectAsset:)]){
            [_assetsPickerController.delegate assetsPickerController:_assetsPickerController didSelectAsset:assetData.asset];
        }
    }else{ // 移除选择
        [_collectionView reloadItemsAtIndexPaths:@[indexPath]];
        
        if([_selectAssets containsObject:assetData.asset]){
            [_selectAssets removeObject:assetData.asset];
        }
        
        if([_selectAssetDatas containsObject:assetData]){
            [_selectAssetDatas removeObject:assetData];
        }
        
        if(_assetsPickerController.delegate && [_assetsPickerController.delegate respondsToSelector:@selector(assetsPickerController:didDeselectAsset:)]){
            [_assetsPickerController.delegate assetsPickerController:_assetsPickerController didDeselectAsset:assetData.asset];
        }
        _toolBar.selectedCount = _selectAssets.count;
    }
}

- (BOOL)assetsCollectionViewCell:(CTAssetsCollectionViewCell *)assetsCollectionViewCell shouldSelectAtIndexPath:(NSIndexPath *)indexPath{
    if(_assetsPickerController.enableMaximumCount > 0 && _selectAssets.count >= _assetsPickerController.enableMaximumCount){
        if(_assetsPickerController.delegate && [_assetsPickerController.delegate respondsToSelector:@selector(assetsPickerController:didSelectCountReachedEnableMaximumCount:)]){
            [_assetsPickerController.delegate assetsPickerController:_assetsPickerController didSelectCountReachedEnableMaximumCount:_assetsPickerController.enableMaximumCount];
        }
        return NO;
    }
    return YES;
}

- (void)assetsViewToolBarDidCompleted:(CTAssetsViewToolBar *)assetsViewToolBar{
    if(_assetsPickerController.enableMinimumCount > 0 && _selectAssets.count < _assetsPickerController.enableMinimumCount){
        if(_assetsPickerController.delegate && [_assetsPickerController.delegate respondsToSelector:@selector(assetsPickerController:didSelectCountUnderEnableMinimumCount:)]){
            [_assetsPickerController.delegate assetsPickerController:_assetsPickerController didSelectCountUnderEnableMinimumCount:_assetsPickerController.enableMinimumCount];
        }
    }else{
        if(_assetsPickerController.delegate){
            [_assetsPickerController.delegate assetsPickerController:_assetsPickerController didFinishPickingAssets:[_selectAssets copy] assetsType:_assetsPickerController.assetsType];
        }
        
        if(_assetsPickerController.isFinishDismissViewController){
            [_assetsPickerController dismissViewControllerAnimated:YES completion:NULL];
        }
    }
}

- (void)assetsViewToolBarDidPreviewed:(CTAssetsViewToolBar *)assetsViewToolBar{
    CTAssetsPreviewController *assetsPreviewController = [[CTAssetsPreviewController alloc] init];
    assetsPreviewController.assetDataArray = [_selectAssetDatas copy];
    assetsPreviewController.currentAssetIndex = 0;
    assetsPreviewController.delegate = self;
    assetsPreviewController.seletedCount = _selectAssets.count;
    [self.navigationController pushViewController:assetsPreviewController animated:YES];
}

- (NSArray *)selectedAssets{
    return [_selectAssets copy];
}

- (void)deselectAssetAtIndex:(NSUInteger)index{
    if(index < _selectAssets.count){
        ALAsset *asset = _selectAssets[index];
        for(NSInteger i = 0; i < _assetDatas.count; i ++){
            CTAssetsPickerAssetData *assetData = _assetDatas[i];
            if([assetData.asset isEqual:asset]){
                assetData.selected = NO;
                NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
                [_collectionView reloadItemsAtIndexPaths:@[indexPath]];
                break;
            }
        }
        
        [_selectAssets removeObjectAtIndex:index];
        [_selectAssetDatas removeObjectAtIndex:index];
        _toolBar.selectedCount = _selectAssets.count;
    }
}

- (void)setToolbarItemBackgroundColor:(UIColor *)toolbarItemBackgroundColor{
    [_toolBar setBarButtonItemBackgroundColor:toolbarItemBackgroundColor];
}

- (void)setToolbarItemFontColor:(UIColor *)toolbarItemFontColor{
    [_toolBar setBarButtonItemFontColor:toolbarItemFontColor];
}

- (void)assetsPreviewControllerDidCompleted:(CTAssetsPreviewController *)assetsPreviewController{
    [self assetsViewToolBarDidCompleted:_toolBar];
}

- (void)assetsPreviewController:(CTAssetsPreviewController *)assetsPreviewController didSelectedAssetData:(CTAssetsPickerAssetData *)assetData{
    for(NSInteger index = 0; index < _assetDatas.count; index ++){
        CTAssetsPickerAssetData *assetsPickerAssetData = _assetDatas[index];
        if([assetsPickerAssetData.asset isEqual:assetData.asset]){
            assetsPickerAssetData.selected = assetData.isSelected;
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
            [_collectionView reloadItemsAtIndexPaths:@[indexPath]];
            break;
        }
    }
    
    if(assetData.isSelected){
        [_selectAssetDatas addObject:assetData];
        [_selectAssets addObject:assetData.asset];
        if(_assetsPickerController.delegate && [_assetsPickerController.delegate respondsToSelector:@selector(assetsPickerController:didSelectAsset:)]){
            [_assetsPickerController.delegate assetsPickerController:_assetsPickerController didSelectAsset:assetData.asset];
        }
    }else{
        [_selectAssetDatas removeObject:assetData];
        [_selectAssets removeObject:assetData.asset];
        if(_assetsPickerController.delegate && [_assetsPickerController.delegate respondsToSelector:@selector(assetsPickerController:didDeselectAsset:)]){
            [_assetsPickerController.delegate assetsPickerController:_assetsPickerController didDeselectAsset:assetData.asset];
        }
    }
    _toolBar.selectedCount = _selectAssets.count;
    assetsPreviewController.seletedCount = _selectAssets.count;
}

@end
