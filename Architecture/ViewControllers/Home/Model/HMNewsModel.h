//
//  HMNewsModel.h
//  ZMArchitecture
//
//  Created by ZM on 16/5/24.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "BaseObject.h"

@interface HMNewsModel : BaseObject

PPropertyString(retFlag); //请求是否正确
PPropertyString(retCode); //反馈码
PPropertyString(retMsg);  //返回信息

PPropertyMutArray(newsList);
@end



@interface NewsListModel : BaseObject

PPropertyString(newsId);		// 新闻编号
PPropertyString(newsTitle);	// 新闻标题
PPropertyString(newsImgUrl);	// 新闻广告图地址
@end