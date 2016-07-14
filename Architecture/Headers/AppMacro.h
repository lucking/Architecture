//
//  AppMacro.h
//  TDiPad
//
//  Created by tangdi on 16/4/1.
//  Copyright © 2016年 TD. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h


#pragma mark  -----------------------"  NotificationMsg：通知管理  "---------------------------------

//[[NSNotificationCenter defaultCenter] postNotificationName:@"_name" object:nil];

//[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_selector) name:_name object:_obj];
//// 发出通知
//PostNotificat(@"Post",nil);
//// 接受通知：
//GetNotificatSelector(ChangSelIndex:, @"Get", @"obj");

// 隐藏侧边菜单
#define  NotiMsg_HiddenMenu_rightSwipe	@"rightSwipe"
// 显示侧边菜单
#define  NotiMsg_ShowMenu_LeftSwipe		@"leftSwipe"


// 添加通知
#define PostNotificat(_name,_obj) [[NSNotificationCenter defaultCenter] postNotificationName:_name object:_obj]

// 接收通知
#define GetNotificatSelector(_selector,_name,_obj) [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_selector) name:_name object:_obj]



// 监听输入框： (UIControlEventEditingChanged：内容改变时)
#define NNotificatTextFieldEditingChanged(_textFiled)	[_textFiled addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged]


//	监听键盘： (UIKeyboardWillHideNotification：键盘将要隐藏时)
#define NNotificatTextFieldKeyboardWillHide(_textFiled)	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(NotificatKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];




// ============================"   屏幕尺寸  "==============================






// ============================"  格式化 数据类型  "==============================


#define  NNSStringInt(myInt)		[NSString stringWithFormat:@"%d",myInt]		// Int
#define  NNSStringFloat(myFloat)	[NSString stringWithFormat:@"%f",myFloat]	// Float
#define  NNSString2Float(myFloat)	[NSString stringWithFormat:@".2%f",myFloat]	// Float：保留两位小数

#define  NNSString(string)		[NSString stringWithFormat:@"%@",string]		// 1个NSString
#define  NNStringAB(AA,BB)		[NSString stringWithFormat:@"%@%@",AA,BB]		// 2个NSString 拼接
#define  NNStringABC(AA,BB,CC)	[NSString stringWithFormat:@"%@%@%@",AA,BB,CC]	// 3个NSString 拼接

/**
 *  判断字符串是否相等
 */
#define   IsEqual(AA,BB)   [AA isEqualToString:BB]

// 判断空字符串
#define Empty_Str(param)            (nil == param || param.length < 1)



// ============================"  AlertView  "==============================

#define     AlertView(mmessage)    UIAlertView* AlertView =  [[UIAlertView alloc]initWithTitle:@"温馨提示" message:mmessage delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];\
[AlertView show]


#define     AlertViewDelegate(mmessage)    UIAlertView* AlertView =  [[UIAlertView alloc]initWithTitle:@"温馨提示" message:mmessage delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];\
[AlertView show]










#endif /* AppMacro_h */
