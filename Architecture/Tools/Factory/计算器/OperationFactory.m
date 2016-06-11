//
//  OperationFactory.m
//  ZMArchitecture
//
//  Created by tangdi on 16/1/26.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "OperationFactory.h"

@implementation OperationFactory

/**
 *  根据不同的操作符，创建不同的操作对象，"+-*／ "分别对应"加减乘除"
 *
 *  @param operateStr + - * ／
 *
 *  @return 返回：计算类对象
 */
+ (Operation*)createOperate:(NSString*)operateStr
{
	Operation* oper = nil;

	if ([operateStr isEqualToString:@"+"]) {
		oper = [[OperationAdd alloc] init];

	}else if ([operateStr isEqualToString:@"-"]){
		oper = [[OperationSub alloc] init];

	}else if ([operateStr isEqualToString:@"*"]){
		oper = [[OperationMultiply alloc] init];
		
	}else if ([operateStr isEqualToString:@"/"]){
		oper = [[OperationDivide alloc] init];
	}
	return oper;
}


@end
