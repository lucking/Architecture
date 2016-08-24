//
//  UIImageView+ZMAdd.m
//  ZMArchitecture
//
//  Created by tangdi on 16/5/11.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "UIImageView+ZMAdd.h"

#import "UIImage+ZMAdd.h"
#import "UIImageView+WebCache.h"
#import "YYWebImage.h"

@implementation UIImageView (ZMAdd)
@dynamic imgName;

- (void)testUse {

	self.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1.0];
	self.layer.cornerRadius = 5;
	self.layer.masksToBounds= YES;
	self.clipsToBounds = YES;
	self.contentMode   = UIViewContentModeScaleAspectFill; // 内容扩展填充固定方面。部分内容可能剪。
	self.contentScaleFactor = 100;
}



- (void)animationImageViewDuration:(NSTimeInterval)duration animationType:(CATransitionAnimationType)animationType {

	CATransition *tranAn = [CATransition animation];
	tranAn.duration = duration;
	if (animationType == Cube_An ) {					tranAn.type = @"cube";
	}
	else if (animationType == SuckEffect_An)			tranAn.type = @"suckEffect";
	else if (animationType == RippleEffect_An)			tranAn.type = @"suckEffect"; // 水波抖动
	else if (animationType == PageCurl_An)				tranAn.type = @"pageCurl";
	else if (animationType == PageUnCurl_An)			tranAn.type = @"pageUnCurl";
	else if (animationType == OglFlip_An)				tranAn.type = @"oglFlip";
	else if (animationType == CameraIrisHollowOpen_An)	tranAn.type = @"cameraIrisHollowOpen";
	else if (animationType == CameraIrisHollowClose_An)	tranAn.type = @"cameraIrisHollowClose";

	// 以下API效果请慎用
	else if (animationType == SpewEffect_An)			tranAn.type = @"spewEffect";
	else if (animationType == GenieEffect_An)			tranAn.type = @"genieEffect";
	else if (animationType == UnGenieEffect_An)			tranAn.type = @"unGenieEffect";
	else if (animationType == Twist_An)					tranAn.type = @"twist";
	else if (animationType == Tubey_An)					tranAn.type = @"tubey";
	else if (animationType == Swirl_An)					tranAn.type = @"swirl";
	else if (animationType == CharminUltra_An)			tranAn.type = @"charminUltra";
	else if (animationType == ZoomyIn_An)				tranAn.type = @"zoomyIn";
	else if (animationType == ZoomyOut_An)				tranAn.type = @"zoomyOut";
	else if (animationType == OglApplicationSuspend_An)	tranAn.type = @"oglApplicationSuspend";

	[self.layer addAnimation:tranAn forKey:nil];
}


- (void)setImgName:(NSString *)imgName {

	//NSLog(@"---> imgName = %@",imgName);
	//[self sd_setImageWithURL:[NSURL URLWithString:imgName] placeholderImage:[UIImage imageNamed:@"placeholderImg"]];
	// self.image = [UIImage imageNamed:imageName];

	if ([imgName hasPrefix:@"http"]) {

		[self yy_setImageWithURL:[NSURL URLWithString:imgName]
					 placeholder:[UIImage imageNamed:@"placeholderImg"]
						 options:YYWebImageOptionProgressiveBlur | YYWebImageOptionShowNetworkActivity |YYWebImageOptionSetImageWithFadeAnimation progress:^(NSInteger receivedSize, NSInteger expectedSize) {

						 }transform:nil completion:^(UIImage *image, NSURL *url,YYWebImageFromType from, YYWebImageStage stage, NSError *error) {

						 }];
	}else{
		self.image = [UIImage compressPngImageName:imgName];
	}
}


@end
