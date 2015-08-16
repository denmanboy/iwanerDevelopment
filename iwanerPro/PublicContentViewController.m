//
//  PublicContentViewController.m
//  iwanerPro
//
//  Created by liyuanbo on 7/25/15.
//  Copyright (c) 2015 iwaner. All rights reserved.
//

#import "PublicContentViewController.h"


@interface PublicContentViewController ()

@end



@implementation PublicContentViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _selectTimeInputStatus = SelectTimeInputStatusNone;
    self.view.backgroundColor = COLOR_WITH_RGB(235, 235, 241);
    self.view.userInteractionEnabled = YES;
    
    _mapView.showsUserLocation = YES;
    [_mapView setUserTrackingMode: MAUserTrackingModeFollow animated:YES];
    
    NSLog(@"dadadddd=====%@",NSStringFromCGRect(    self.view.frame));
    
    UIView *locationNaViView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    locationNaViView.backgroundColor = COLOR_WITH_RGB(248, 56, 52);
    [self.view addSubview:locationNaViView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame =CGRectMake(0, 15, 60, 40);
    [button setTitle:@"取消" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    
    button.backgroundColor = [UIColor clearColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:COLOR_WITH_RGB(218, 218, 218) forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(gotoBack) forControlEvents:UIControlEventTouchUpInside];
    [locationNaViView addSubview:button];
    
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 80, 15, 160, 40)];
    titleLabel.text = @"发布主题";
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [locationNaViView addSubview:titleLabel];
    
    
    
    _backScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, SCREEN_HEIGHT - 60)];
    _backScrollView.backgroundColor = COLOR_WITH_RGB(235, 235, 241);
    _backScrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 940);
    [self.view addSubview:_backScrollView];
    
    
    _upPhotoesBack = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 112)];
    _upPhotoesBack.backgroundColor = [UIColor whiteColor];
    [_backScrollView addSubview:_upPhotoesBack];
    
    
    UILabel *upPhotoTip = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
    upPhotoTip.backgroundColor = [UIColor clearColor];
    upPhotoTip.text = @"上传封面图片";
    upPhotoTip.textColor = COLOR_WITH_ARGB(90, 95, 109, 1);
    upPhotoTip.font = [UIFont boldSystemFontOfSize:15];
    [_upPhotoesBack addSubview:upPhotoTip];
    
    
    UILabel *upPhotoTip2 = [[UILabel alloc] initWithFrame:CGRectMake(105, 10, 100, 30)];
    upPhotoTip2.backgroundColor = [UIColor clearColor];
    upPhotoTip2.text = @"(必填)";
    upPhotoTip2.textColor = [UIColor grayColor];
    upPhotoTip2.font = [UIFont systemFontOfSize:11];
    [_upPhotoesBack addSubview:upPhotoTip2];
    
    
    UIImage *upPhotoImage = [UIImage getPathImageWithName:@"按钮-添加图片"];
    UIImage *upPhotoImageHigh = [UIImage getPathImageWithName:@"按钮-添加图片-按下"];
    UIButton *upPhotoBt = [UIButton buttonWithType:UIButtonTypeCustom];
    upPhotoBt.frame = CGRectMake(14, 45, upPhotoImage.size.width, upPhotoImage.size.height);
    [upPhotoBt setImage:upPhotoImage forState:UIControlStateNormal];
    [upPhotoBt setImage:upPhotoImageHigh forState:UIControlStateHighlighted];
    [upPhotoBt addTarget:self action:@selector(gotoUphotoes) forControlEvents:UIControlEventTouchUpInside];
    [_upPhotoesBack addSubview:upPhotoBt];
    
    
    
    _itemTimeBack = [[UIView alloc] initWithFrame:CGRectMake(0, 122, SCREEN_WIDTH, 150)];
    _itemTimeBack.backgroundColor = [UIColor whiteColor];
    [self.backScrollView addSubview:_itemTimeBack];
    
    UILabel *itemTip = [[UILabel alloc] initWithFrame:CGRectMake(10, 7, 80, 30)];
    itemTip.backgroundColor = [UIColor clearColor];
    itemTip.text = @"主题标题";
    itemTip.textColor = COLOR_WITH_ARGB(90, 95, 109, 1);
    itemTip.font = [UIFont boldSystemFontOfSize:15];
    [_itemTimeBack addSubview:itemTip];
    
    
    
    _itemTextField = [[UITextField alloc] initWithFrame:CGRectMake(17, 36, SCREEN_WIDTH - 40, 30)];
    _itemTextField.backgroundColor = [UIColor clearColor];
    _itemTextField.placeholder = @"输入一个标题(不少于5个字)";
    UIColor *color = [UIColor grayColor];
    _itemTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"输入一个标题(不少于5个字)" attributes:@{NSForegroundColorAttributeName: color}];
    _itemTextField.returnKeyType = UIReturnKeyDone;
    _itemTextField.delegate = self;
    [_itemTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    _itemTextField.font = [UIFont systemFontOfSize:12];
    [_itemTimeBack addSubview:_itemTextField];
    
    
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fingerTapped:)];
    [self.view addGestureRecognizer:singleTap];
    
    
    
    UILabel *itemTip2 = [[UILabel alloc] initWithFrame:CGRectMake(76, 7, 100, 30)];
    itemTip2.backgroundColor = [UIColor clearColor];
    itemTip2.text = @"(必填)";
    itemTip2.textColor = [UIColor grayColor];
    itemTip2.font = [UIFont systemFontOfSize:11];
    [_itemTimeBack addSubview:itemTip2];
    
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(17, 74.5, SCREEN_WIDTH - 20, 1)];
    line1.backgroundColor = COLOR_WITH_RGB(235, 235, 241);
    [_itemTimeBack addSubview:line1];
    
    
    UILabel *itemtimeTip = [[UILabel alloc] initWithFrame:CGRectMake(10, 83, 80, 30)];
    itemtimeTip.backgroundColor = [UIColor clearColor];
    itemtimeTip.text = @"主题时间";
    itemtimeTip.textColor = COLOR_WITH_ARGB(90, 95, 109, 1);
    itemtimeTip.font = [UIFont boldSystemFontOfSize:15];
    [_itemTimeBack addSubview:itemtimeTip];
    
    
    UILabel *itemtimeTip2 = [[UILabel alloc] initWithFrame:CGRectMake(76, 83, 100, 30)];
    itemtimeTip2.backgroundColor = [UIColor clearColor];
    itemtimeTip2.text = @"(必填)";
    itemtimeTip2.textColor = [UIColor grayColor];
    itemtimeTip2.font = [UIFont systemFontOfSize:11];
    [_itemTimeBack addSubview:itemtimeTip2];
    
    
    
    _startTimeBt = [UILabelButton buttonWithType:UIButtonTypeCustom];
    _startTimeBt.frame = CGRectMake(17, 110, 130, 25);
    [_startTimeBt addLabelInsertButton];

    _startTimeBt.backgroundColor = [UIColor clearColor];
    _startTimeBt.label.font = [UIFont systemFontOfSize:12];
    _startTimeBt.label.textColor = [UIColor grayColor];
    _startTimeBt.label.text = @"开始时间";
    _startTimeBt.label.textAlignment = NSTextAlignmentLeft;
    [_startTimeBt addTarget:self action:@selector(selectStartTime) forControlEvents:UIControlEventTouchUpInside];
    [_itemTimeBack addSubview:_startTimeBt];
    
    
    UIView *lineV = [[UIView alloc] initWithFrame:CGRectMake(150, 112, 2, 16)];
    lineV.backgroundColor = COLOR_WITH_RGB(167, 170, 179);
    [_itemTimeBack addSubview:lineV];
    
    
    _endTimeBt = [UILabelButton buttonWithType:UIButtonTypeCustom];
    _endTimeBt.frame = CGRectMake(170, 110, 130, 25);
    [_endTimeBt addLabelInsertButton];
    _endTimeBt.backgroundColor = [UIColor clearColor];
    _endTimeBt.label.font = [UIFont systemFontOfSize:12];
    _endTimeBt.label.textColor = [UIColor grayColor];
    _endTimeBt.label.text = @"结束时间";
    _endTimeBt.label.textAlignment = NSTextAlignmentLeft;
    [_endTimeBt addTarget:self action:@selector(selectEndTime) forControlEvents:UIControlEventTouchUpInside];
    [_itemTimeBack addSubview:_endTimeBt];
    

    _dateBackView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 236)];
    _dateBackView.backgroundColor = COLOR_WITH_RGB(235, 235, 241);
    _dateBackView.userInteractionEnabled = YES;
    [self.view addSubview:_dateBackView];
    
    
    NSDate *localeDate = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:0];
    [offsetComponents setMonth:0];
    [offsetComponents setDay:5];
    [offsetComponents setHour:20];
    [offsetComponents setMinute:0];
    [offsetComponents setSecond:0];
    
    NSDate *maxDate = [calendar dateByAddingComponents:offsetComponents toDate:localeDate options:NSCalendarWrapComponents];
    
