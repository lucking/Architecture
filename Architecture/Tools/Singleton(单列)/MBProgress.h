//
//  MBProgress.h
//  TDiPad
//
//  Created by tangdi on 16/4/7.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "Singleton.h"
#import "MBProgressHUD.h"

@interface MBProgress : Singleton< MBProgressHUDDelegate >
{
	MBProgressHUD *_hudView;
}
//创建实例
Singleton_Instance_method_Interface(MBProgress)

// 单例：同上
//+ (MBProgress *)singleton;


//数据加载项
- (void)hudShowLoading:(NSString *)message;

- (void)hudShowSucceed:(NSString *)message;

- (void)hudShowError:(NSString *)message;

- (void)hudShowMessage:(NSString *)message afterDelay:(NSTimeInterval)delay;

- (void)hudHidden;

- (void)hudHidden:(NSTimeInterval)delay;

- (void)hudHiddenImmediately;

// 从重父视图中移除
- (void)hudRemove;

- (void)removeProgressHud;



@end
