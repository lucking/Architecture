//
//  NSData+Category.h
//  ZMArchitecture
//
//  Created by tangdi on 16/1/27.
//  Copyright © 2016年 TD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Category)


#pragma mark ----------------"  1. NSData 与 NSString  字符串与数据 "---------------------------------
//  NSString－>NSData
+ (NSData *)stringToData:(NSString *)myString;
//  NSData－> NSString
+ (NSString *)dataToString:(NSData *)myData;


#pragma mark ----------------"  2. Base64_Str 与 NSString  Base64字符串与字符串 "---------------------
// 将字符串转换成 base64编码
- (NSString*)base64EncodedString: (NSString*)string;
// 将base64编码转换成 字符串
- (NSString *)base64DecodeToString:(NSString *)string;


#pragma mark ----------------"  3. NSData 与 UIImage  图片与数据 "---------------------------------
//  UIImage－> NSData
+ (NSData *)imageToData:(UIImage *)myImage;
//  NSData－>UIImage
+ (UIImage *)dataToImage:(NSData *)myData;


#pragma mark-----------------"  4.NSData 与 NSDictionary 字典与数据 "---------------------------------
// 序列化（KeyedArchiver）、反序列化（KeyedUnarchiver）
// 利用KAC：NSDictionary -> NSData
+ (NSData *)dictionaryToData:(NSDictionary *)myDic;
// 利用KNC：NSData -> NSDictionary
+ (NSDictionary *)dataToDictionary:(NSData *)myData;

// 利用JSON：data -> NSDictionary
+ (NSDictionary *)dictionaryWithContentsOfData:(NSData *)myData;




@end