//    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 216)];
    _datePicker.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    _datePicker.locale = locale;
    _datePicker.locale = [NSLocale systemLocale];
    _datePicker.minimumDate = localeDate;
    _datePicker.maximumDate = maxDate;
    [_datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
    [_dateBackView addSubview:_datePicker];
    
    
    UIButton *finishPickDateBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [finishPickDateBt setTitle:@"完成" forState:UIControlStateNormal];
    finishPickDateBt.frame = CGRectMake(SCREEN_WIDTH - 60, 0, 60, 20);
    finishPickDateBt.titleLabel.font = [UIFont systemFontOfSize:14];
    [finishPickDateBt setTitleColor:COLOR_WITH_RGB(248, 56, 52) forState:UIControlStateNormal];
    [finishPickDateBt addTarget:self action:@selector(gotoFinishPickerDate) forControlEvents:UIControlEventTouchUpInside];
    [_datePicker addSubview:finishPickDateBt];
    
    _mapBack = [[UIView alloc] initWithFrame:CGRectMake(0, 282, SCREEN_WIDTH, 364)];
    _mapBack.backgroundColor = [UIColor whiteColor];
    [self.backScrollView addSubview:_mapBack];
    
   
    _addreddTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, 40, SCREEN_WIDTH - 30, 46)];
    _addreddTextView.backgroundColor = [UIColor clearColor];
    _addreddTextView.delegate = self;
    _addreddTextView.scrollEnabled = NO;
    _addreddTextView.font = [UIFont systemFontOfSize:14];
    [_mapBack addSubview:_addreddTextView];
    
    
    UILabel *mapTip = [[UILabel alloc] initWithFrame:CGRectMake(10, 7, 80, 30)];
    mapTip.backgroundColor = [UIColor clearColor];
    mapTip.text = @"主题地址";
    mapTip.textColor = COLOR_WITH_ARGB(90, 95, 109, 1);
    mapTip.font = [UIFont boldSystemFontOfSize:15];
    [_mapBack addSubview:mapTip];
    

    
    
    UILabel *mapTip2 = [[UILabel alloc] initWithFrame:CGRectMake(76, 7, 100, 30)];
    mapTip2.backgroundColor = [UIColor clearColor];
    mapTip2.text = @"(必填)";
    mapTip2.textColor = [UIColor grayColor];
    mapTip2.font = [UIFont systemFontOfSize:11];
    [_mapBack addSubview:mapTip2];
    
    
    
    UILabel *costMoney = [[UILabel alloc] initWithFrame:CGRectMake(10, 270, 40, 30)];
    costMoney.backgroundColor = [UIColor clearColor];
    costMoney.text = @"费用";
    costMoney.textColor = COLOR_WITH_ARGB(90, 95, 109, 1);
    costMoney.font = [UIFont boldSystemFontOfSize:15];
    [_mapBack addSubview:costMoney];
    
    UILabel *labelPerPeople = [[UILabel alloc] initWithFrame:CGRectMake(50, 270, 60, 30)];
    labelPerPeople.text = @"人均￥";
    labelPerPeople.font = [UIFont systemFontOfSize:14];
    labelPerPeople.backgroundColor = [UIColor clearColor];
    labelPerPeople.textColor = [UIColor grayColor];
    [_mapBack addSubview:labelPerPeople];
    
    
