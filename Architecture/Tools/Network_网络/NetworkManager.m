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
#import "AFNetworking.h"

@implementation NetworkManager
//实例化
Singleton_Instance_method_Impl(LoginManager)

static NetworkManager *_singleInstance;
+ (NetworkManager *)GetInstance
{
	return _singleInstance;
}




#pragma  网络请求Get方式
+ (void)requestCallGetURl:(NSString *)URL withParameters:(NSDictionary *)params hudShow:(BOOL)hudShow success:(void (^)(id data))success failure:(void (^)(NSError * error))failure;
{
    __weak __typeof(self)weakSelf = self;
//    URL = [API_URL stringByAppendingFormat:@"%@",URL];
//    NSLog(@"--->请求url: %@",URL);
//    NSLog(@"--->请求参数: %@ \n ",params);
    
    NSString* urlStr = [Common getCallURlStringOfIP:URL sortParams:[Common getCallJsonParameters:params]];
    NSLog(@"---> 整体的接口_urlStr = %@ \n ",urlStr);
    
    //判断网络状况（有链接：执行请求；无链接：弹出提示）
    if ([self isReachableViaWiFi]) {
        if (hudShow) {
            [MMBProgress hudShowLoading:@"请稍候..."];
        }
        
        [[NetworkSession sharedSessionManager] GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            //progress
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSLog(@"---> responseObject: %@", responseObject);
            
            [weakSelf hudHidden];
            if (responseObject){
                success(responseObject);//请求成功返回数据
            }
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [weakSelf hudHidden];
            [weakSelf errorDealWithLocalError:error];//处理_请求错误
        }];
    }else{
        [weakSelf showWithoutNetwork];//网络错误提示
    }
}


#pragma mark =========================="   NetworkSession   "===================================

#pragma  网络请求Get方式
+ (void)requestGetURl:(NSString *)URL withParameters:(NSDictionary *)params hudShow:(BOOL)hudShow success:(void (^)(id data))success failure:(void (^)(NSError * error))failure;
{
    __weak __typeof(self)weakSelf = self;
	URL = [API_URL stringByAppendingFormat:@"%@",URL];
    NSLog(@"--->请求url: %@",URL);
    NSLog(@"--->请求参数: %@ \n ",params);
	//判断网络状况（有链接：执行请求；无链接：弹出提示）
	if ([self isReachableViaWiFi]) {
        if (hudShow) {
            [MMBProgress hudShowLoading:@"请稍候..."];
        }

		[[NetworkSession sharedSessionManager] GET:URL parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
			//progress

		} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
			//NSLog(@"---> responseObject: %@", responseObject);

            [weakSelf hudHidden];
			if (responseObject){
				success(responseObject);//请求成功返回数据
			}
            
		} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [weakSelf hudHidden];
			[weakSelf errorDealWithLocalError:error];//处理_请求错误
		}];

	}else{
		[weakSelf showWithoutNetwork];//网络错误提示
	}
}

#pragma mark POST方式
+(void)requestPostURl:(NSString *)URL withParameters:(NSDictionary *)params hudShow:(BOOL)hudShow success:(void (^)(id data))success failure:(void (^)(NSError * error))failure
{
    __weak __typeof(self)weakSelf = self;
	URL = [API_URL stringByAppendingFormat:@"%@",URL];
	//判断网络状况（有链接：执行请求；无链接：弹出提示）
	if ([self isReachableViaWiFi]) {
        if (hudShow) {
            [MMBProgress hudShowLoading:@"请稍候..."];
        }
		[[[NetworkSession sharedSessionManager] POST:URL parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {

		} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [weakSelf hudHidden];
			if (responseObject){
				success(responseObject);
			}
		} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [weakSelf hudHidden];
			[weakSelf errorDealWithLocalError:error];

        }] resume];
	}else{
		[self showWithoutNetwork];
	}
}

