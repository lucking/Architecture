//
//  Notification.m
//  HuiFang
//
//  Created by tangdi on 15/11/26.
//  Copyright © 2015年 TD. All rights reserved.
//

#import "Notification.h"



@implementation Notification

Singleton_Instance_method_Impl(Notification);

//======================="  通知  "=================================

- (void)increaseSize:(id)sender {

	// 添加通知
	[[NSNotificationCenter defaultCenter] postNotificationName:@"通知变化" object:nil];
	// 接收通知
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(NotificatClick) name:@"通知变化" object:nil];


	UITextField* pwdTextFiled = nil;
	[pwdTextFiled addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];


	//	监听键盘： (UIKeyboardWillHideNotification：键盘将要隐藏时)
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(NotificatKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];


	// 监听输入框： (UITextFieldTextDidChangeNotification：内容改变时)
	[[NSNotificationCenter defaultCenter] addObserverForName:UITextFieldTextDidChangeNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notificate){

		NSLog(@" textField ");
		if ([notificate.object isEqual:self]){

		}
	}];


	// 发出通知
	[[NSNotificationCenter defaultCenter] postNotificationName:@"BackToFirst" object:@"111"];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"BackToSecond" object:@"222"];
	// 接受通知
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ChangSelIndex:) name:@"BackToFirst" object:@"111"];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ChangSelIndex:) name:@"BackToSecond" object:nil];
	


	//测试例子
	PostNotificat(@"NotificationToChange",nil);
	GetNotificatSelector(ChangNotification,@"NotificationToChange", nil);


	NNotificatTextFieldEditingChanged(pwdTextFiled);

}

// 通知传值
- (void)ChangSelIndex:(NSNotification *)notify{

	NSLog(@"notify = %@",notify);
	NSLog(@"notify = %@",[notify description]);

	id obj = [notify object];//获取到传递的对象
	NSLog(@"obj = %@",obj);


	NSInteger index = [[notify object] integerValue];
	NSLog(@"index = %ld \n \n ",(long)index);
	
}


- (void)NotificatClick{

}


#pragma mark 接收通知变化
- (void)ChangNotification {

	NSLog(@" 通知变化,立即启动 \n ");
}
#pragma mark 键盘将要隐藏时：通知变化
- (void)NotificatKeyboardWillHide:(UITextField *)textField{

	NSLog(@" NotificatKeyboardWillHide \n ");
}
#pragma mark 输入框内容改变时：通知变化
- (void)textFieldEditingChanged:(UITextField *)textField{

	if (textField.text.length > 6) {
		textField.text = [textField.text substringToIndex:6];
	}
}


@end
