//
//  NetworkManager.m
//  ZMSingleton
//
//  Created by tangdi on 15/11/22.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "NetworkManager.h"

#import <netinet/in.h>
#import <netinet6/in6.h>
#import <arpa/inet.h>
#import <ifaddrs.h>
#import <netdb.h>


@implementation NetworkManager
//实例化
Singleton_Instance_method_Impl(LoginManager)

static NetworkManager *_singleInstance;
+ (NetworkManager *)GetInstance
{
	return _singleInstance;
}

#pragma mark =========================="   NetworkSession   "===================================

#pragma  网络请求Get方式
+ (void)requestGetURl:(NSString *)URL withParameters:(NSDictionary *)params success:(void (^)(id data))success failure:(void (^)(NSError * error))failure;
{
	//[MMBProgress hudShowLoading:@"请稍候..."];
	URL = [API_URL stringByAppendingFormat:@"%@",URL];
    
	//判断网络状况（有链接：执行请求；无链接：弹出提示）
	if ([self isReachableViaWiFi]) {

		[[NetworkSession sharedSessionManager] GET:URL parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
			//progress

		} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
			//NSLog(@"---> responseObject: %@", responseObject);

			[MMBProgress hudHidden];
			if (responseObject){
				success(responseObject);		 //请求成功返回数据
			}
            
		} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
			[MMBProgress hudHidden];
			[self errorDealWithLocalError:error];//处理_请求错误
		}];

	}else{
		[MMBProgress hudHidden];
		[self showWithoutNetwork];//网络错误提示
	}
}

#pragma mark POST方式
+(void)requestPostURl:(NSString *)URL withParameters:(NSDictionary *)params success:(void (^)(id data))success failure:(void (^)(NSError * error))failure
{
	URL = [API_URL stringByAppendingFormat:@"%@",URL];
	//判断网络状况（有链接：执行请求；无链接：弹出提示）
	if ([self isReachableViaWiFi]) {

		[[[NetworkSession sharedSessionManager] POST:URL parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {

		} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
			if (responseObject){
				success(responseObject);
			}
		} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
			[MMBProgress hudHidden];
			[self errorDealWithLocalError:error];

		}] resume]; //重新开始;

	}else{
		[MMBProgress hudHidden];
		[self showWithoutNetwork];//网络错误提示
	}
}

#pragma mark ======================="   数据请求：线程处理法   "=================================
#pragma
+(void)requestThreadSessionPOSTURl:(NSString *)URL withParameters:(NSDictionary *)params Target:(id)_target select:(SEL)selectName failure:(void (^)(NSError * error))failure
{
	URL = [API_URL stringByAppendingFormat:@"%@",URL];
	NSLog(@"--->请求url: %@",URL);
	NSLog(@"--->请求参数: %@ \n ",params);

	//判断网络状况（有链接：执行请求；无链接：弹出提示）
	if ([self isReachableViaWiFi]) {

		[[NetworkSession sharedSessionManager] GET:URL parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {

		} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

			[MMBProgress hudHidden];
			//返回调用处数据
			if ([_target respondsToSelector:selectName]) {

				// 5秒钟后启动线程
				// [_target performSelector:selectName withObject:responseObject afterDelay:5];
				[_target performSelectorOnMainThread:selectName withObject:responseObject waitUntilDone:YES];
			}

		} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
			[MMBProgress hudHidden];
			[self errorDealWithLocalError:error]; //请求_处理错误
		}];
	}else{
		[MMBProgress hudHidden];
		[self showWithoutNetwork]; //网络错误了
	}
}

#pragma mark =========================="   文件上传   "===================================
/**
 *  文件上传 POST
 */
+ (void)upLoadPOST:(NSDictionary *)params fileData:(NSData *)data fileDic:(NSDictionary *)fileDic withURL:(NSString *)URL success:(void (^)(id data))success failure:(void (^)(NSError * error))failure {

	URL = [HOSURL stringByAppendingFormat:@"%@",URL];
	[[NetworkSession sharedSessionManager] POST:URL parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {

		/*	此方法参数
		 1. 要上传的[二进制数据]
		 2. 对应网站上[upload.php中]处理文件的[字段"file"]
		 3. 要保存在服务器上的[文件名]
		 4. 上传文件的[mimeType]	这个方法可以上传图片，如果不用上传图片，可以把这句去掉
		 [formData appendPartWithFileData :imageDataname:@"1"fileName:@"1.png"mimeType:@"image/jpeg"]	*/
		// 方法一：上传文件
		[formData appendPartWithFileData:data name:fileDic[@"name"] fileName:fileDic[@"fileName"] mimeType:fileDic[@"mimeType"]];

		// 方法二：上传文件地址（在本地中存储的文件地址）
		//NSURL *filePath = [NSURL fileURLWithPath:self.imagepath];
		//[formData appendPartWithFileURL:filePath name:@"myfile" error:nil];

	} progress:^(NSProgress * _Nonnull uploadProgress) {

	} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
		NSLog(@"Success_responseObject: %@", responseObject);

	} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
		//处理_请求错误
		[self errorDealWithLocalError:error];
	}];
}

