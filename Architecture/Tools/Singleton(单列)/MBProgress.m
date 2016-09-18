//
//  MBProgress.m
//  YouXinPay
//
//  Created by ZM on 16/7/5.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "MBProgress.h"

@implementation MBProgress

//实例化
Singleton_Instance_method_Impl(MBProgress)

// 同上
+ (MBProgress *)singletonShare
{
    static MBProgress *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

#pragma mark ------------------"  MBProgressHUD Delegate  "------------------
#pragma
- (void)hudShowLoading:(NSString *)message
{
    if (!_hudView) {
        UIWindow * windows = [[UIApplication sharedApplication] keyWindow];
        MBProgressHUD *hud = [[MBProgressHUD alloc] initWithWindow:windows];
        hud.delegate       = self;
        [windows addSubview:hud];
        _hudView = hud;
    }
    _hudView.mode           = MBProgressHUDModeIndeterminate;
    _hudView.animationType  = MBProgressHUDAnimationFade;
    _hudView.labelText = message;
    [_hudView show:YES];
    [_hudView hide:YES afterDelay:30.0f];
    
}

- (void)hudShowLoading:(NSString *)message afterDelay:(NSTimeInterval)delay
{
    if (!_hudView) {
        UIWindow * windows = [[UIApplication sharedApplication] keyWindow];
        MBProgressHUD *hud = [[MBProgressHUD alloc] initWithWindow:windows];
        hud.delegate       = self;
        [windows addSubview:hud];
        _hudView = hud;
    }
    _hudView.mode           = MBProgressHUDModeIndeterminate;
    _hudView.animationType  = MBProgressHUDAnimationFade;
    _hudView.labelText = message;
    [_hudView show:YES];
    [_hudView hide:YES afterDelay:delay];
    
}

// 普通：菊花旋转
- (void)hudShowLoadingAfterDelay:(NSTimeInterval)delay
{
    if (!_hudView) {
        UIWindow * window = [[UIApplication sharedApplication] keyWindow];
        MBProgressHUD *hud = [[MBProgressHUD alloc] initWithWindow:window];
        [window addSubview:hud];
        _hudView = hud;
    }
    _hudView.customView     = [[UIView alloc] initWithFrame:CGRectZero];
    _hudView.mode           = MBProgressHUDModeIndeterminate;
    _hudView.animationType  = MBProgressHUDAnimationFade;
    [_hudView show:YES];
    [_hudView hide:YES afterDelay:delay];
}


//- (void)NoResponse {
//    [[MBProgress singletonShare] hudShowMessage:@"网络无响应" afterDelay:2.0f];
//}

// 显示信息、图片
- (void)hudShowMessage:(NSString *)message imageName:(NSString *)imageName afterDelay:(NSTimeInterval)delay
{
    if (!_hudView) {
        UIWindow * window = [[UIApplication sharedApplication] keyWindow];
        MBProgressHUD *hud = [[MBProgressHUD alloc] initWithWindow:window];
        [window addSubview:hud];
        _hudView = hud;
    }
    _hudView.customView= [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    _hudView.mode           = MBProgressHUDModeCustomView;
    _hudView.labelText      = message;
    [_hudView show:YES];
    [_hudView hide:YES afterDelay:delay];
}

// 普通：提示信息
- (void)hudShowMessage:(NSString *)message afterDelay:(NSTimeInterval)delay
{
    if (!_hudView) {
        UIWindow * window = [[UIApplication sharedApplication] keyWindow];
        MBProgressHUD *hud = [[MBProgressHUD alloc] initWithWindow:window];
        [window addSubview:hud];
        _hudView = hud;
    }
    _hudView.customView     = [[UIView alloc] initWithFrame:CGRectZero];
    _hudView.mode           = MBProgressHUDModeCustomView;
    _hudView.delegate       = self;
    _hudView.labelText      = message;
    [_hudView show:YES];
    [_hudView hide:YES afterDelay:delay];
}

// 成功时：提示信息
- (void)hudShowSucceed:(NSString *)message
{
    if (!_hudView) {
        UIWindow * window = [[UIApplication sharedApplication] keyWindow];
        MBProgressHUD *hud = [[MBProgressHUD alloc] initWithWindow:window];
        [window addSubview:hud];
        _hudView = hud;
    }
    _hudView.customView= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    _hudView.mode           = MBProgressHUDModeCustomView;
    _hudView.labelText      = message;
    [_hudView show:YES];
    [_hudView hide:YES afterDelay:1.5f];
}
// 错误时：提示信息
- (void)hudShowError:(NSString *)message
{
    if (!_hudView) {
        UIWindow * window = [[UIApplication sharedApplication] keyWindow];
        MBProgressHUD *hud = [[MBProgressHUD alloc] initWithWindow:window];
        [window addSubview:hud];
        _hudView = hud;
    }
    _hudView.customView     = [[UIView alloc] initWithFrame:CGRectZero];
    _hudView.mode           = MBProgressHUDModeCustomView;
    _hudView.delegate       = self;
    _hudView.labelText      = message;
    [_hudView show:YES];
    [_hudView hide:YES afterDelay:2.0f];
}



//自定义停止时间
- (void)hudHidden:(NSTimeInterval)delay{	[_hudView hide:YES afterDelay:delay];	}
// 0.5秒后停止
- (void)hudHidden{							[_hudView hide:YES afterDelay:0.5f];	}
// 立即停止
- (void)hudHiddenImmediately{				[_hudView hide:YES afterDelay:0.0f];	}
// 睡眠2秒
- (void)hudWasShow{
    sleep(2);
}
// 重父视图中移除
- (void)hudRemove {
    [_hudView hide:YES afterDelay:0.0f];
    [_hudView removeFromSuperview];
}
// 移除
- (void)removeProgressHud
{
    [_hudView hide:YES afterDelay:0.0f];
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    
    for (UIView *subViews in window.subviews) {// NSLog(@"subviews = %@",self.window.subviews);
        
        if ([subViews isKindOfClass:[MBProgressHUD class]]) {
            MBProgressHUD *progressHUD = (MBProgressHUD*)subViews;
            [progressHUD removeFromSuperview];
            progressHUD = nil;
        }
    }
}

@end
