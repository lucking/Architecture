//
//  NetworkManager.h
//  ZMSingleton
//
//  Created by tangdi on 15/11/22.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
//#import "NetworkOperation.h"
#import "NetworkSession.h"
#import "AFNetworking.h"
#import "MBProgress.h"

@interface NetworkManager : Singleton
{

}
//实例化
Singleton_Instance_method_Interface(NetworkManager)
// 一个实例
+(NetworkManager *)GetInstance;


#pragma  网络请求Get方式
+ (void)requestCallGetURl:(NSString *)URL withParameters:(NSDictionary *)params hudShow:(BOOL)hudShow success:(void (^)(id data))success failure:(void (^)(NSError * error))failure;




#pragma mark -----------------------"  NetworkSession  "---------------------------------
#pragma mark 网络请求Get方式
+ (void)requestGetURl:(NSString *)URL withParameters:(NSDictionary *)params hudShow:(BOOL)hudShow success:(void (^)(id data))success failure:(void (^)(NSError * error))failure;

#pragma mark 网络请求post方式
+(void)requestPostURl:(NSString *)URL withParameters:(NSDictionary *)params hudShow:(BOOL)hudShow success:(void (^)(id data))success failure:(void (^)(NSError * error))failure;



#pragma mark -----------------------"  线程处理法  "---------------------------------
#pragma
+(void)requestThreadSessionPOSTURl:(NSString *)URL withParameters:(NSDictionary *)params hudShow:(BOOL)hudShow Target:(id)_target select:(SEL)selectName failure:(void (^)(NSError * error))failure;


#pragma mark -----------------------"  文件上传  "---------------------------------
#pragma
+ (void)upLoadPOST:(NSDictionary *)params fileData:(NSData *)data fileDic:(NSDictionary *)fileDic withURL:(NSString *)URL hudShow:(BOOL)hudShow success:(void (^)(id data))success failure:(void (^)(NSError * error))failure ;



// 弹出网络错误提示框
+ (void)showWithoutNetwork;

// 看看网络是不是给力
+ (BOOL)isConnectionAvailable;

// 监听网络状态_AFNetworking
+ (int)isReachableViaWiFi; //处理图片、视频下载使用

+ (BOOL)netWorkReachabilityStatus; // app监听使用

// 监测URL网络的可链接性
+ (BOOL)netWorkReachabilityWithURLString:(NSString *)strUrl;


/**
 AFNetworkReachabilityStatusUnknown          = -1,  // 未知
 AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
 AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G花钱
 AFNetworkReachabilityStatusReachableViaWiFi = 2,   // WiFi
 
 //NSLog(@"---> Reachability_Wifi");
 */
//发出网络异常通知广播
//[[NSNotificationCenter defaultCenter] postNotificationName:@"k_NOTI_NETWORK_ERROR" object:nil];


@end


