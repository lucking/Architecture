//
//  LoginManager.h
//  ZMSingleton
//
//  Created by tangdi on 15/11/4.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "Singleton.h"

@interface LoginManager : Singleton
{
    
}
//创建实例
Singleton_Instance_method_Interface(LoginManager)



/**
 *  登录用户在主线程
 */
@property (nonatomic, strong) NSString *deviceToken;
@property (nonatomic, strong) NSString *token;
@property (nonatomic, assign) BOOL isOnline DEPRECATED_ATTRIBUTE;
/**
 *  用户信息
 */
//@property (nonatomic, retain) NSNumber *userId;			// 标识
@property (nonatomic, readonly) NSString *userId;		// 标识
@property (nonatomic, readonly) NSString *userName;		// 姓名
@property (nonatomic, readonly) NSString *userPwd;		// 登录密码
@property (nonatomic, readonly) NSString *userPhone;	// 手机号
@property (nonatomic, readonly) NSString *userEmail;	// 邮箱
@property (nonatomic, readonly) NSString *userSex;		// 性别
@property (nonatomic, readonly) NSString *userType;		// 类型
@property (nonatomic, readonly) NSString *userImgURLStr;// 头像


/**
 *  用户识别关键。帮助服务器检测到我是谁。登录uid或UUID。
 */
@property (nonatomic, strong, readonly) NSString *userIdentify;

@property (nonatomic, assign) BOOL isLogin; // 是否登录




/**
 *  登录页面
 */
#pragma mark 登录页面
- (void)pushLoginVC;

/**
 *	登录_请求：Login.
 */
#pragma mark 登录请求：Login
- (void)loginWithParameters:params success:(void (^)(id data))success failure:(void (^)(NSError * error))failure;

/**
 *	退出_请求：Logout
 */
#pragma mark 退出登录请求：Logout
- (void)logout;





@end



