//
//  HMNewsModel.h
//  ZMArchitecture
//
//  Created by ZM on 16/5/24.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "BaseObject.h"

@interface HMNewsModel : BaseObject

PProperty(retFlag); //请求是否正确
PProperty(retCode); //反馈码
PProperty(retMsg);  //返回信息

PPropertyMutArray(newsList);
@end



@interface NewsListModel : BaseObject

PProperty(newsId);		// 新闻编号
PProperty(newsTitle);	// 新闻标题
PProperty(newsImgUrl);	// 新闻广告图地址
@end