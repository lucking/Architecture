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

// NSArray
#define PPropertyArray(Array)				@property (nonatomic, strong) NSArray *Array
// NSMutableArray
#define PPropertyMutArray(mutArray)			@property (nonatomic, strong) NSMutableArray *mutArray
// NSString：字符串
#define PPropertyString(string)					@property (nonatomic, copy) NSString* string
// NSNumber：类
#define PPropertyNumber(_number)			@property (nonatomic, assign) NSNumber *_number
// CGFloat
#define PPropertyFloat(_float)				@property (nonatomic, assign) CGFloat *_float


@interface BaseObject : NSObject
{

}



@end
