//
//  MacroHeader.h
//  ZMFramework
//
//  Created by tangdi on 15/11/11.
//  Copyright © 2015年 ZM. All rights reserved.
//

#ifndef MacroHeader_h
#define MacroHeader_h


/**
 *  格式化 数据类型
 */

#define  NNSStringInt(myInt)		[NSString stringWithFormat:@"%d",myInt]		// Int
#define  NNSStringFloat(myFloat)	[NSString stringWithFormat:@"%f",myFloat]	// Float
#define  NNSString2Float(myFloat)	[NSString stringWithFormat:@".2%f",myFloat]	// Float：保留两位小数

#define  NNSString(string)		[NSString stringWithFormat:@"%@",string]		// 1个NSString
#define  NNStringAB(AA,BB)		[NSString stringWithFormat:@"%@%@",AA,BB]		// 2个NSString 拼接
#define  NNStringABC(AA,BB,CC)	[NSString stringWithFormat:@"%@%@%@",AA,BB,CC]	// 3个NSString 拼接



/**
 *  判断字符串是否相等
 */
#define   IsEqual(AA,BB)   [AA isEqualToString:BB]


// 判断空字符串
#define Empty_Str(param)            (nil == param || param.length < 1)





//--------"  AlertView  "-----------

#define     AlertView(mmessage)    UIAlertView* AlertView =  [[UIAlertView alloc]initWithTitle:@"温馨提示" message:mmessage delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];\
[AlertView show]

#define     AlertView1(mmessage)      [[UIAlertView alloc]initWithTitle:@"警告" message:mmessage delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil]



#define     AlertViewDelegate(mmessage)    UIAlertView* AlertView =  [[UIAlertView alloc]initWithTitle:@"温馨提示" message:mmessage delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];\
[AlertView show]


#define     AlertViewDelegateTagOkCancel(_message,_tag)    UIAlertView* alertView =  [[UIAlertView alloc]initWithTitle:@"温馨提示" message:_message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];\
alertView.tag = _tag;\
[alertView show]


#define     AlertViewDelegateTagOK(_message,_tag)    UIAlertView* alertView =  [[UIAlertView alloc]initWithTitle:@"温馨提示" message:_message delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];\
alertView.tag = _tag;\
[alertView show]




#define     AlertViewError(mmessage)    UIAlertView* AlertView =  [[UIAlertView alloc]initWithTitle:@"错误提示" message:mmessage delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];\
[AlertView show]




// 试题4：为什么标准头文件都有类似以下的结构？

#ifndef __INCvxWorksh
#define __INCvxWorksh
#ifdef __cplusplus

extern "C" {
#endif
	/*...*/
#ifdef __cplusplus
}

#endif
#endif /* __INCvxWorksh */





#endif /* MacroHeader_h */

