//
//  NSString+ZMAdd.h
//  ZMArchitecture
//
//  Created by tangdi on 16/5/12.
//  Copyright © 2016年 TD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZMAdd)
{

}
// 字符串拼接
+ (NSString *)getAandB:(NSString *)A with:(NSString *)B;

// 去掉空格
+ (NSString *)removeStringEmpty:(NSString *)myStr;

// 判断一个字符串里是否包含了另一个字符串: myString是否包含strA
+ (BOOL)isContainStringA:(NSString*)strA withStringB:(NSString*)strB;

// 方法三：判断中文
+ (BOOL)isChineseString:(NSString*)mystring;



#pragma mark //==========================="   计算字符串的尺寸  "===========================

// 计算高度_height：宽度固定
+ (float)getTextSizeHeight:(NSString*)string Font:(UIFont*)myfont Width:(float)width;
// 计算宽度_width：高度固定
+ (float)getTextSizeWidth:(NSString*)string Font:(UIFont*)myfont  Height:(float)height;



#pragma mark //==========================="   Json、Dic  "================================
// json格式字符串转字典：jsonString -> dic
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
// 字典转json格式字符串：dic -> jsonString
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;


#pragma mark //==========================="   URL的编码、解码  "============================
//对URL进行编码
+ (NSString *)encodeToPercentEscapeString: (NSString *)input;
//对URL进行解码
+ (NSString *)decodeFromPercentEscapeString: (NSString *)input;


// 字符串md5加密
+ (NSString *)md5:(NSString *) inPutText;

// 判断是否为空
- (BOOL)isNull:(id)object;

/**
 *  判断字符串是否为空
 *
 *  为空：@return NO
 *  不空：@return YES
 */
- (BOOL)isNotEmpty:(NSString *)object;


/**
 *  根据日期获得是星期几
 *
 *  @param dateStr 要确定的日期字符串
 *  @return 返回的是星期几 注意：周日是1，周一是2
 */
//- (NSInteger)getWeekFromDate:(NSString *)dateStr {
- (NSInteger)getWeekFromDateStr;
//判断字符串是否为空
- (BOOL)isEmpty;
//去掉字符串空格,包括字符串内部空格
- (NSString *)trim;
//转换空字符为 @""
- (NSString *)convertEmpty;


#pragma mark //==========================="   判断字符串  "================================

// 是否全为英文字母
- (BOOL)isAllLetter;

// 是否全为数字
- (BOOL)isAllNum;

// 是否包含数字
- (BOOL)isContainNum;

// 是否包含特殊符号
- (BOOL)isContainSpecialString;

// 是否含有数字 或 特殊字符
- (BOOL)isIllegalString;

//忽略大小写比较字符串是否相等
- (BOOL)isIgnoreCaseEqualsToStr:(NSString *)str;




#pragma mark //==========================="   特殊判断  "================================

// 验证邮箱
+ (BOOL)validateEmail:(NSString *)email;

//1.验证手机号_简单的判断方法
+ (BOOL)validatePhone:(NSString *)phone;
//2.验证手机号_详细的判断方法
+ (BOOL)validateMyPhone:(NSString *)phone;

//身份证识别2 准确
+(BOOL)checkIDCardNum:(NSString*)cardNo;


#pragma mark //==========================="   特殊处理  "================================

// 把钱数改为万为单位
- (NSString *)convertMoneyToTenThousand:(id)money;

// 天数改为年
- (NSString *)convertDaysToYear:(id)days;


// 手机号空格
- (NSMutableString *)getPhoneEmpty:(NSString *)kaostring;

// 银行卡号空格
- (NSMutableString *)getBankNumEmpty:(NSString *)kaostring;

// 隐藏银行卡号中间位数统一显示：前4位后3位
- (NSString *)convertIDCard:(id)idCard;


@end
