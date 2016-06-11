//
//  NSArray+Categroy.m
//  ZMArchitecture
//
//  Created by tangdi on 16/1/6.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "NSArray+Categroy.h"

@implementation NSArray (Categroy)


- (void)testArray {

	NSArray* sortArray = [[NSArray alloc] initWithObjects:@"1",@"3",@"4",@"7",@"8",@"2",@"6",@"5",@"37",@"9",@"12",@"16",@"88",@"25",@"",nil];

	NSMutableArray* mmutArray = [[NSMutableArray alloc] initWithCapacity:10000];

	NSLogline(@"方法五:");
	//NSEnumerationReverse：反向遍历 (倒序排列)
	[sortArray enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {

		// NSLog(@"idx=%lu, id= %@", (unsigned long)idx, obj);
		[mmutArray addObject:obj];
	}];
	NSSLog(@"反向遍历_mutArray = %@",mmutArray);


	//倒序排列_array
	mmutArray = (NSMutableArray *)[[mmutArray reverseObjectEnumerator] allObjects];
	NSSLog(@"倒序排列_array = %@",mmutArray);

	//	[mutArray sortedArrayUsingSelector:<#(nonnull SEL)#>]
	
}

- (NSString *)descriptionWithLocale:(id)locale
{
	NSMutableString *mustr = [NSMutableString string];
	[mustr appendString:@"(\n"];
	[self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		if (idx < self.count -1) {
			[ mustr appendFormat:@"\t%@,\n",obj];
		}else{
			[ mustr appendFormat:@"\t%@\n",obj];
		}
	}];
	[mustr appendString:@")"];
	return mustr;
}



#pragma mark  ======================="  Function  "=================================

#pragma 第一种 排序方法：利用数组的sortedArrayUsingComparator调用 NSComparator ，obj1和obj2指的数组中的对象

NSComparator cmptor_Function = ^(id obj1, id obj2){

	if ([obj1 integerValue] > [obj2 integerValue]) {
		return (NSComparisonResult)NSOrderedDescending; //递减
	}
	if ([obj1 integerValue] < [obj2 integerValue]) {
		return (NSComparisonResult)NSOrderedAscending;  //递升
	}
	return (NSComparisonResult)NSOrderedSame;			//相同
};

#pragma 第二种 排序方法：利用sortedArrayUsingFunction 调用 对应方法customSort，这个方法中的obj1和obj2分别是指数组中的对象

NSInteger IntSort_Function (id obj1, id obj2,void* context) { // NSInteger (*)(ObjectType, ObjectType, void * __nullable)

	if ([obj1 integerValue] > [obj2 integerValue]) {
		return (NSComparisonResult)NSOrderedDescending;
	}
	if ([obj1 integerValue] < [obj2 integerValue]) {
		return (NSComparisonResult)NSOrderedAscending;
	}
	return (NSComparisonResult)NSOrderedSame;
};



//方法一： 从小到大
/**
 *  从小到大：利用sortedArrayUsingComparator
 *
 *  @return mutArray
 */
+ (NSArray *)sortedArrayUseComparator:(NSArray *)myArray {

	NSArray *array = [myArray sortedArrayUsingComparator:cmptor_Function]; //排序

	NSMutableArray* mutArray = [[NSMutableArray alloc] init];
	[array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

		[mutArray addObject:obj];
	}];
	return mutArray;
}
//方法二：从小到大
/**
 *  利用sortedArrayUsingFunction
 *
 *  @return mutArray
 */
+ (NSArray *)sortedArrayUseFunction:(NSArray *)myArray
{
	NSArray *array = [myArray sortedArrayUsingFunction:IntSort_Function context:nil]; //排序

	NSMutableArray* mutArray = [[NSMutableArray alloc] init];
	[array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

		[mutArray addObject:obj];
	}];
	return mutArray;
}
// 利用属性排序
/**
 *  利用sortUsingDescriptors调用 NSSortDescriptor
 *
 *  其中，price为数组中的对象的属性，这个针对数组中存放对象比较更简洁方便
 *
 *	ascending: YES（递升）  NO（递减）
 *
 *  @return Array
 */
+ (NSArray *)sortedArrayUseDescriptor:(NSArray *)myArray sortWithKey:(NSString *)myKey
{
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"price" ascending:YES];

	NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];

	NSArray *afterArray = [myArray sortedArrayUsingDescriptors:sortDescriptors];
	NSLog(@"--->排序后_afterArray = %@",afterArray);
	return afterArray;
	// NSArray *sortDescript = [[NSArray alloc] initWithObjects:&sortDescriptor count:1];
}


//=========================="    "=================================

-(void)selectSortWithArray:(NSArray *)aData{
	NSMutableArray *data = [[NSMutableArray alloc]initWithArray:aData];
	for (int i=0; i<[data count]-1; i++) {
		int m =i;
		for (int j =i+1; j<[data count]; j++) {
			if ([data objectAtIndex:j] < [data objectAtIndex:m]) {
				m = j;
			}
		}
		if (m != i) {
			[self swapWithData:data index1:m index2:i];
		}
	}
	NSLog(@"选择排序后的结果：%@",[data description]);
//	[data release];
}

-(void)insertSortWithArray:(NSArray *)aData{
	NSMutableArray *data = [[NSMutableArray alloc]initWithArray:aData];
	for (int i = 1; i < [data count]; i++) {
		id tmp = [data objectAtIndex:i];
		int j = i-1;
		while (j != -1 && [data objectAtIndex:j] > tmp) {
			[data replaceObjectAtIndex:j+1 withObject:[data objectAtIndex:j]];
			j--;
		}
		[data replaceObjectAtIndex:j+1 withObject:tmp];
	}
	NSLog(@"插入排序后的结果：%@",[data description]);
//	[data release];
}

-(void)quickSortWithArray:(NSArray *)aData{
	NSMutableArray *data = [[NSMutableArray alloc] initWithArray:aData];
	[self quickSortWithArray:data left:0 right:[aData count]-1];
	NSLog(@"快速排序后的结果：%@",[data description]);
//	[data release];

}

-(void)quickSortWithArray:(NSMutableArray *)aData left:(NSInteger)left right:(NSInteger)right{
	if (right > left) {
		NSInteger i = left;
		NSInteger j = right + 1;
		while (true) {
			while (i+1 < [aData count] && [aData objectAtIndex:++i] < [aData objectAtIndex:left]) ;
			while (j-1 > -1 && [aData objectAtIndex:--j] > [aData objectAtIndex:left]) ;
			if (i >= j) {
				break;
			}
			[self swapWithData:aData index1:i index2:j];
		}
		[self swapWithData:aData index1:left index2:j];
		[self quickSortWithArray:aData left:left right:j-1];
		[self quickSortWithArray:aData left:j+1 right:right];
	}
}

-(void)swapWithData:(NSMutableArray *)aData index1:(NSInteger)index1 index2:(NSInteger)index2{
	NSNumber *tmp = [aData objectAtIndex:index1];
	[aData replaceObjectAtIndex:index1 withObject:[aData objectAtIndex:index2]];
	[aData replaceObjectAtIndex:index2 withObject:tmp];
}



@end
