//
//  CAHeader.h
//  ZM_CALayer
//
//  Created by tangdi on 16/4/6.
//  Copyright © 2016年 TD. All rights reserved.
//

#ifndef CAHeader_h
#define CAHeader_h

#define GreenColorAA			UIColorWithRGB(90,220,80)


// 以下API效果可以安全使用
#define Cube					@"cube"			//方块
#define SuckEffect				@"suckEffect"	//三角
#define RippleEffect			@"rippleEffect"	//水波抖动
#define PageCurl				@"pageCurl"		//上翻页
#define PageUnCurl				@"pageUnCurl"	//下翻页
#define OglFlip					@"oglFlip"		//上下翻转
#define CameraIrisHollowOpen	@"cameraIrisHollowOpen"		//镜头快门开
#define CameraIrisHollowClose	@"cameraIrisHollowClose"	//镜头快门关


// 以下API效果请慎用
#define SpewEffect		@"spewEffect"	// 新版面在屏幕下方中间位置被释放出来覆盖旧版面.
#define GenieEffect		@"genieEffect"	// 旧版面在屏幕左下方或右下方被吸走, 显示出下面的新版面
#define UnGenieEffect	@"unGenieEffect"// 新版面在屏幕左下方或右下方被释放出来覆盖旧版面.
#define Twist			@"twist"		// 版面以水平方向像龙卷风式转出来.
#define Tubey			@"tubey"		// 版面垂直附有弹性的转出来.
#define Swirl			@"swirl"		// 旧版面360度旋转并淡出, 显示出新版面.
#define CharminUltra	@"charminUltra"	// 旧版面淡出并显示新版面.
#define ZoomyIn			@"zoomyIn"		// 新版面由小放大走到前面, 旧版面放大由前面消失.
#define ZoomyOut		@"zoomyOut"		// 新版面屏幕外面缩放出现, 旧版面缩小消失.
#define OglApplicationSuspend	@"oglApplicationSuspend" // 像按”home” 按钮的效果.



#endif /* CAHeader_h */
