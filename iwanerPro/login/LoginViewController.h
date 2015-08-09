//
//  LoginViewController.h
//  iwanerPro
//
//  Created by MobbyDeveloper on 15/8/1.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginEnterViewController.h"
#import "RegistViewController.h"

@protocol LoginViewControllerDelegate;

@interface LoginViewController : UIViewController

@property(nonatomic,strong)LoginEnterViewController  *loginEnterVC;
@property(nonatomic,strong)RegistViewController  *registVC;
@property(nonatomic,assign)id <LoginViewControllerDelegate>  delegate;


@end

@protocol LoginViewControllerDelegate <NSObject>

- (void)loginauthenticationSuccess;

@end