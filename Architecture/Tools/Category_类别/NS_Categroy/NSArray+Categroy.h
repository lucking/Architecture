//
//  NSArray+Categroy.h
//  ZMArchitecture
//
//  Created by tangdi on 16/1/6.
//  Copyright © 2016年 TD. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (Categroy)
{

}
- (NSString *)descriptionWithLocale:(id)locale;

#pragma mark  方法一：从小到大
+ (NSArray *)sortedArrayUseComparator:(NSArray *)myArray;

#pragma mark  方法二：从小到大
+ (NSArray *)sortedArrayUseFunction:(NSArray *)myArray;

#pragma mark  利用属性排序
+ (NSArray *)sortedArrayUseDescriptor:(NSArray *)myArray sortWithKey:(NSString *)myKey;


////选择排序
//-(void)selectSortWithArray:(NSArray *)aData;
////插入排序
//-(void)insertSortWithArray:(NSArray *)aData;
////快速排序
//-(void)quickSortWithArray:(NSArray *)aData;
//
//-(void)swapWithData:(NSMutableArray *)aData index1:(NSInteger)index1 index2:(NSInteger)index2;





@end
