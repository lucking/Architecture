//
//  UIImageView+ZMAdd.h
//  ZMArchitecture
//
//  Created by tangdi on 16/5/11.
//  Copyright © 2016年 TD. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  图片动画类型
 */
typedef NS_ENUM(NSInteger,CATransitionAnimationType) {
	Cube_An						=1,	//方块
	SuckEffect_An				=2, //三角
	RippleEffect_An				=3, //水波抖动
	PageCurl_An					=4, //上翻页
	PageUnCurl_An				=5, //下翻页
	OglFlip_An					=6, //上下翻转
	CameraIrisHollowOpen_An		=7, //镜头快门开
	CameraIrisHollowClose_An	=8, //镜头快门关

	// 以下API效果请慎用
	SpewEffect_An				=9,  // 新版面在屏幕下方中间位置被释放出来覆盖旧版面
	GenieEffect_An				=10, // 旧版面在屏幕左下方或右下方被吸走, 显示出下面的新版面
	UnGenieEffect_An			=11, // 新版面在屏幕左下方或右下方被释放出来覆盖旧版面
	Twist_An					=12, // 版面以水平方向像龙卷风式转出来
	Tubey_An					=13, // 版面垂直附有弹性的转出来
	Swirl_An					=14, // 旧版面360度旋转并淡出, 显示出新版面
	CharminUltra_An				=15, // 旧版面淡出并显示新版面
	ZoomyIn_An					=16, // 新版面由小放大走到前面, 旧版面放大由前面消失
	ZoomyOut_An					=17, // 新版面屏幕外面缩放出现, 旧版面缩小消失
	OglApplicationSuspend_An	=18  // 像按”home” 按钮的效果
};


@interface UIImageView (ZMAdd)
{

}
@property (nonatomic, copy) NSString* imgName;

// 图片动画
- (void)animationImageViewDuration:(NSTimeInterval)duration animationType:(CATransitionAnimationType)animationType;


@end

