//
//  NSObject+ZMAdd.h
//  ZMArchitecture
//
//  Created by tangdi on 16/5/12.
//  Copyright © 2016年 TD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ZMAdd)
{

}
/**
 *  获取属性列表
 */
- (NSArray *)propertyNameList;
/**
 *  获取方法列表
 */
- (NSArray *)methodNameList;
/**
 *  获取成员变量列表
 */
- (NSArray *)ivarNameList;


/**
 *  字典转模型方法
 */
+ (instancetype)objectWithDict:(NSDictionary *)dict;
// 返回类的属性列表
+ (NSArray *)propertyList;


@end
