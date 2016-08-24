//
//  LoginManager.m
//  ZMSingleton
//
//  Created by tangdi on 15/11/4.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "LoginManager.h"
#import "UserModel.h"

@implementation LoginManager
//实例化
Singleton_Instance_method_Impl(LoginManager)

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


//- (NSNumber *)userId {		return[UserDefaults getObjectStorageWithKey:@"userId"];	}
- (NSString *)userId {		return[UserDefaults getObjectStorageWithKey:@"userId"];	}
- (NSString *)userName{		return [UUserDefaults userName];		}//取值（同上）
- (NSString *)userPwd{		return UUserDefaults.userPwd;			}
- (NSString *)userPhone{	return UUserDefaults.userPhone;			}
- (NSString *)userEmail{	return UUserDefaults.userEmail;			}
- (NSString *)userType{		return UUserDefaults.userType;			}
- (NSString *)userImgURLStr{return UUserDefaults.userImgURLStr;		}
- (NSString *)userSex{		return UUserDefaults.userSex;			}
- (BOOL)isLogin {			return UUserDefaults.isLogin;           }


/**
 *  登录页面、登录请求、退出请求
 */
#pragma mark 登录页面
#pragma
- (void)pushLoginVC {

	UIViewController *currentVC = [Common getCurrentVC];

	LoginViewController* loginVC = [[LoginViewController alloc] init];
	[currentVC.navigationController pushViewController:loginVC animated:YES];
}


#pragma mark 登录请求：Login
#pragma
- (void)loginWithParameters:params success:(void (^)(id data))success failure:(void (^)(NSError * error))failure {

	NSSLog(@"JSON_Params = %@ \n \n ",params);
	[MMBProgress hudShowLoading:@"请稍候..."];

	[NetworkManager requestGetURl:Login_URL withParameters:params hudShow:YES success:^(id data) {

		NSSLog(@"-----> 登录_data = %@",data);
		if ([Common isNotEmpty:data]) {
			NSDictionary* dicdata = (NSDictionary *)data;
			// 删除储存的信息
			[UUserDefaults removeAllObject];

			// 处理数据_自行根据数据格式_解析
			NSSLog(@"-----> REP_MSG  = %@",dicdata[@"REP_BODY"][@"REP_MSG"]);
			if ([dicdata[@"REP_BODY"][@"REP_CODE"] isEqualToString:@"000000"]) {

				UserModel *userMode = [UserModel objectWithKeyValues:dicdata[@"REP_BODY"][@"customerInf"]];
				UUserDefaults.isLogin = YES; // 登录成功：标志
				// 存储数据：全局可用
				UUserDefaults.userId   = userMode.custId;
				UUserDefaults.userName = userMode.custName;
				UUserDefaults.userPwd  = userMode.custPwd;
				UUserDefaults.userPhone= userMode.custPhone;
				UUserDefaults.userEmail= userMode.custMail;
				UUserDefaults.userSex  = userMode.custGender;
				UUserDefaults.userImgURLStr = userMode.custPortriat;
				UUserDefaults.userType		= userMode.userType;

				// 取数据：全局可用
				NSSLog(@"userName	= %@",LLoginManager.userName);
				NSSLog(@"userPwd	= %@",LLoginManager.userPwd);
				NSSLog(@"userId	    = %@ \n ",LLoginManager.userId);
			}else {
				AlertView(dicdata[@"REP_BODY"][@"REP_MSG"]);
			}

			// 如果有被踢出登录页_需求
			[self pushLoginVC];

		}

		success(data);

	} failure:^(NSError *error) {
		failure(error);
	}];
	
}

#pragma mark 退出登录请求：Logout
#pragma
- (void)logout{

	[NetworkManager requestGetURl:Logout_URL withParameters:nil hudShow:YES success:^(id data) {

		NSSLog(@"-----> 退出登录_data = %@",data);
		if ([Common isNotEmpty:data]) {
			UUserDefaults.isLogin = NO; // 退出登录：标志
		}


	} failure:^(NSError *error) {

	}];
}


@end
