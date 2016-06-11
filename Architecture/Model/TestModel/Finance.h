//
//  Finance.h
//  ZMArchitecture
//
//  Created by tangdi on 16/2/29.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "BaseObject.h"

@class PageBean;
@class Page;

@interface Finance : BaseObject

PProperty(retCode);      //返回码
PProperty(retFlag);      //返回正确、错误的标志
PProperty(retMsg);       //返回信息
//PPropertyObject(Finance, finance);//可用也可不用

//模型：mapLogo
PPropertyMutArray(mapLogo);
//模型：provinceList
PPropertyMutArray(provinceList);
//模型：PageBean
PPropertyObject(PageBean, pageBean);
//模型：Page
//PPropertyMutArray(pageArray);

#pragma mark -首页产品
+ (void)getFinance:(NSDictionary *)params success:(void (^)(id data,NSMutableArray* mutArray))successHandle failure:(void (^)(NSError *error))failureHandle;

#pragma mark -首页产品：返回数组
+ (void)getFinanceParams:(NSDictionary *)params success:(void (^)(NSMutableArray* Arr11, NSMutableArray* Arr22, NSMutableArray* Arr33))successHandle failure:(void (^)(NSError *error))failureHandle;

@end


//------------------  新类：MapLogo   ------------------
@interface MapLogo : BaseObject

PProperty(borrow_type);
PProperty(details);
PProperty(ID); //id
PProperty(imagpath);
PProperty(mark);
PProperty(name);
PProperty(nid);
PProperty(status);
@end

//------------------  新类：PageBean   ------------------
@interface PageBean : BaseObject

PProperty(pageNum);
PProperty(pageSize);
PProperty(startOfPage);
PProperty(totalNum);
PProperty(totalPageNum);
/**
 *  里面是Page模型
 */
@property (strong, nonatomic) NSMutableArray *page;//不可以写成这个样子 pageArray，必须和请求的数据数组一致
@end

//------------------  新类：Page   ------------------
@interface Page : BaseObject

PProperty(annualRate);
PProperty(auditStatus);
PProperty(borrowAmount);
PProperty(borrowLogo);
PProperty(borrowShow);

PProperty(borrowStatus);
PProperty(borrowTitle);
PProperty(borrowWay);
PProperty(credit);
PProperty(creditrating);
PProperty(deadline);
PProperty(excitationSum);
PProperty(excitationType);

PProperty(hasPWD);
PProperty(idstan);
PProperty(imgPath);
PProperty(investNum);
PProperty(isDayThe);

PProperty(minTenderedSum);
PProperty(purpose);
PProperty(schedules);
PProperty(t_b_region);
PProperty(username);
PProperty(vip);
PProperty(vipStatus);
@end

//------------------  新类：ProvinceList   ------------------
@interface ProvinceList : BaseObject

PProperty(agencyId);
PProperty(parentId);
PProperty(regionId);
PProperty(regionName);
PProperty(regionType);
@end



