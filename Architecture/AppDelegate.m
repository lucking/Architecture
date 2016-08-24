//
//  AppDelegate.m
//  Architecture
//
//  Created by ZM on 16/6/11.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "AppDelegate.h"

#import "SDWebImageManager.h"
#import "CatchCrash.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

static AppDelegate *_singleInstance;

+(AppDelegate *)GetInstance{
    return _singleInstance;
}
+ (AppDelegate*)sharedAppDelegate
{
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //UIWindow *rootWindow =  [AppDelegate GetInstance].window;
    
    [self BaseSetting];
    
    //[UserDefaults removeObjectKey:@"firstLaunch"];
    //判断用户是否第一次进入这个页面
    if ([UserDefaults getBoolStorageWithKey:@"firstLaunch"]) {
        // 主题
        _baseTabBarVC = [[ZMMainTabBarController alloc] init];
        self.window.rootViewController = _baseTabBarVC;
        
    }else{
        NSSLog(@"第一次进入_开始：引导页");
        [UserDefaults storageBool:YES Key:@"firstLaunch"];                      //第一次进入：保存进入标识
        GuidepageViewController *GuideVC= [[GuidepageViewController alloc]init];
        self.window.rootViewController = GuideVC;
    }
    
    return YES;
}


- (void)BaseSetting {
    // 沙盒文件 路径
    NSLog(@"---> HomeDirectoryPath = %@ \n \n ",HomeDirectoryPath);
    // 判断手机型号：IPHONE尺寸
    [Common ISIPHONEXX];
    
    //1.改变启动画面停留的时间
    [NSThread sleepForTimeInterval:1.0];
    
    //2.AppDelegate
    _singleInstance = self;
    
    //3.监控网络状态
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    //4.锁屏通知：锁屏退出 //锁屏：command＋L
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, screenLockStateChanged, NotificationLock, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, screenLockStateChanged, NotificationChange, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
    
    //5.注册异常处理函数
    [CatchCrash setExceptionHandler];
    
    
//    NSString* ssssa = @"魏一平";
//    [NSString isChineseString:ssssa];
//    NSString* str1 = @"魏 一 平ads2  ,.,[sadf";
//    
//    NSSLog(@"---> trim = %@",[str1 trim]);
//    NSSLog(@"---> isAllLetter = %d",[@"asdfia  bjJASDFAJN" isAllLetter]);
//    
//    NSSLog(@"---> isAllNum = %d",[@"112344,3" isAllNum]);
//    NSSLog(@"---> isContainNum = %d",[str1 isContainNum]);
//    
//    NSSLog(@"---> isContainSpecialString = %d",[str1 isContainSpecialString]);
//    NSSLog(@"---> isIllegalString = %d \n \n ",[str1 isIllegalString]);
    
    
}

#pragma mark 进入主页
- (void)gotoMainPage{
    NSSLog(@"进入主页_gotoAccount");
    // 主题
    self.baseTabBarVC = [[ZMMainTabBarController alloc] init];
    self.window.rootViewController = self.baseTabBarVC;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"---> 2.挂起：即将失去活动状态的时候调用(失去焦点, 不可交互)：挂起 (Resign：放弃) ");

}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"---> 3.系统进入后台 ");
    
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"---> 4.进入前台 \n ");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"---> 5.重新启动 \n ");
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLogline(@"---> 6.程序将终止 \n "); //当应用程序将终止。如果适当的保存数据。看到也applicationDidEnterBackground:
    
}

/**
 *  当收到Received memory warning.会调用此方法
 *
 *  一般缓存的内容比较多了就需要进行：清空缓存、清除SDWebImage的内存和硬盘时，可以同时清除session 和 cookie的缓存。
 */
-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    
    SDWebImageManager *SDImgManager = [SDWebImageManager sharedManager];
    //取消下载
    [SDImgManager cancelAll];
    //清空缓存
    //[SDImgManager.imageCache clearMemory];
    //清理缓存：同上
    [[SDImageCache sharedImageCache] clearMemory];
    // 清理硬盘
    [[SDImageCache sharedImageCache] clearDisk];
    
    // 清理webview 缓存
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in [storage cookies]) {
        [storage deleteCookie:cookie];
    }
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    [config.URLCache removeAllCachedResponses];
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

#pragma mark -- 锁屏退出：锁屏进入后台
static void screenLockStateChanged(CFNotificationCenterRef center,void* observer,CFStringRef name,const void* object,CFDictionaryRef userInfo)
{
    NSString* lockstate = (__bridge NSString*)name;
    if ([lockstate isEqualToString:(__bridge NSString*)NotificationLock]) {
        NSSLog(@"locked.");
    } else {
        NSSLog(@"lock state changed.");
    }
}


@end