#pragma mark ======================="   数据请求：线程处理法   "=================================
#pragma
+(void)requestThreadSessionPOSTURl:(NSString *)URL withParameters:(NSDictionary *)params hudShow:(BOOL)hudShow Target:(id)_target select:(SEL)selectName failure:(void (^)(NSError * error))failure
{
    __weak __typeof(self)weakSelf = self;
	URL = [API_URL stringByAppendingFormat:@"%@",URL];
	if ([self isReachableViaWiFi]) {
        if (hudShow) {
            [MMBProgress hudShowLoading:@"请稍候..."];
        }
		[[NetworkSession sharedSessionManager] GET:URL parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {

		} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

            [weakSelf hudHidden];
			//返回调用处数据
			if ([_target respondsToSelector:selectName]) {

				// 5秒钟后启动线程
				// [_target performSelector:selectName withObject:responseObject afterDelay:5];
				[_target performSelectorOnMainThread:selectName withObject:responseObject waitUntilDone:YES];
			}

		} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [weakSelf hudHidden];
			[weakSelf errorDealWithLocalError:error];
		}];
	}else{
		[self showWithoutNetwork];
	}
}

/***********************  数据请求：线程处理，使用方法   ***********************
 */
- (void)howToUse {
    //拼接参数
    NSDictionary *parameter= @{@"1":@"mid",
                               @"2":@"sessionId"};
    //调用接口
    [NetworkManager requestThreadSessionPOSTURl:Register withParameters:parameter hudShow:YES Target:self select:@selector(registerAccount:) failure:nil];
}
// 注册返回数据
-(void)registerAccount:(id)object{
    NSDictionary* registDic = [[NSDictionary alloc]initWithDictionary:(NSDictionary *)object];
    
    NSString *retFlag= [registDic objectForKey:@"retFlag"];
    NSLog(@"retFlag = %@",retFlag);
}



/**
 * afnetworking 3.0设置请求头 
 * [NetworkSessionHeader headerSessionManager]  post请求
 */
+ (void)headerPOST:(NSDictionary *)params withURL:(NSString *)URL hudShow:(BOOL)hudShow success:(void (^)(id data))success failure:(void (^)(NSError * error))failure {
    
    __weak __typeof(self)weakSelf = self;
    URL = [API_URL stringByAppendingFormat:@"%@",URL];
    
    if ([self isReachableViaWiFi]) {
        if (hudShow) {
            [MMBProgress hudShowLoading:@"请稍候..."];
        }
        [[NetworkSessionHeader headerSessionManager] POST:URL parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
             [weakSelf hudHidden];
            NSLog(@"Success_responseObject: %@", responseObject);
            //NSData *data = [responseObject dataUsingEncoding:NSUTF8StringEncoding];

            if (responseObject){
                success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            [weakSelf hudHidden];
            //处理_请求错误
            [weakSelf errorDealWithLocalError:error];
        }];
    }else{
        [self showWithoutNetwork];
    }
}



#pragma mark =========================="   文件上传   "===================================
/**
 *  文件上传 POST
 */
+ (void)upLoadPOST:(NSDictionary *)params fileData:(NSData *)data fileDic:(NSDictionary *)fileDic withURL:(NSString *)URL hudShow:(BOOL)hudShow success:(void (^)(id data))success failure:(void (^)(NSError * error))failure {
    __weak __typeof(self)weakSelf = self;
    URL = [API_URL stringByAppendingFormat:@"%@",URL];

    if ([self isReachableViaWiFi]) {
        if (hudShow) {
            [MMBProgress hudShowLoading:@"请稍候..."];
        }
        
        [[NetworkSession sharedSessionManager] POST:URL parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            [weakSelf hudHidden];

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
            [weakSelf hudHidden];

            NSLog(@"Success_responseObject: %@", responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [weakSelf hudHidden];
            //处理_请求错误
            [weakSelf errorDealWithLocalError:error];
        }];
    }else{
        [self showWithoutNetwork];
    }
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
							   NSUnderlyingErrorKey		:@"error"};
	NSError *error = [NSError errorWithDomain:@"domain" code:1001 userInfo:userInfo];
	return error;
}

//弹出网络错误提示框
+ (void)showWithoutNetwork{
	[MMBProgress hudShowError:@"网络异常，请检查网络连接"];
}

// 监听网络状态_AFNetworking
+ (int)isReachableViaWiFi {

	AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
	if (manager.isReachableViaWiFi) {		// 在使用Wifi, 下载原图
		return 2;
	}else if (manager.isReachableViaWWAN) { // 3G花钱
		return 1;
	}else {// 其他，下载小图
		return 0;
	}
}

