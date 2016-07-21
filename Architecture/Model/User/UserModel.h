//
//  UserModel.h
//  ZMArchitecture
//
//  Created by tangdi on 16/5/10.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "BaseObject.h"

@interface UserModel : BaseObject
{

}
PPropertyString(custId);		// 用户id
PPropertyString(custName);	// 用户名
PPropertyString(custPwd);		// 密码
PPropertyString(custPhone);	// 手机号
PPropertyString(custMail);	// 邮箱

PPropertyString(custPortriat);// 头像
PPropertyString(userType);		// 部门
PPropertyString(custGender);	// 性别
PPropertyString(custPosition);// 职位


@end
