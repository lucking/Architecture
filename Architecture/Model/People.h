//
//  People.h
//  ZMArchitecture
//
//  Created by ZM on 16/9/19.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "BaseObject.h"

@interface People : BaseObject

PPropertyString(name);
PPropertyString(age);
PPropertyString(sex);
PPropertyString(salary);

@end
