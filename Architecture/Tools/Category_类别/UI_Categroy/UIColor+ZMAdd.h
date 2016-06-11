//
//  UIColor+ZMAdd.h
//  ZMArchitecture
//
//  Created by tangdi on 16/5/11.
//  Copyright © 2016年 TD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ZMAdd)
{

}
// 计算色值 透明度为1.0
+ (UIColor *)colorWithHex:(NSInteger)rgbValue;

// 计算色值 透明度_自定义
+ (UIColor *)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;


//RGB 颜色转换
+ (UIColor *)colorWithHexString:(NSString *)hexColor;

//将图像转化为颜色对象
+ (UIColor*)colorWithImage:(UIImage*)image;
+ (void)colorWithView:(UIView *)view imageNamed:(NSString *)name;




@end