//    _perMoneyTextField  
    
    
    
    _perMoneyTextField = [[UITextField alloc] initWithFrame:CGRectMake(110, 270, 100, 30)];
    _perMoneyTextField.backgroundColor = [UIColor clearColor];
    _perMoneyTextField.returnKeyType = UIReturnKeyDone;
    _perMoneyTextField.delegate = self;
    _perMoneyTextField.borderStyle = UITextBorderStyleLine;
    _perMoneyTextField.keyboardType = UIKeyboardTypeNumberPad;
    [_perMoneyTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    _perMoneyTextField.font = [UIFont systemFontOfSize:12];
    [_mapBack addSubview:_perMoneyTextField];
    
    
    
    UILabel *PerPeopleTip = [[UILabel alloc] initWithFrame:CGRectMake(215, 270, 115, 30)];
    PerPeopleTip.text = @"* “0”代表免费";
    PerPeopleTip.font = [UIFont systemFontOfSize:14];
    PerPeopleTip.backgroundColor = [UIColor clearColor];
    PerPeopleTip.textColor = [UIColor grayColor];
    [_mapBack addSubview:PerPeopleTip];
    
   
    
    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(17, 315, SCREEN_WIDTH - 17, 1)];
    line2.backgroundColor = COLOR_WITH_RGB(235, 235, 241);
    [_mapBack addSubview:line2];
    
    
    _detailBack = [[UIView alloc] initWithFrame:CGRectMake(0, 656, SCREEN_WIDTH, 160)];
    _detailBack.backgroundColor = [UIColor whiteColor];
    [self.backScrollView addSubview:_detailBack];
    

