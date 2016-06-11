//
//  GesturePwdViewController.m
//  ZMGesturePwd
//
//  Created by tangdi on 15/11/30.
//  Copyright © 2015年 TD. All rights reserved.
//

#import "GesturePwdViewController.h"
#import "ZMMainTabBarController.h"
#import "AppDelegate.h"

@interface GesturePwdViewController ()
{
	UIImageView* BgImgView;
}
@end

@implementation GesturePwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];


	BgImgView = [[UIImageView alloc]initWithFrame:self.view.bounds];
	BgImgView.image = [UIImage imageNamed:@"gestureBg"];
	[self.view addSubview:BgImgView];

 /************************* start **********************************/


	//2015.12.1 注释：不让小图轨迹消失 (全局搜索这几个字)


	AliPayViews *alipay = [[AliPayViews alloc] initWithFrame:self.view.bounds];

	alipay.string = self.string;

	if ([self.string isEqualToString:@"验证密码"]) {
		alipay.gestureModel = ValidatePwdModel;

	} else if ([self.string isEqualToString:@"修改密码"]) {
		alipay.gestureModel = AlertPwdModel;

	} else if ([self.string isEqualToString:@"重置密码"]) {
		alipay.gestureModel = SetPwdModel;

	} else if ([self.string isEqualToString:@"忘记密码"]) {
		alipay.gestureModel = SetPwdModel;

//		alipay.gestureModel = NoneModel;
	}
	
	alipay.block = ^(NSString *pswString) {
		NSLog(@"设置密码成功-----你的密码为 = 【%@】\n\n", pswString);

		if ([UserDefaults getBoolStorageWithKey:@"屏幕解锁"]) {

			[UserDefaults removeObjectKey:@"屏幕解锁"];
			// 主题
			ZMMainTabBarController *baseTabBarVC = [[ZMMainTabBarController alloc] init];
			[[UIApplication sharedApplication] keyWindow].rootViewController = baseTabBarVC;
		}else{
			[self dismissViewControllerAnimated:YES completion:nil];
		}

	};

	[self.view addSubview:alipay];


	/************************* end **********************************/

	UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	backBtn.frame = CGRectMake(0, 0, 64, 64);
	[backBtn setTitle:@"返回" forState:UIControlStateNormal];
	[backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:backBtn];


}

- (void)back  {
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end




