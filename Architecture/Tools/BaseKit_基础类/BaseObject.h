//
//  BaseObject.h
//  HuiFang
//
//  Created by tangdi on 15/12/25.
//  Copyright © 2015年 TD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

// 类
#define PPropertyObject(NSObject,object)	@property (nonatomic, strong) NSObject* object

// NSString：字符串
#define PPropertyString(string)             @property (nonatomic, copy) NSString* string
// NSNumber：数类
#define PPropertyNumber(_number)			@property (nonatomic, assign) NSNumber *_number
// CGFloat：浮点数
#define PPropertyFloat(_float)				@property (nonatomic, assign) CGFloat *_float
// BOOL
#define PPropertyBOOL(_bool)                @property (nonatomic, assign) BOOL _bool

// NSArray
#define PPropertyArray(Array)				@property (nonatomic, strong) NSArray *Array
// NSMutableArray
#define PPropertyMutArray(mutArray)			@property (nonatomic, strong) NSMutableArray *mutArray


@interface BaseObject : NSObject
{

}


@end
