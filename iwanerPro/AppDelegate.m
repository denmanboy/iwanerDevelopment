//
//  AppDelegate.m
//  iwanerPro
//
//  Created by liyuanbo on 7/21/15.
//  Copyright (c) 2015 iwaner. All rights reserved.
//

#import "AppDelegate.h"
#import "UMSocial.h"

@interface AppDelegate ()<WXApiDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    //    [NSThread sleepForTimeInterval:1];
    
    
    [UMSocialData setAppKey:@"507fcab25270157b37000010"];
    
    [UMSocialQQHandler setQQWithAppId:@"100424468" appKey:@"c7394704798a158208a74ab60104f0ba" url:@"http://www.umeng.com/social"];
    
    [UMSocialSinaHandler openSSOWithRedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    
    [UMSocialWechatHandler setWXAppId:@"wxd930ea5d5a258f4f" appSecret:@"db426a9829e4b49a0dcac7b4162da6b6" url:@"http://www.umeng.com/social"];
    
    [WXApi registerApp:@"wxd930ea5d5a258f4f" withDescription:@"aiwaner"];

    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //    NSLog(@"dadadadad======%@",NSStringFromCGRect(self.window.frame));
    self.window.backgroundColor = [UIColor whiteColor];
    
    _loginViewController = [[LoginViewController alloc]init];
    _loginViewController.delegate = self;
    _loginNav = [[BSNavgationController alloc]initWithRootViewController:_loginViewController];
    self.window.rootViewController = _loginNav;

    [self chooseIphoneSizeType];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)loginAuthenticationSuccess {
    
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    
    tabBarController.delegate = self;
    _iwanViewController = [[IwanViewController alloc] init];
    _iwanViewController.tabBarItem.title = @"爱玩";
    _iwanViewController.tabBarItem.image = [UIImage imageNamed:@"导航-爱玩-灰"];
    _iwanViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"导航-爱玩-红"];
    _iwanViewController.tabBarItem.image = [_iwanViewController.tabBarItem.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _iwanViewController.tabBarItem.selectedImage = [_iwanViewController.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    _iwanNavi = [[BSNavgationController alloc] initWithRootViewController:_iwanViewController];
    
    
    _friendsViewController = [[FriendsViewController alloc] init];
    _friendsViewController.tabBarItem.title = @"朋友圈";
    _friendsViewController.tabBarItem.image = [UIImage imageNamed:@"导航-玩友圈-灰"];
    _friendsViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"导航-玩友圈-红"];
    _friendsViewController.tabBarItem.image = [_friendsViewController.tabBarItem.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _friendsViewController.tabBarItem.selectedImage = [_friendsViewController.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _friendsNavi = [[BSNavgationController alloc] initWithRootViewController:_friendsViewController];
    
    
    _publicViewController = [[PublicViewController alloc] init];
    //    _publicViewController.tabBarItem.image = [UIImage imageNamed:@"导航-发布-灰"];
    _publicViewController.tabBarItem.title = nil;
    
    //    _publicViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"导航-发布-黑"];
    //    _publicViewController.tabBarItem.image = [_publicViewController.tabBarItem.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    _publicViewController.tabBarItem.selectedImage = [_publicViewController.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    _publicViewController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0,-6, 0);    //调整位置
    _publicNavi = [[BSNavgationController alloc]initWithRootViewController:_publicViewController];
    _publicNavi.tabBarItem.enabled = NO;
    
    
    UIButton *publicBt = [UIButton buttonWithType:UIButtonTypeCustom];
    publicBt.frame = CGRectMake(SCREEN_WIDTH/2 - SCREEN_WIDTH/10, 0, SCREEN_WIDTH/5, 50);
    [publicBt setImage:[UIImage imageNamed:@"导航-发布-灰"] forState:UIControlStateNormal];
    [publicBt setImage:[UIImage imageNamed:@"导航-发布-黑"] forState:UIControlStateHighlighted];
    [publicBt addTarget:self action:@selector(gotoPublic) forControlEvents:UIControlEventTouchUpInside];
    publicBt.backgroundColor = [UIColor clearColor];
    [tabBarController.tabBar addSubview:publicBt];
    
    
    _findViewController = [[FindViewController alloc] init];
    _findViewController.tabBarItem.title = @"看见";
    _findViewController.tabBarItem.image = [UIImage imageNamed:@"导航-看见-灰"];
    _findViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"导航-看见-红"];
    _findViewController.tabBarItem.image = [_findViewController.tabBarItem.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _findViewController.tabBarItem.selectedImage = [_findViewController.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _findNavi = [[BSNavgationController alloc]initWithRootViewController:_findViewController];
    
    
    _meViewController = [[MeViewController alloc] init];
    _meViewController.tabBarItem.title = @"我";
    _meViewController.tabBarItem.image = [UIImage imageNamed:@"导航-我-灰"];
    _meViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"导航-我-红"];
//    _meViewController.tabBarItem.badgeValue = @"1";
    _meViewController.tabBarItem.image = [_meViewController.tabBarItem.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _meViewController.tabBarItem.selectedImage = [_meViewController.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _meNavi = [[BSNavgationController alloc]initWithRootViewController:_meViewController];
    _meNavi.navigationBarHidden = YES;
    [_meNavi.navigationBar setTranslucent:NO];
    
    _meNavi.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:20]};
    _meNavi.navigationBar.barTintColor = COLOR_WITH_RGB(248, 56, 52);
    [_meNavi.navigationBar setTintColor:[UIColor whiteColor]];
    
    
    
    
    
    //自定义UITabBar的字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],
                                                       NSForegroundColorAttributeName, nil]forState:UIControlStateSelected];
    
    tabBarController.viewControllers = @[_iwanNavi,_friendsNavi,_publicNavi,_findNavi,_meNavi];
    
    
    
    self.window.rootViewController = tabBarController;
    
    
}




- (void)chooseIphoneSizeType
{
    IWUserInfo *info = [IWUserInfo sharedIWUserInfo];
    if (SCREEN_HEIGHT < 500) {
        info.iphoneSizeType = IPHONE_SIZE_TYPE_4s;
    }else if (SCREEN_HEIGHT > 500 && SCREEN_HEIGHT < 600)
    {
        info.iphoneSizeType = IPHONE_SIZE_TYPE_5s;
    }else if (SCREEN_HEIGHT > 600 && SCREEN_HEIGHT < 700)
    {
        info.iphoneSizeType = IPHONE_SIZE_TYPE_6;
    }else if (SCREEN_HEIGHT >700)
    {
        info.iphoneSizeType = IPHONE_SIZE_TYPE_plus;
    }
}



- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    
    
    return YES;
}


- (void)gotoPublic
{
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    _meNavi.navigationItem.backBarButtonItem = barButtonItem;
    [_publicViewController showPublicContentController];
    
    
}





- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    return  [TencentOAuth HandleOpenURL:url]||[WXApi handleOpenURL:url delegate:self]||[UMSocialSnsService handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [TencentOAuth HandleOpenURL:url]||[WXApi handleOpenURL:url delegate:self]||[UMSocialSnsService handleOpenURL:url];
}

@end