//    UILabel *buChong = [[UILabel] i]
    
    UILabel *buChong = [[UILabel alloc] initWithFrame:CGRectMake(10, 7, 280, 30)];
    buChong.backgroundColor = [UIColor clearColor];
    buChong.text = @"在这里补充说些什么...";
    buChong.textColor = [UIColor grayColor];
    buChong.font = [UIFont systemFontOfSize:15];
    [_detailBack addSubview:buChong];
    
    
    
    _competenceBack = [[UIView alloc] initWithFrame:CGRectMake(0, 826, SCREEN_WIDTH, 43)];
    _competenceBack.backgroundColor = [UIColor whiteColor];
    [self.backScrollView addSubview:_competenceBack];
    
    
    UILabel *competenceTip = [[UILabel alloc] initWithFrame:CGRectMake(10, 7, 80, 30)];
    competenceTip.backgroundColor = [UIColor clearColor];
    competenceTip.text = @"权限设置";
    competenceTip.textColor = COLOR_WITH_ARGB(90, 95, 109, 1);
    competenceTip.font = [UIFont boldSystemFontOfSize:15];
    [_competenceBack addSubview:competenceTip];
    
    
    UILabel *competenceTip2 = [[UILabel alloc] initWithFrame:CGRectMake(76, 7, 100, 30)];
    competenceTip2.backgroundColor = [UIColor clearColor];
    competenceTip2.text = @"(公开)";
    competenceTip2.textColor = [UIColor grayColor];
    competenceTip2.font = [UIFont systemFontOfSize:13];
    [_competenceBack addSubview:competenceTip2];
    
    
    _publicBt = [UIButton buttonWithType:UIButtonTypeCustom];
    _publicBt.backgroundColor = COLOR_WITH_RGB(248, 56, 52);
    [_publicBt setTitle:@"发布" forState:UIControlStateNormal];
    [_publicBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _publicBt.frame = CGRectMake(20, 882, SCREEN_WIDTH - 40, 45);
    [self.backScrollView  addSubview:_publicBt];
    
    
    _textNumTip = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 100, 140, 90, 20)];
    _textNumTip.text = @"0/200";
    _textNumTip.textAlignment = NSTextAlignmentRight;
    _textNumTip.textColor = [UIColor grayColor];
    _textNumTip.font = [UIFont boldSystemFontOfSize:14];
    [_detailBack addSubview:_textNumTip];
 
//    _detailBack
//    _mapBack
    // Do any additional setup after loading the view.
}



-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
updatingLocation:(BOOL)updatingLocation
{
    if(updatingLocation) {
        //取出当前位置的坐标
        NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
    }
}


