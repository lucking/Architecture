//
//  DataHandler.h
//  ZMArchitecture
//
//  Created by tangdi on 16/5/11.
//  Copyright © 2016年 TD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface DataHandler : NSObject


#pragma mark ======================="  数据处理  "=================================

// 返回数据
+ (NSMutableArray *)dataArrayOfPSModel:(Person *)personModel;


@end
