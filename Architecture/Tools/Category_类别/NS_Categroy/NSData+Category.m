//
//  NSData+Category.m
//  ZMArchitecture
//
//  Created by tangdi on 16/1/27.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "NSData+Category.h"
#import "UIImage+ZMAdd.h"

@implementation NSData (Category)

// 测试使用方法
-(void)baseUse {

	UIImage  *image = [UIImage imageNamed:@"Default-568h@2x.png"];
	//保存图片
	[image storageImage:image withImagePath:[self dataFilePath]];
	//读取图片
	//	UIImage* readImage = [self getImageWithPath:[self dataFilePath]];


	// NSData *data = [[NSMutableData alloc] initWithContentsOfFile:[self dataFilePath]];
	// NSLog(@"data = %@ \n \n ",data);


	//1. NSData 与 NSString  字符串与数据
	NSString *aString = @"123456789_abcdefg";

	NSData *data11 = [NSData stringToData:aString];
	NSString* str11= [NSData dataToString:data11];
	NSLog(@"str11 = %@ \n ",str11);


	//2. NSData 与 UIImage  图片与数据
	UIImage *readImage = [UIImage imageWithContentsOfFile:[self dataFilePath]];

	NSData* data22 = [NSData imageToData:readImage];
	UIImage *image22=[NSData dataToImage:data22];
	NSLog(@"image22 = %@ \n ",image22);


	//3.NSData 与 NSDictionary 字典与数据
	NSDictionary *myDic = [NSDictionary dictionaryWithObjectsAndKeys:
							@"balance", @"key",
							@"remaining balance", @"label",
							@"45", @"value",
							@"USD", @"currencyCode",nil];

	NSData *data33 = [NSData dictionaryToData:myDic];
	NSDictionary* dic33 = [NSData dataToDictionary:data33];
	NSLog(@"dic33 = %@ \n ",dic33);

	
}
- (NSString *)dataFilePath{

	NSString *imagePath= [NSHomeDirectory() stringByAppendingPathComponent:@"Default-568h@2x.png"];
	return imagePath;
}


#pragma mark ------------------"  1. NSData 与 NSString  字符串与数据 "---------------------------------
//  NSString－>NSData
+ (NSData *)stringToData:(NSString *)myString {

	NSData *data = [myString dataUsingEncoding:NSUTF8StringEncoding];
	return data;
}
//  NSData－> NSString
+ (NSString *)dataToString:(NSData *)myData {

	NSString *string = [[NSString alloc] initWithData:myData encoding:NSUTF8StringEncoding];
	return string;
}

#pragma mark ------------------"  2. Base64_Str 与 NSString  Base64字符串与字符串 "---------------------
// 将字符串转换成 base64编码
- (NSString*)base64EncodedString: (NSString*)string {

	NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];	// 将字符串转换成二进制数据
	return [data base64EncodedStringWithOptions:0];	// 返回base64编码后的结果
}
// 将base64编码转换成 字符串
- (NSString *)base64DecodeToString:(NSString *)string {
	// 将 base64 编码后的字符串"解码"成二进制数据
	NSData *data = [[NSData alloc] initWithBase64EncodedString:string options:0];
	// 返回字符串解码后的结果
	return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

#pragma mark -----------------"  3. NSData 与 UIImage  图片与数据 "---------------------------------
//  UIImage－> NSData
+ (NSData *)imageToData:(UIImage *)myImage {

	NSData *data= UIImagePNGRepresentation(myImage);// PNG 格式的图片
	return data;
}
//  NSData－>UIImage
+ (UIImage *)dataToImage:(NSData *)myData {

	UIImage*  image= [UIImage imageWithData:myData];
	return image;
}


#pragma mark-----------------"  4.NSData 与 NSDictionary 字典与数据 "---------------------------------

// 利用KeyedArchiver：NSDictionary -> NSData
+ (NSData *)dictionaryToData:(NSDictionary *)myDic
{
	NSMutableData *data = [[NSMutableData alloc] init];
	NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];

	[archiver encodeObject:myDic forKey:@"Some Key Value"];
	[archiver finishEncoding];

	return data;
}
// 利用KeyedUnarchiver：NSData -> NSDictionary
+ (NSDictionary *)dataToDictionary:(NSData *)myData {

	NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:myData];
	NSDictionary *myDictionary = [unarchiver decodeObjectForKey:@"Some Key Value"] ;
	[unarchiver finishDecoding];

	return myDictionary;
}

// 利用JSON：data -> NSDictionary
+ (NSDictionary *)dictionaryWithContentsOfData:(NSData *)myData {
	//获得的json先转换成字符串
	NSString *receiveStr = [[NSString alloc]initWithData:myData encoding:NSUTF8StringEncoding];
	//字符串再生成NSData
	NSData * data = [receiveStr dataUsingEncoding:NSUTF8StringEncoding];
	//再解析
	NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
	//就OK了
	return jsonDict;
}



@end
