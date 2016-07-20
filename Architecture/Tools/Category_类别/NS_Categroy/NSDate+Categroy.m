//
//  NSDate+Categroy.m
//  HuiFang
//
//  Created by tangdi on 16/1/3.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "NSDate+Categroy.h"

@implementation NSDate (Categroy)


//======================="  日期和时间  "=================================

// 获取当前日期
+(NSString*)getCurrentDateString
{
	NSDate * currentDate=[NSDate date];
	NSDateFormatter *dateFM=[[NSDateFormatter alloc]init];  // 时间格式器
	[dateFM setDateFormat:@"yyyy-MM-dd"];                   // 设置时间的格式
	NSString *getDate=[dateFM stringFromDate:currentDate];

	return getDate;
}

// 获取与当前日期 相差的日期
+(NSString*)getDateSetYear:(NSInteger)year SetMonth:(NSInteger)month SetDay:(NSInteger)day
{
	//设置你需要增加或减少的年、月、日即可获得新的日期，上述的表示获取mydate日期前一个月的日期，
	//如果该成+1，则是一个月以后的日期，以此类推都可以计算。
	NSDate * currentDate = [NSDate date];
	NSCalendar *calendar= [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	//
	NSDateComponents *comps = nil;
	comps= [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:currentDate];
	//
	NSDateComponents *adcomps= [[NSDateComponents alloc] init];
	[adcomps setYear:year];    //年份
	[adcomps setMonth:month];  //月份
	[adcomps setDay:day];      //日份
	NSDate *newDate= [calendar dateByAddingComponents:adcomps toDate:currentDate options:0];
	// NSLog(@"--->newDate     :%@", newDate);
	NSDateFormatter *dateFM=[[NSDateFormatter alloc]init];
	[dateFM setDateFormat:@"yyyy-MM-dd"];
	NSString *getDate=[dateFM stringFromDate:newDate];

	return getDate;
}

// 日期间隔1天
+ (NSDate *)dateForGraphAfterDate:(NSDate *)date
{
	NSTimeInterval secondsInTwentyFourHours = 24 * 3600;
	NSDate *newDate= [date dateByAddingTimeInterval:secondsInTwentyFourHours];
	return newDate;
}
// 对时间进行格式化
/**
 *  MM/dd				 07/01
 *  yyyy-MM-dd			 2015-07-01
 *  HH:mm:ss			 17:30:40
 *  yyyy-MM-dd HH:mm:ss  2015-07-01 17:30:40
 */
+ (NSString *)dateFormatWithDate:(NSDate*)date dateFormatStatus:(DateFormatStatus)state {

	NSDateFormatter *df= [[NSDateFormatter alloc] init];
	 // 设置时间的格式
	if (state == DFstatusMMdd) {					df.dateFormat = @"MM/dd";
	}else if (state == DFstatusYYYYMMdd) {			df.dateFormat = @"yyyy-MM-dd";
	}else if (state == DFstatusHHmmss ) {			df.dateFormat = @"HH:mm:ss";
	}else if (state == DFstatusYYYYMMddHHmmss ) {	df.dateFormat = @"yyyy-MM-dd HH:mm:ss";
	}
	NSString *getDate= [df stringFromDate:date];
	return getDate;
}




// 1.保存时间: 当前时间、24小时后的时间
+(void)createCurrentDateAndOneDay
{
	//NSDate生成:
	NSDate *date1 = [NSDate date];
	NSDate *date2 = [[NSDate alloc] initWithTimeIntervalSinceNow:24*3600];
	//    NSLog(@"---> date1：%@",date1);
	//    NSLog(@"---> date2：%@ \n ",date2);

	[UserDefaults storageObject:date1 Key:@"date1"];
	[UserDefaults storageObject:date2 Key:@"date2"];
}


// 2.判断时间大小、相同
+(NSString*)compareOneDay:(NSDate *)Date1 withAnotherDay:(NSDate *)Date2
{
	NSDateFormatter *dateFM = [[NSDateFormatter alloc] init];
	[dateFM setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSString *date11 = [dateFM stringFromDate:Date1];//date   To  string
	NSString *date22 = [dateFM stringFromDate:Date2];

	NSDate *dateA = [dateFM dateFromString:date11];  //string To  date
	NSDate *dateB = [dateFM dateFromString:date22];
	NSComparisonResult result = [dateA compare:dateB];

	if (result == NSOrderedAscending){
		return @"-1";   //dateA 是过去的时间
	}
	else if (result == NSOrderedDescending) {
		return @"+1";   //dateA 是未来的时间
	}
	return @"0";        // 两者时间相同
}
#pragma mark 3.判断时间是否相同
+(BOOL)isEqualDate1:(NSDate *)Date1 WithDate2:(NSDate *)Date2
{
	//是否相同日期:
	if ([Date1 isEqualToDate: Date2]) {
		return YES;
	}else{
		return NO;
	}
}

// 时间戳 转换为 日期时间
+ (NSString *)changeToStandardTime:(NSTimeInterval)timeInterval
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *time = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:timeInterval]];
    return time;
}


@end






