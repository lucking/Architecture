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
PProperty(firstName);	// 姓名
PProperty(lastName);	// 姓名
PProperty(age);			// 年龄
PProperty(month);		// 月份


@property (nonatomic,weak) NSString* name;


@end
