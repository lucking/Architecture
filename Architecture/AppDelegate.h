//
//  AppDelegate.h
//  Architecture
//
//  Created by ZM on 16/6/11.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZMMainTabBarController.h"
#import "ZMNavController.h"

#import "Common.h"
#import "GuidepageViewController.h"
#import <notify.h>
#define NotificationLock	CFSTR("com.apple.springboard.lockcomplete")
#define NotificationChange	CFSTR("com.apple.springboard.lockstate")
#define NotificationPwdUI	CFSTR("com.apple.springboard.hasBlankedScreen")

#import "GesturePwdViewController.h"

#import "NSArray+Categroy.h"
#import "NSString+ZMAdd.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>
{
    NSArray *sortArray;
    
}
@property (strong, nonatomic) UIWindow *window;
@property (retain, nonatomic) ZMMainTabBarController* baseTabBarVC;//主控制器


+ (AppDelegate *)GetInstance;
+ (AppDelegate*)sharedAppDelegate;

- (void)gotoMainPage;



@end

