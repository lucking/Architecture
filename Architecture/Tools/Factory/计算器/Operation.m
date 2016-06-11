//
//  Operation.m
//  ZMArchitecture
//
//  Created by tangdi on 16/1/26.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "Operation.h"



@implementation Operation

-(double)getResult
{
	double result = 0;
	return result;
}
@end


/**
 *  #import OperationAdd
	#import OperationSub
	#import OperationMultiply
	#import OperationDivide
 */
/*
 *  加法类
 */
@implementation OperationAdd

-(double)getResult
{
	double result = 0;
	result = self.firstNum + self.secondNum;	//"+"是OperationAdd时候使用，"+-*/"分别对应"加减乘除"
	return result;
}
@end


/*
 *  减法类
 */
@implementation OperationSub

-(double)getResult
{
	double result = 0;
	result = self.firstNum - self.secondNum;	//"-"
	return result;
}
@end


/*
 *  乘法类
 */
@implementation OperationMultiply

-(double)getResult
{
	double result = 0;
	result = self.firstNum * self.secondNum;	//"*"
	return result;
}
@end


/*
 *  除法类
 */
@implementation OperationDivide

-(double)getResult
{
	double result = 0;
	//判断除数不能为0
	if (self.firstNum == 0) {
		NSLog(@"除数不能为0");
		AlertView1(@"除数不能为0");
	}else{
		result = self.firstNum / self.secondNum;//"/"
	}
	return result;
}
@end



