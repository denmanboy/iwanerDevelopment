//
//  PrefectInfoViewController.h
//  iwanerPro
//
//  Created by MobbyDeveloper on 15/8/2.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrefectInfoViewController : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIButton *userHeaderImgBtn;
@property (strong, nonatomic) IBOutlet UITextField *userNameTextfield;
@property (strong, nonatomic) IBOutlet UIButton *userSexBtn;
@property (strong, nonatomic) IBOutlet UILabel *personalityLable;
@property (strong, nonatomic) IBOutlet UILabel *hobbyLable;
@property (strong, nonatomic) IBOutlet UIButton *mapInfoBtn;
@property (strong, nonatomic) IBOutlet UIButton *mapImgBtn;




@property (nonatomic,strong) IBOutlet UIButton *personTitleBt;
@property (nonatomic,strong) IBOutlet UIButton *personHobby;



@property (nonatomic,strong) NSString *manOrWoman;

@property (strong,nonatomic) UIImage *headImage;

@end
