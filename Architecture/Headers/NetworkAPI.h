//
//  NetworkAPI.h
//  ZMFramework
//
//  Created by tangdi on 15/11/11.
//  Copyright © 2015年 ZM. All rights reserved.
//

#ifndef NetworkAPI_h
#define NetworkAPI_h


#pragma mark ======================="  网络请求_异常处理  "=========================
// 请求超时
#define LocalError_timedOut		@"The request timed out."

// 无法连接到服务器
#define LocalError_notConnect	@"Could not connect to the server."

// 数据无法读取,因为它不在正确的格式
#define LocalError_notRead		@"The data couldn’t be read because it isn’t in the correct format."

// 没有网络的错误码
#define WithoutNetworkErrorCode		1001




#pragma mark ======================="  IP 环境  "=========================
/**
 *  IP 环境
 */
// 测试：网易新闻
#define  WangYi_API_URL		@"http://c.m.163.com/"
#define	 WangYi_URlstr      @"/nc/article/headline/T1348647853363/0-20.html"

//投资项目列表
#define     AppFinance		@"/appFinance.do"
//广告
#define     AdList          @"/appAdList.do"
//新闻资讯列表查询
#define     News_URl        @"/MP0006.json"



//陈阳
#define  API_URL			@"http://192.168.0.17:8080/MPWEB"
//获取验证码
#define		SmsCode         @"user/smsCode.json"
// 注册
#define		Register		@"/auth/register.do"
// 登录
#define		Login_URL	    @"/login.json"
// 退出登录
#define		Logout_URL		@"/auth/logout.do"





#endif /* NetworkAPI_h */
