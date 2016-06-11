//
//  UIColor+ZMAdd.m
//  ZMArchitecture
//
//  Created by tangdi on 16/5/11.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "UIColor+ZMAdd.h"

@implementation UIColor (ZMAdd)


// 计算色值 透明度为1.0
+ (UIColor*)colorWithHex:(NSInteger)hexValue
{
	return [UIColor colorWithHex:hexValue alpha:1.0];
}

// 计算色值 透明度_自定义
+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
	return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
						   green:((float)((hexValue & 0xFF00) >> 8))/255.0
							blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}


//RGB 颜色转换
+(UIColor *)colorWithHexString:(NSString *)hexColor
{
	unsigned int red,green,blue;
	NSRange range;
	range.length = 2;

	// 取红色的值
	range.location = 0;
	[[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
	// 取绿色
	range.location = 2;
	[[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
	// 取蓝色
	range.location = 4;
	[[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];

	UIColor* color= [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:1.0f];

	return color;
}



//将图像转化为颜色对象
+ (UIColor*)colorWithImage:(UIImage*)image{
	return [UIColor colorWithPatternImage:image];
}
// 用colorWithPatternImage设置view背景色太占内存，替代方法
// 采用了此办法，省了很多多MB内存。
+ (void)colorWithView:(UIView *)view imageNamed:(NSString *)name {

	UIImage *image = [UIImage imageNamed:name];
	view.layer.contents = (id) image.CGImage;
}



@end

