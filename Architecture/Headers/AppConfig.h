//
//  AppConfig.h
//  TDiPad
//
//  Created by tangdi on 16/4/12.
//  Copyright © 2016年 TD. All rights reserved.
//

#ifndef AppConfig_h
#define AppConfig_h



#pragma mark  -----------------------"  NotificationMsg：通知管理  "---------------------------------

//[[NSNotificationCenter defaultCenter] postNotificationName:@"_name" object:nil];

//[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_selector) name:_name object:_obj];
//// 发出通知
//PostNotificat(@"Post",nil);
//// 接受通知：
//GetNotificatSelector(ChangSelIndex:, @"Get", @"obj");


//// 隐藏侧边菜单
//#define  NotiMsg_HiddenMenu_rightSwipe	@"rightSwipe"
//// 显示侧边菜单
//#define  NotiMsg_ShowMenu_LeftSwipe		@"leftSwipe"


// 添加通知
#define PostNotificat(_name,_obj) [[NSNotificationCenter defaultCenter] postNotificationName:_name object:_obj]

// 接收通知
#define GetNotificatSelector(_selector,_name,_obj) [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_selector) name:_name object:_obj]



// 监听输入框： (UIControlEventEditingChanged：内容改变时)
#define NNotificatTextFieldEditingChanged(_textFiled)	[_textFiled addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged]


//	监听键盘： (UIKeyboardWillHideNotification：键盘将要隐藏时)
#define NNotificatTextFieldKeyboardWillHide(_textFiled)	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(NotificatKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];




#pragma mark  -----------------------"  屏幕尺寸  "---------------------------------







#endif /* AppConfig_h */