// 判断网络状态 
+ (BOOL)netWorkReachabilityStatus {
    
    __block BOOL netState = NO;

    //创建网络状态监测管理者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    //监听状态的改变
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
                
            case  AFNetworkReachabilityStatusUnknown:
                netState = NO;
                break;
            case AFNetworkReachabilityStatusNotReachable: //没有网络
                netState = NO;
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN: //3G|4G
                netState = YES;
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi: //WiFi
                netState = YES;
                break;
            default:
                break;
        }
    }];
    [manager startMonitoring];//开始监听
    return netState;
}


// 监测URL网络的可链接性
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
+ (void)hudHidden {
    [MMBProgress hudHidden];
}

/*
 *
 #pragma mark ==========="  1__325  "=============

 [
 {
 "id": "338",
 "describe": "活动+平台帮助主办方提供活动发布、报名管理、报名验券、活动名单和数据管理等功能。",
 "title": "测试付款",
 "sponsor_s": "",
 "sponsor": "启云星航",
 "founders": "启云星航",
 "area": "49",
 "parent_area_id": "10503",
 "addres": "",
 "start_time": "2017-04-11 18:05",
 "close_time": "2017-04-12 18:05",
 "confine": "0",
 "img": "http://test.activityplus.com.cn/Uploads/570b7746b94ba.jpg",
 "industry_id": "1",
 "category_id": "%-1-%",
 "cost": null,
 "apply": null,
 "invite": null,
 "prize": null,
 "status": "0",
 "count": "0",
 "create_time": "2016-04-11 18:08:31",
 "user_id": "61",
 "browse": "140",
 "tmp_id": "195",
 "cause": "0",
 "link": "",
 "is_link": "0",
 "qrcode": "/Uploads/95a6caa9944274c04a9fa3e1bcf2885d107987a9.png",
 "qrcode_url": "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxe8f5529a4adea528&redirect_uri=http%3A%2F%2Ftest.activityplus.com.cn%2Findex.php%3Fm%3Dwx%26a%3DoAuth%26act_id%3D338&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect",
 "preview": "Uploads/yq818n.png",
 "area_id": "10501",
 "pay": "1",
 "price": "0.01",
 "purchase_notes": "测试",
 "num": "20",
 "notice_for_use": "测试",
 "settlement": "0",
 "receipt_id": null,
 "customize_id": "0",
 "detail_url": "http://test.activityplus.com.cn/index.php/detail/detail/id/338",
 "industry_name": "IT网络",
 "category_name": [
 "培训"
 ]
 },
 
 
 #pragma mark ==========="  2__330  "=============

 {
 "id": "330",
 "describe": "活动+平台帮助主办方提供活动发布、报名管理、报名验券、活动名单和数据管理等功能。",
 "title": "支付流程测试",
 "sponsor_s": "",
 "sponsor": "启云星航",
 "founders": "启云星航",
 "area": "49",
 "parent_area_id": "10503",
 "addres": "江苏省苏州市唯新路60号",
 "start_time": "2017-02-25 15:53",
 "close_time": "2017-02-25 16:53",
 "confine": "0",
 "img": "http://test.activityplus.com.cn/Uploads/56cd61d9f2ae0.jpg",
 "industry_id": "1",
 "category_id": "%-1-%,%-2-%",
 "cost": null,
 "apply": null,
 "invite": null,
 "prize": null,
 "status": "0",
 "count": "0",
 "create_time": "2016-02-24 15:56:51",
 "user_id": "61",
 "browse": "367",
 "tmp_id": "187",
 "cause": "0",
 "link": "",
 "is_link": "0",
 "qrcode": "/Uploads/613579f5751a095a39c1621b5699789500a8e137.png",
 "qrcode_url": "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxf65f4562cda64971&redirect_uri=http%3A%2F%2Ftest.activityplus.com.cn%2Findex.php%3Fm%3Dwx%26a%3DoAuth%26act_id%3D330&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect",
 "preview": "Uploads/086ub4.png",
 "area_id": "10501",
 "pay": "1",
 "price": "0.01",
 "purchase_notes": "测试!",
 "num": "100",
 "notice_for_use": "测试!",
 "settlement": "0",
 "receipt_id": "6",
 "customize_id": "0",
 "detail_url": "http://test.activityplus.com.cn/index.php/detail/detail/id/330",
 "industry_name": "IT网络",
 "category_name": [
 "培训",
 "讲座"
 ]
 },
 
 
 #pragma mark ==========="  3__327  "=============

 
 {
 "id": "327",
 "describe": "活动+平台帮助主办方提供活动发布、报名管理、报名验券、活动名单和数据管理等功能。",
 "title": "仅供测试——模板4-测试编辑",
 "sponsor_s": "",
 "sponsor": "启云星航",
 "founders": "启云星航",
 "area": "49",
 "parent_area_id": "10503",
 "addres": "江苏省苏州市唯新路60号",
 "start_time": "2017-01-06 14:13",
 "close_time": "2017-01-06 14:13",
 "confine": "0",
 "img": "http://test.activityplus.com.cn/Uploads/568cb0c393c08.png",
 "industry_id": "14",
 "category_id": "%-15-%,%-58-%",
 "cost": null,
 "apply": null,
 "invite": null,
 "prize": null,
 "status": "0",
 "count": "3",
 "create_time": "2016-01-06 14:14:59",
 "user_id": "61",
 "browse": "50",
 "tmp_id": "184",
 "cause": "0",
 "link": "",
 "is_link": "0",
 "qrcode": "/Uploads/6db9822cae07c33b013165669f155f7ff51d57f3.png",
 "qrcode_url": "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxf65f4562cda64971&redirect_uri=http%3A%2F%2Ftest.activityplus.com.cn%2Findex.php%3Fm%3Dwx%26a%3DoAuth%26act_id%3D327&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect",
 "preview": "Uploads/tywbts.png",
 "area_id": "10501",
 "pay": "0",
 "price": "0.00",
 "purchase_notes": "",
 "num": "0",
 "notice_for_use": "",
 "settlement": "0",
 "receipt_id": null,
 "customize_id": "0",
 "detail_url": "http://test.activityplus.com.cn/index.php/detail/detail/id/327",
 "industry_name": "生活",
 "category_name": [
 "生活",
 "公益"
 ]
 },
 
 
 
 #pragma mark ==========="  4__325  "=============

 {
 "id": "325",
 "describe": "活动+平台帮助主办方提供活动发布、报名管理、报名验券、活动名单和数据管理等功能。",
 "title": "仅供测试——模板2",
 "sponsor_s": "",
 "sponsor": "启云星航",
 "founders": "启云星航",
 "area": "49",
 "parent_area_id": "10503",
 "addres": "江苏省苏州市唯新路60号",
 "start_time": "2017-01-06 14:05",
 "close_time": "2017-01-06 18:00",
 "confine": "1",
 "img": "http://test.activityplus.com.cn/Uploads/568caf2015f71.png",
 "industry_id": "9",
 "category_id": "%-13-%,%-15-%",
 "cost": null,
 "apply": null,
 "invite": null,
 "prize": null,
 "status": "0",
 "count": "1",
 "create_time": "2016-01-06 14:08:22",
 "user_id": "61",
 "browse": "143",
 "tmp_id": "182",
 "cause": "0",
 "link": "",
 "is_link": "0",
 "qrcode": "/Uploads/f97cd8d63f4d9e52ebbc3372bd8521f57e943dfb.png",
 "qrcode_url": "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxf65f4562cda64971&redirect_uri=http%3A%2F%2Ftest.activityplus.com.cn%2Findex.php%3Fm%3Dwx%26a%3DoAuth%26act_id%3D325&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect",
 "preview": "Uploads/a9r83x.png",
 "area_id": "10501",
 "pay": "1",
 "price": "0.01",
 "purchase_notes": "                1.有效期:2015-07-10~2020-07-10<br/>\r\n                2.无附加使用限制<br/>\r\n                3.不可累计<br/>\r\n                4.本券限用一次,不折现,不找零,不挂失,不退换,打印或截图无效<br/>\r\n                5.结账时请向收银员出示本券<br/>\r\n                6.本券不和其他优惠券及活动一起使用<br/>\r\n                7.更多详情请现场咨询商家",
 "num": "1000",
 "notice_for_use": "                1.有效期:2015-07-10~2020-07-10<br/>\r\n                2.无附加使用限制<br/>\r\n                3.不可累计<br/>\r\n                4.本券限用一次,不折现,不找零,不挂失,不退换,打印或截图无效<br/>\r\n                5.结账时请向收银员出示本券<br/>\r\n                6.本券不和其他优惠券及活动一起使用<br/>\r\n                7.更多详情请现场咨询商家",
 "settlement": "1",
 "receipt_id": "9",
 "customize_id": "0",
 "detail_url": "http://test.activityplus.com.cn/index.php/detail/detail/id/325",
 "industry_name": "互联网",
 "category_name": [
 "专题",
 "生活"
 ]
 },
 
 #pragma mark ==========="  5__321  "=============

 {
 "id": "321",
 "describe": "活动+平台帮助主办方提供活动发布、报名管理、报名验券、活动名单和数据管理等功能。",
 "title": "仅供测试——模板1",
 "sponsor_s": "",
 "sponsor": "启云星航",
 "founders": "启云星航",
 "area": "49",
 "parent_area_id": "10503",
 "addres": "江苏省苏州市唯新路60号",
 "start_time": "2016-12-22 16:00",
 "close_time": "2016-12-22 18:00",
 "confine": "0",
 "img": "http://test.activityplus.com.cn/Uploads/56779c5750fe2.png",
 "industry_id": "16",
 "category_id": "%-13-%",
 "cost": null,
 "apply": null,
 "invite": null,
 "prize": null,
 "status": "0",
 "count": "1",
 "create_time": "2015-12-21 14:30:57",
 "user_id": "61",
 "browse": "232",
 "tmp_id": "178",
 "cause": "0",
 "link": "",
 "is_link": "0",
 "qrcode": "/Uploads/97076712a40c23aa5cf366e77e0b00724e64c701.png",
 "qrcode_url": "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxf65f4562cda64971&redirect_uri=http%3A%2F%2Ftest.activityplus.com.cn%2Findex.php%3Fm%3Dwx%26a%3DoAuth%26act_id%3D321&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect",
 "preview": "Uploads/8aiwx9.png",
 "area_id": "10501",
 "pay": "0",
 "price": "0.00",
 "purchase_notes": null,
 "num": "0",
 "notice_for_use": null,
 "settlement": "0",
 "receipt_id": null,
 "customize_id": "0",
 "detail_url": "http://test.activityplus.com.cn/index.php/detail/detail/id/321",
 "industry_name": "科技",
 "category_name": [
 "专题"
 ]
 },
 
 
 #pragma mark ==========="  6__366  "=============

 {
 "id": "366",
 "describe": "活动+调查问卷功能上线了，欢迎大家试用。",
 "title": "调查问卷功能测试-01",
 "sponsor_s": "",
 "sponsor": "苏州启云星航",
 "founders": "苏州测试账号",
 "area": "55",
 "parent_area_id": "10503",
 "addres": "",
 "start_time": "2016-06-30 20:40",
 "close_time": "2016-06-30 21:40",
 "confine": "0",
 "img": "http://test.activityplus.com.cn/Uploads/575029eec3a0c.png",
 "industry_id": "8",
 "category_id": "%-2-%,%-3-%",
 "cost": null,
 "apply": null,
 "invite": null,
 "prize": null,
 "status": "0",
 "count": "1",
 "create_time": "2016-06-02 20:58:48",
 "user_id": "1312",
 "browse": "21",
 "tmp_id": "223",
 "cause": "0",
 "link": "",
 "is_link": "0",
 "qrcode": "/Uploads/c173f786ec480a2ef600fbc601c74feacf8032f7.png",
 "qrcode_url": "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxe8f5529a4adea528&redirect_uri=http%3A%2F%2Ftest.activityplus.com.cn%2Findex.php%3Fm%3Dwx%26a%3DoAuth%26act_id%3D366&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect",
 "preview": "Uploads/ufjfj5.png",
 "area_id": "10501",
 "pay": "0",
 "price": "0.00",
 "purchase_notes": "",
 "num": "0",
 "notice_for_use": "",
 "settlement": "0",
 "receipt_id": null,
 "customize_id": "0",
 "detail_url": "http://test.activityplus.com.cn/index.php/detail/detail/id/366",
 "industry_name": "金融地产",
 "category_name": [
 "讲座",
 "茶话会"
 ]
 }
 ]
 */


@end
