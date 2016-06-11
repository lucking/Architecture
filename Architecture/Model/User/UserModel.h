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
PProperty(custId);		// 用户id
PProperty(custName);	// 用户名
PProperty(custPwd);		// 密码
PProperty(custPhone);	// 手机号
PProperty(custMail);	// 邮箱

PProperty(custPortriat);// 头像
PProperty(userType);		// 部门
PProperty(custGender);	// 性别
PProperty(custPosition);// 职位


@end
