//
//  NSDate+Categroy.h
//  HuiFang
//
//  Created by tangdi on 16/1/3.
//  Copyright © 2016年 TD. All rights reserved.
//

#import <Foundation/Foundation.h>


/// 时间格式 yyyy-MM-dd HH:mm:ss
typedef NS_ENUM(NSInteger,DateFormatStatus) {
	DFstatusMMdd			= 0,	// 月日			MM/dd
	DFstatusYYYYMMdd		= 1,	// 年月日			yyyy-MM-dd
	DFstatusHHmmss			= 2,	// 时分秒			HH:mm:ss
	DFstatusYYYYMMddHHmmss	= 3,	// 年月日时分秒	yyyy-MM-dd HH:mm:ss
};

@interface NSDate (Categroy)
{

}

//=========================="  日期  "========================
// 获取当前日期
+(NSString*)getCurrentDateString;

// 获取与当前日期 相差的日期
+(NSString*)getDateSetYear:(NSInteger)year SetMonth:(NSInteger)month SetDay:(NSInteger)day;

// 日期间隔1天
+ (NSDate *)dateForGraphAfterDate:(NSDate *)date;
// 对时间进行格式化
+ (NSString *)dateFormatWithDate:(NSDate*)date dateFormatStatus:(DateFormatStatus)state;



// 1.保存时间: 当前时间、24小时后的时间
+(void)createCurrentDateAndOneDay;

// 2.判断时间大小
+(NSString*)compareOneDay:(NSDate *)Date1 withAnotherDay:(NSDate *)Date2;

// 3.判断时间是否相同
+(BOOL)isEqualDate1:(NSDate *)Date1 WithDate2:(NSDate *)Date2;




@end
