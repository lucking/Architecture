//
//  HMAdModel.h
//  ZMArchitecture
//
//  Created by ZM on 16/5/24.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "BaseObject.h"

@interface HMAdModel : BaseObject

//@property (nonatomic,copy, readonly) NSString *Name;
//@property (nonatomic,assign,readonly) NSInteger age;

PProperty(imgURL);      //图片网址
PProperty(imgName);     //图片名称
PProperty(imgWidth);    //宽度
PProperty(imgHeight);   //高度
/**
 *  ......
 */

@end
