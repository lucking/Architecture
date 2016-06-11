//
//  Operation.h
//  ZMArchitecture
//
//  Created by tangdi on 16/1/26.
//  Copyright © 2016年 TD. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 *  操作方法协议接口
 */
@protocol OperationProtocol <NSObject>
- (double)getResult;
@end

/*
 *  操作方法父类
 */
@interface Operation : NSObject <OperationProtocol>
{

}
@property double firstNum;	//第一个操作数
@property double secondNum;	//第二个操作数

@end



/**
 *  OperationAdd
	OperationSub
	OperationMultiply
	OperationDivide
 */

/*
 *  加法实现类
 */
@interface OperationAdd : Operation

@end


/*
 *  减法实现类
 */
@interface OperationSub : Operation

@end


/*
 *  乘法实现类
 */
@interface OperationMultiply : Operation

@end


/*
 *  除法实现类
 */
@interface OperationDivide : Operation

@end






