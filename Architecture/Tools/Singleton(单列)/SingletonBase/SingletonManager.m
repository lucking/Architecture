//
//  SingletonManager.m
//  HuiFang
//
//  Created by tangdi on 15/11/27.
//  Copyright © 2015年 TD. All rights reserved.
//

#import "SingletonManager.h"

@implementation SingletonManager
//实例化
Singleton_Instance_method_Impl(SingletonManager)


- (void)test
{
 /**
  *  NSFileManager、NSWorkspace
  *
  *  @param NetworkManager <#NetworkManager description#>
  *
  *  @return <#return value description#>
  */

}


#pragma mark 继承于 Singleton 的类
#pragma
- (NetworkManager *)networkManager
{
	return [NetworkManager instance];
}

- (LoginManager *)loginManager{
	return [LoginManager instance];
}


- (UserDefaults *)userDefaults{
	return [UserDefaults instance];
}


- (FileManager *)fileManager {
	return [FileManager instance];
}

- (MBProgress *)MBProgressHUD {
	return [MBProgress instance];
}


//- (Notification *)notification {
//	return [Notification instance];
//}



#pragma mark 不继承于 Singleton 的其他类
#pragma
//- (ZMOperation *)zmOperation {
//	return [ZMOperation instance];
//}
//
//- (ZMOperationQueue *)zmOperationQueue {
//	return [ZMOperationQueue instance];
//}


@end