-(void)gotoFinishPickerDate
{
    [UIView animateWithDuration:0.2 animations:^{
            _dateBackView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, _dateBackView.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
}


- (void)dateChanged:(id)sender
{
    UIDatePicker *picker = (UIDatePicker *)sender;
    NSDate *date = picker.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    NSString *dateStr = [formatter stringFromDate:date];
    if (_selectTimeInputStatus == SelectTimeInputStatusStartTime)
    {
        _startTimeBt.label.text = dateStr;
    }else if (_selectTimeInputStatus == SelectTimeInputStatusEndTime)
    {
        _endTimeBt.label.text = dateStr;
    }

    
}


- (void)selectStartTime
{
    _selectTimeInputStatus = SelectTimeInputStatusStartTime;
    [UIView animateWithDuration:0.2 animations:^{
        _dateBackView.frame = CGRectMake(0, SCREEN_HEIGHT - 236, SCREEN_WIDTH, _dateBackView.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)selectEndTime
{
    _selectTimeInputStatus = SelectTimeInputStatusEndTime;
    [UIView animateWithDuration:0.2 animations:^{
        _dateBackView.frame = CGRectMake(0, SCREEN_HEIGHT - 236, SCREEN_WIDTH, _dateBackView.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)textFieldDidChange:(UITextField *)textField
{
    if (textField == self.itemTextField) {
        if (textField.text.length > 20) {
            textField.text = [textField.text substringToIndex:20];
        }
    }
}


//
-(void)fingerTapped:(UITapGestureRecognizer *)gestureRecognizer
{
     [_itemTextField resignFirstResponder];
    [_addreddTextView resignFirstResponder];
    [UIView animateWithDuration:0.2 animations:^{
        _dateBackView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, _dateBackView.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    [MAMapServices sharedServices].apiKey = @"f193d563a78f484b022ac21c84395656";
    
    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, 200)];
    _mapView.delegate = self;
    [_mapBack addSubview:_mapView];
    
    
}

- (void)gotoUphotoes
{
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                    initWithTitle:nil
                                    delegate:self
                                    cancelButtonTitle:@"取消"
                                    destructiveButtonTitle:@"拍照"
                                    otherButtonTitles:@"从相册选取",nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [actionSheet showInView:self.view];
    
    
    
//    CTAssetsPickerController *assetsPickerController = [[CTAssetsPickerController alloc] initWithAssetsType:CTAssetsPickerControllerAssetsTypeAllAsset];
//    assetsPickerController.delegate = self;
//    assetsPickerController.enableMaximumCount = 9;
//    [self presentViewController:assetsPickerController animated:YES completion:NULL];
    
}




- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
        default:
            break;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)gotoBack
{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}



- (void)assetsPickerController:(CTAssetsPickerController *)assetsPickerController didFinishPickingAssets:(NSArray *)assets assetsType:(CTAssetsPickerControllerAssetsType)assetsType
{
    NSLog(@"%@", NSStringFromSelector(@selector(assetsPickerController:didFinishPickingAssets:assetsType:)));
    switch (assetsType) {
        case CTAssetsPickerControllerAssetsTypePhoto:{
            
        }
            break;
        case CTAssetsPickerControllerAssetsTypeVideo:{
            
        }
            break;
        case CTAssetsPickerControllerAssetsTypeAllAsset:{
            
        }
            break;
        default:
            break;
    }
}

- (void)assetsPickerController:(CTAssetsPickerController *)assetsPickerController didDeselectAsset:(ALAsset *)asset{
    NSLog(@"%@", NSStringFromSelector(@selector(assetsPickerController:didDeselectAsset:)));
}

- (void)assetsPickerController:(CTAssetsPickerController *)assetsPickerController didSelectAsset:(ALAsset *)asset{
    NSLog(@"%@", NSStringFromSelector(@selector(assetsPickerController:didSelectAsset:)));
}

- (void)assetsPickerController:(CTAssetsPickerController *)assetsPickerController didSelectCountReachedEnableMaximumCount:(NSUInteger)enableMaximumCount{
    NSLog(@"%@", NSStringFromSelector(@selector(assetsPickerController:didSelectCountReachedEnableMaximumCount:)));
}

- (void)assetsPickerController:(CTAssetsPickerController *)assetsPickerController didSelectCountUnderEnableMinimumCount:(NSUInteger)enableMinimumCount{
    NSLog(@"%@", NSStringFromSelector(@selector(assetsPickerController:didSelectCountUnderEnableMinimumCount:)));
}

- (void)assetsPickerControllerDidCancel:(CTAssetsPickerController *)assetsPickerController{
    NSLog(@"%@", NSStringFromSelector(@selector(assetsPickerControllerDidCancel:)));
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
