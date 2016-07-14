//
//  Common.h
//  ZM_BaseViewController
//
//  Created by tangdi on 15/6/12.
//  Copyright (c) 2015年 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>//字间距 使用
#import <sys/sysctl.h>//系统参数 使用
#import "BaseHeader.h"
#import "UIWindow+ZMAdd.h"
#import "LoginViewController.h"

#import "AppDelegate.h"

// 验证邮箱、手机号、身份证、qq
typedef enum{
	VALIDATE_CHECK_EMAIL    =1,
	VALIDATE_CHECK_QQ       =2,
	VALIDATE_CHECK_MOBILE   =3,
	VALIDATE_CHECK_PASSWORD =4,
}VALIDATE_CHECK;


@interface Common : NSObject



//======================="  特殊判断  "=================================

#pragma mark 判断登录密码格式
+ (BOOL)isCharAndNumber:(NSString*)mystring;//只能由8～18数字和字符混合组


#pragma mark //==================="   验证邮箱、手机号、身份证、qq，银行卡、手机号处理   "=======================

//验证邮箱、手机号、身份证、qq
+(BOOL)validateCheck:(NSString *)str stringType:(VALIDATE_CHECK)type;

// 验证邮箱
+ (BOOL)validateEmail:(NSString *)email;

//1.验证手机号_简单的判断方法
+ (BOOL)validatePhone:(NSString *)phone;
//2.验证手机号_详细的判断方法

//身份证识别2 准确
+(BOOL)checkIDCardNum:(NSString*)cardNo;



#pragma mark //==========================="   label   "================================
// 计算字符串的尺寸
//获取高度_height
+ (float)getTextSizeHeight:(NSString*)string Font:(UIFont*)myfont Width:(float)width;
//获取宽度_width
+ (float)getTextSizeWidth:(NSString*)string Font:(UIFont*)myfont  Height:(float)height;


//改变一种字体大小
+ (void)changeTextFontLab:(UILabel *)myLabel text:(NSString *)text font:(UIFont *)font;

//此方法同时只能添加一次 NSMutableAttributedString 改变一种颜色
+ (void)changeTextColorLab:(UILabel *)myLabel text:(NSString *)text color:(UIColor *)color;

//改变文本的 两种颜色
+ (void)changeTextColorLab:(UILabel *)myLabel textA:(NSString *)textA  colorA:(UIColor *)colorA  textB:(NSString *)textB  color:(UIColor *)colorB;
//改变文本的 一种颜色、字体大小
+ (void)changeTextColorAndFontLab:(UILabel *)myLabel text:(NSString *)text color:(UIColor *)color font:(float)font;
//改变label分割开的字符 为一种颜色
+ (void)changeTextColorLab:(UILabel *)myLabel color:(UIColor *)myColor;

//给一段文本，添加下划线、改变颜色
+ (void)addUnderlineToLab:(UILabel *)myLabel withText:(NSString *)text color:(UIColor *)myColor;

//字间距：UILabel
+ (void)characterSpaceLabel:(UILabel *)mylabel Space:(long)mySpaceNum;
//字间距：UITextField
+ (void)characterSpaceTextField:(UITextField *)mytextField Space:(long)mySpaceNum;


//字体：STHeitiSC-Light
+ (UIFont *)fontOfSize:(CGFloat)fontSize;



#pragma mark //==========================="   UIButton   "================================
//UIButton：给一段文本，添加下划线、改变颜色
+ (void)addUnderlineToButton:(UIButton *)myBtn withText:(NSString *)text color:(UIColor *)myColor;




#pragma mark //==========================="   AlertView、AlertController   "================================

#pragma mark - AlertView
//- (void)showAlertMessage:(NSString *)message;

#pragma mark - AlertController
+ (void)showAlertTitle:(NSString *)titlet message:(NSString *)message okTitle:(NSString *)okTitle cancelTitle:(NSString *)cancelTitle okAction:(void (^)(void))okActe cancelAction:(void (^)(void))cancelActe completion:(void (^)(void))complete;




#pragma mark //==========================="   系统   "================================

#pragma mark 获取当前系统的版本号
+ (NSString *)getCFBundleVersion;
#pragma mark 获取系统配置文件
+ (NSDictionary *)getInfoDictionary;
#pragma mark 获取系统：appID
+ (NSString *)getInfoCFBundleId;



#pragma mark //==========================="   空数据处理   "================================
// 判断是否为空
+(BOOL)isNull:(id)object;
// 判断字符串是否为空
+ (BOOL)isNotEmpty:(NSString *)object;
// 转换为空串
+(NSString*)convertNull:(id)object;
// 转换为 --
+(NSString*)convertBridge:(id)object;
// 转换空串 金额
+(NSString*)convertNulltoMoney:(id)object;

#pragma mark //==========================="   getURl 验证签名：密钥加密  "================================
// 字典不排序_拼接url
+ (NSString *)getURlStringOfIP:(NSString *)url params:(NSDictionary *)params;
// 字典排序_拼接url
+ (NSString *)getURlStringOfIP:(NSString *)url sortParams:(NSDictionary *)params;
// 验证签名：密钥加密
+ (NSString *)getSign:(NSDictionary *)params;
// 转变为json数据格式：params 传参
+ (NSDictionary *)JsonParameters:(NSDictionary *)params;


#pragma mark //==========================="   动画   "================================
// 导航视图 动画
+(void)pushViewController:(UIViewController *)nav;
// 普通动画
+(void)flipView:(UIView *)myView Rect:(CGRect)myRect forView:(UIView *)view timeInterval:(NSTimeInterval)myTime;


// 判断手机型号
+ (NSString *)ISIPHONEXX;
// 判断屏幕类型，普通还是视网膜
+ (float)scale;
// 判断是否是模拟器
+ (BOOL)isSimulator;

#pragma mark //==========================="   UIViewController   "================================

//获取当前屏幕显示的viewcontroller
//+ (UIViewController *)getCurrentViewController;

//
+ (UIViewController *)getCurrentVC;

@end

