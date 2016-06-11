//
//  SingletonManager.h
//  HuiFang
//
//  Created by tangdi on 15/11/27.
//  Copyright © 2015年 TD. All rights reserved.
//

#import "Singleton.h"
#import "LoginManager.h"
#import "UserDefaults.h"
#import "NetworkManager.h"
//#import "Notification.h"
#import "FileManager.h"
//#import "InfoDictionaryManager.h"
#import "MBProgress.h"


//#import "ZMOperation.h"
//#import "ZMOperationQueue.h"

//=========================="  单列模式  "============================
//不同地方 同用同一个对象
/*

 [NSUserDefaults standardUserDefaults]; //用户保存数据

 [NSNotificationCenter defaultCenter];  //通知中心

 [NSFileManager defaultManager];        //文件管理

 ......

 */

#define NNetworkManager			([SingletonManager instance].networkManager)	//网络管理
#define LLoginManager			([SingletonManager instance].loginManager)		//登录
#define UUserDefaults			([SingletonManager instance].userDefaults)		//保存信息
//#define NNotification			([SingletonManager instance].notification)		//通知中心
#define FFileManager			([SingletonManager instance].fileManager)		//文件管理
//#define IInfoDicManager			([SingletonManager instance].InfoDicManager)	//app信息管理
#define MMBProgress				([SingletonManager instance].MBProgressHUD)		//请求菊花


//#define OOperation				([SingletonManager instance].zmOperation)		//线程操作
//#define OOperationQueue			([SingletonManager instance].zmOperationQueue)	//线程操作队列



@interface SingletonManager : Singleton
//实例化
Singleton_Instance_method_Interface(SingletonManager)


@property (nonatomic, readonly) NetworkManager *networkManager;			//网络管理

@property (nonatomic, readonly) LoginManager *loginManager;				//登录

@property (nonatomic, readonly) UserDefaults *userDefaults;				//保存信息

//@property (nonatomic, readonly) Notification *notification;				//通知中心

@property (nonatomic, readonly) FileManager *fileManager;				//文件管理

//@property (nonatomic, readonly) InfoDictionaryManager *InfoDicManager;	//app信息管理

@property (nonatomic, readonly) MBProgress *MBProgressHUD;				//请求菊花



//@property (nonatomic, readonly) ZMOperation *zmOperation;				//线程操作管理
//@property (nonatomic, readonly) ZMOperationQueue *zmOperationQueue;		//线程操作队列



@end





