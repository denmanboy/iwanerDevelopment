//
//  CTAssetsPickerController.m
//  CTAssetsPicker
//
//  Created by wshaolin on 15/7/9.
//  Copyright (c) 2015年 神州锐达（北京）科技有限公司. All rights reserved.
//

#import "CTAssetsPickerController.h"
#import "CTAssetsGroupViewController.h"

@implementation CTAssetsPickerController

@dynamic delegate;

- (instancetype)init{
    if(self = [super initWithRootViewController:[[CTAssetsGroupViewController alloc] init]]){
        [self _init];
    }
    return self;
}

- (instancetype)initWithAssetsType:(CTAssetsPickerControllerAssetsType)assetsType{
    if(self = [super initWithRootViewController:[[CTAssetsGroupViewController alloc] init]]){
        [self _init];
        _assetsType = assetsType;
        switch (assetsType) {
            case CTAssetsPickerControllerAssetsTypePhoto:{
                _assetsFilter = [ALAssetsFilter allPhotos];
            }
                break;
            case CTAssetsPickerControllerAssetsTypeVideo:{
                _assetsFilter = [ALAssetsFilter allVideos];
            }
                break;
            case CTAssetsPickerControllerAssetsTypeAllAsset:{
                _assetsFilter = [ALAssetsFilter allAssets];
            }
                break;
            default:
                break;
        }
    }
    return self;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    if(self = [super initWithRootViewController:[[CTAssetsGroupViewController alloc] init]]){
        [self _init];
    }
    return self;
}

- (void)_init{
    _assetsType = CTAssetsPickerControllerAssetsTypePhoto;
    _assetsFilter = [ALAssetsFilter allPhotos];
    _finishDismissViewController = YES;
    
    self.navigationBar.hidden = NO;
    [UIApplication sharedApplication].statusBarHidden = NO;
}

- (NSArray *)selectedAssets{
    CTAssetsGroupViewController *assetsGroupViewController = (CTAssetsGroupViewController *)self.topViewController;
    return assetsGroupViewController.selectedAssets;
}

- (void)deselectAssetAtIndex:(NSUInteger)index{
    CTAssetsGroupViewController *assetsGroupViewController = (CTAssetsGroupViewController *)self.topViewController;
    [assetsGroupViewController deselectAssetAtIndex:index];
}

- (void)setToolbarItemBackgroundColor:(UIColor *)toolbarItemBackgroundColor{
    CTAssetsGroupViewController *assetsGroupViewController = (CTAssetsGroupViewController *)self.topViewController;
    [assetsGroupViewController setToolbarItemBackgroundColor:toolbarItemBackgroundColor];
}

- (void)setToolbarItemFontColor:(UIColor *)toolbarItemFontColor{
    CTAssetsGroupViewController *assetsGroupViewController = (CTAssetsGroupViewController *)self.topViewController;
    [assetsGroupViewController setToolbarItemFontColor:toolbarItemFontColor];
}

@end
