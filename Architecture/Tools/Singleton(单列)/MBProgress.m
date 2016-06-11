//
//  MBProgress.m
//  TDiPad
//
//  Created by tangdi on 16/4/7.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "MBProgress.h"

@implementation MBProgress
//实例化
Singleton_Instance_method_Impl(MBProgress)

// 同上
//+ (MBProgress *)singleton
//{
//	static MBProgress *instance = nil;
//	static dispatch_once_t onceToken;
//	dispatch_once(&onceToken, ^{
//		instance = [[self alloc] init];
//	});
//	return instance;
//}



#pragma mark ------------------"  MBProgressHUD Delegate  "------------------
#pragma
- (void)hudShowLoading:(NSString *)message
{
	UIWindow * windows = [[UIApplication sharedApplication] keyWindow];
	
	for (UIView *view in windows.subviews) {

		if (![view isKindOfClass:[MBProgressHUD class]]) {
			// NSLog(@"MBProgressHUD 不存在,就创建");

			MBProgressHUD *hud = [[MBProgressHUD alloc] initWithWindow:windows];
			hud.delegate       = self;
			hud.labelText      = message;
			[windows addSubview:hud];
			[hud show:YES];
			//[hud setTransformForCurrentOrientation:YES];

			//------" 菊花转动 30s 后消失 "-------
			[hud hide:YES afterDelay:30.0f];
			_hudView = hud;

		}else{
			//NSLog(@"MBProgressHUD 已存在");
		}
	}
}
// 成功时：提示信息
- (void)hudShowSucceed:(NSString *)message
{
	[_hudView hide:NO];
	UIWindow * window = [[UIApplication sharedApplication] keyWindow];

	MBProgressHUD *hud = [[MBProgressHUD alloc] initWithWindow:window];
	[window addSubview:hud];
	hud.customView= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
	hud.mode           = MBProgressHUDModeCustomView;
	hud.delegate       = self;
	hud.labelText      = message;

	[hud show:YES];
	[hud hide:YES afterDelay:1.5f];
	_hudView = hud;
}
// 错误时：提示信息
- (void)hudShowError:(NSString *)message
{
	[_hudView hide:NO];
	UIWindow * window = [[UIApplication sharedApplication] keyWindow];

	MBProgressHUD *hud = [[MBProgressHUD alloc] initWithWindow:window];
	[window addSubview:hud];
	hud.customView     = [[UIView alloc] initWithFrame:CGRectZero];
	hud.mode           = MBProgressHUDModeCustomView;
	hud.delegate       = self;
	hud.labelText      = message;

	[hud show:YES];
	[hud hide:YES afterDelay:1.0f];
	_hudView = hud;
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
#pragma mark 重父视图中移除
- (void)hudRemove{
	[_hudView removeFromSuperview];
}
//移除
- (void)removeProgressHud
{
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
