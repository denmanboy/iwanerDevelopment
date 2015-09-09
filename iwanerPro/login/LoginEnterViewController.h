//
//  LoginEnterViewController.h
//  iwanerPro
//
//  Created by MobbyDeveloper on 15/8/1.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginEnterViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *userNameTextFiled;
@property (strong, nonatomic) IBOutlet UITextField *userPwdTextfield;

@end