/**
 *  处理_请求错误
 */
+ (void)errorDealWithLocalError:(NSError *)error {

	NSString* localError = [error localizedDescription];
	NSLog(@"---> localError = %@",localError);

	if ([localError isEqualToString:LocalError_timedOut]) {
		[MMBProgress hudShowError:@"请求超时，服务链接中断 \n 程序员哥哥正在抢救中"];

	}else if ([localError isEqualToString:LocalError_notRead]){
		[MMBProgress hudShowError:@"无法连接到服务器"];

	}else if ([localError isEqualToString:LocalError_notRead]){
		[MMBProgress hudShowError:@"数据无法读取,因为它不在正确的格式。"];
	}else{
		[MMBProgress hudShowError:[error localizedDescription]];
	}
}
/**
 *  没有网络：创建网络错误处理类型
 */
+ (NSError *)createLocalError:(id)obj {
	NSDictionary *userInfo = @{NSLocalizedDescriptionKey:@"withoutNetwork",
							   NSUnderlyingErrorKey		:@"error"
							   };
	NSError *error = [NSError errorWithDomain:@"domain" code:1001 userInfo:userInfo];

	return error;
}


//弹出网络错误提示框
+ (void)showWithoutNetwork{
	[MMBProgress hudShowError:@"网络异常，请检查网络连接"];
}

// 监听网络状态_AFNetworking
+ (BOOL)isReachableViaWiFi {

	AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
	if (manager.isReachableViaWiFi) {		// 在使用Wifi, 下载原图
		return YES;
	}else if (manager.isReachableViaWWAN) { // 3G花钱
		return YES;
	}else {									// 其他，下载小图
		return NO;
	}
}

// 监测网络的可链接性
+ (BOOL)netWorkReachabilityWithURLString:(NSString *) strUrl
{
	__block BOOL netState = NO;

	NSURL *baseURL = [NSURL URLWithString:strUrl];
	AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
	NSOperationQueue *operationQueue = manager.operationQueue;

	[manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
		switch (status) {
			case AFNetworkReachabilityStatusReachableViaWWAN: // WWAN
			case AFNetworkReachabilityStatusReachableViaWiFi: // WiFi
				[operationQueue setSuspended:NO];
				netState = YES;
				break;
			case AFNetworkReachabilityStatusNotReachable:	  // NotReachable
				netState = NO;
			default:
				[operationQueue setSuspended:YES];
				break;
		}
	}];
	[manager.reachabilityManager startMonitoring];

	return netState;
}



// 查看网络状态是否给力
+ (BOOL)isConnectionAvailable
{
	// 创建零地址，0.0.0.0的地址表示查询本机的网络连接状态
	struct sockaddr_in zeroAddress;
	bzero(&zeroAddress, sizeof(zeroAddress));
	zeroAddress.sin_len = sizeof(zeroAddress);
	zeroAddress.sin_family = AF_INET;

	SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
	SCNetworkReachabilityFlags flags;

	BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
	CFRelease(defaultRouteReachability);

	if (!didRetrieveFlags)
		{
		printf("Error. Could not recover network reachability flagsn");
		return NO;
		}

	BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
	BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
	return (isReachable && !needsConnection) ? YES : NO;
}





/***********************  数据请求：线程处理，使用方法   ***********************
 */
- (void)howToUse {
    //拼接参数
    NSDictionary *parameter= [NSDictionary dictionaryWithObjectsAndKeys:@"1",@"mid",
                              @"2",@"sessionId",nil];
    //调用接口
    [NetworkManager requestThreadSessionPOSTURl:Register withParameters:parameter Target:self select:@selector(registerAccount:) failure:nil];
}
// 注册返回数据
-(void)registerAccount:(id)object{
    NSDictionary* registDic = [[NSDictionary alloc]initWithDictionary:(NSDictionary *)object];
    
    NSString *retFlag= [registDic objectForKey:@"retFlag"];
    NSLog(@"retFlag = %@",retFlag);
}


@end

