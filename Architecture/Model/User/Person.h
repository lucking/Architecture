//
//  Person.h
//  ZMArchitecture
//
//  Created by tangdi on 16/1/20.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "BaseObject.h"

@interface Person : BaseObject
{

}
PPropertyString(firstName);	// 姓名
PPropertyString(lastName);	// 姓名
PPropertyString(age);			// 年龄
PPropertyString(month);		// 月份


@property (nonatomic,weak) NSString* name;


@end
