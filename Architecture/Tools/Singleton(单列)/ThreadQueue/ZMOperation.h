//
//  ZMOperation.h
//  ZMArchitecture
//
//  Created by tangdi on 16/1/7.
//  Copyright © 2016年 TD. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  代理协议
 */
@protocol ZMOperationDelegate <NSObject>

- (void)ZMOperation:(id)object;

@end



@interface ZMOperation : NSOperation
{

}
//创建实例
Singleton_Instance_method_Interface(ZMOperation)


@property (nonatomic,strong) id<ZMOperationDelegate> delegate;

@property (nonatomic,strong)  NSDictionary* operatDic;



@end
