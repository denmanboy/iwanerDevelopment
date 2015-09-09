//
//  PublicContentViewController.h
//  iwanerPro
//
//  Created by liyuanbo on 7/25/15.
//  Copyright (c) 2015 iwaner. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CTAssetsPickerController.h"

#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchAPI.h>
#import "ReGeocodeAnnotation.h"
#import "MANaviAnnotationView.h"



typedef NS_ENUM(NSInteger, SelectTimeInputStatus) {
    SelectTimeInputStatusNone = 1,
    SelectTimeInputStatusStartTime,
    SelectTimeInputStatusEndTime,
};

@interface PublicContentViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate,MAMapViewDelegate,CTAssetsPickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate,UIGestureRecognizerDelegate,AMapSearchDelegate,UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *backScrollView;
@property (nonatomic,strong) UIView *upPhotoesBack;
@property (nonatomic,strong) UIView *itemTimeBack;
@property (nonatomic,strong) UIView *mapBack;
@property (nonatomic,strong) UITextView *detailBackTextView;
@property (nonatomic,strong) UIView *competenceBack;
@property (nonatomic,strong) IWButton *publicBt;

@property (nonatomic,strong) UIButton *showImageView;
@property (nonatomic,strong) UIButton *upPhotoBt;

@property (nonatomic,strong) UITextField *itemTextField,*perMoneyTextField;
@property (nonatomic,strong) UITextView *addreddTextView;

@property (nonatomic,strong) UILabelButton *startTimeBt,*endTimeBt;
@property (nonatomic,strong) UIDatePicker *datePicker;
@property (nonatomic,strong) UIView *dateBackView;

@property (nonatomic) SelectTimeInputStatus selectTimeInputStatus;
@property (nonatomic,strong) UILabel *textNumTip;

@property (nonatomic,strong) MAMapView *mapView;
@property (nonatomic, strong) AMapSearchAPI *search;
@end
