//
//  Header.h
//  AliPayDemo
//
//  Created by pg on 15/7/10.
//  Copyright (c) 2015年 pg. All rights reserved.
//

#ifndef AliPayDemo_Header_h
#define AliPayDemo_Header_h


#endif


#define KscreenHeight	[UIScreen mainScreen].bounds.size.height
#define KscreenWidth	[UIScreen mainScreen].bounds.size.width


/******************* ITEM *********************/

#define ITEMRADIUS_OUTTER    60  //item的外圆直径
#define ITEMRADIUS_INNER     15	 //item的内圆直径
#define ITEMRADIUS_LINEWIDTH 2.0f	//item的线宽
#define ITEMWH               60		//item的宽高
#define ITEM_TOTAL_POSITION  180	// 整个item的顶点位置




/*********************** subItem *************************/

#define SUBITEMTOTALWH 50 // 整个subitem的大小
#define SUBITEMWH      12  //单个subitem的大小
#define SUBITEM_TOP    80 //整个的subitem的顶点位置(y点)




/*********************** 颜色 *************************/

#define UIColorWithRGB(r,g,b)  [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.0f]

//背景色
//#define BACKGROUNDCOLOR [UIColor colorWithRed:0.05 green:0.2 blue:0.35 alpha:1] //深蓝色
#define BGCOLOR    UIColorWithRGB(65,65,65)

//选中颜色  浅蓝色（小图轨迹）
//#define SELECTCOLOR [UIColor colorWithRed:0.13 green:0.7 blue:0.96 alpha:1]
#define NormalCOLOR		UIColorWithRGB(50,50,50)
#define SELECTCOLOR		[UIColor whiteColor]

//选中颜色  浅蓝色（大图轨迹）
#define SELECTCOLORBIG	UIColorWithRGB(77,167,252)


//选错的颜色  红色
#define WRONGCOLOR [UIColor colorWithRed:1 green:0 blue:0 alpha:1]

//文字错误提示颜色   浅红色
#define LABELWRONGCOLOR [UIColor colorWithRed:0.94 green:0.31 blue:0.36 alpha:1]



/*********************** 文字提示语 *************************/
#define SETPSWSTRING          @"请绘制锁屏图案,至少连接4个点"
#define RESETPSWSTRING        @"请再次绘制锁屏密码"
#define PSWSUCCESSSTRING      @"设置密码成功"
#define PSWFAILTSTRING        @"密码错误"
#define PSW_WRONG_NUMSTRING   @"请至少设置4个点"
#define INPUT_OLD_PSWSTRING   @"请输入原始密码"
#define INPUT_NEW_PSWSTRING   @"请输入新密码"
#define VALIDATE_PSWSTRING    @"验证密码"
#define VALIDATE_PSWSTRING_SUCCESS    @"登录成功"






