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
#import "CAHeader.h"
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
	if (animationType == Cube_An ) {					tranAn.type = Cube;
	}
	else if (animationType == SuckEffect_An)			tranAn.type = SuckEffect;
	else if (animationType == RippleEffect_An)			tranAn.type = RippleEffect; // 水波抖动
	else if (animationType == PageCurl_An)				tranAn.type = PageCurl;
	else if (animationType == PageUnCurl_An)			tranAn.type = PageUnCurl;
	else if (animationType == OglFlip_An)				tranAn.type = OglFlip;
	else if (animationType == CameraIrisHollowOpen_An)	tranAn.type = CameraIrisHollowOpen;
	else if (animationType == CameraIrisHollowClose_An)	tranAn.type = CameraIrisHollowClose;

	// 以下API效果请慎用
	else if (animationType == SpewEffect_An)			tranAn.type = SpewEffect;
	else if (animationType == GenieEffect_An)			tranAn.type = GenieEffect;
	else if (animationType == UnGenieEffect_An)			tranAn.type = UnGenieEffect;
	else if (animationType == Twist_An)					tranAn.type = Twist;
	else if (animationType == Tubey_An)					tranAn.type = Tubey;
	else if (animationType == Swirl_An)					tranAn.type = Swirl;
	else if (animationType == CharminUltra_An)			tranAn.type = CharminUltra;
	else if (animationType == ZoomyIn_An)				tranAn.type = ZoomyIn;
	else if (animationType == ZoomyOut_An)				tranAn.type = ZoomyOut;
	else if (animationType == OglApplicationSuspend_An)	tranAn.type = OglApplicationSuspend;

	[self.layer addAnimation:tranAn forKey:nil];
}


- (void)setImgName:(NSString *)imgName {

	//NNSLog(@"---> imgName = %@",imgName);
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
