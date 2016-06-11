//
//  OperationFactory.h
//  ZMArchitecture
//
//  Created by tangdi on 16/1/26.
//  Copyright © 2016年 TD. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Operation.h"
//#import "OperationAdd.h"
//#import "OperationSub.h"
//#import "OperationMultiply.h"
//#import "OperationDivide.h"

#import "UIView_Extension.h"


@interface OperationFactory : NSObject
{

}
//获得操作对象
+ (Operation*)createOperate:(NSString*)operateStr;

@end
