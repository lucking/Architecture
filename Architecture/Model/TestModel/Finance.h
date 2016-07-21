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

PPropertyString(retCode);      //返回码
PPropertyString(retFlag);      //返回正确、错误的标志
PPropertyString(retMsg);       //返回信息
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

PPropertyString(borrow_type);
PPropertyString(details);
PPropertyString(ID); //id
PPropertyString(imagpath);
PPropertyString(mark);
PPropertyString(name);
PPropertyString(nid);
PPropertyString(status);
@end

//------------------  新类：PageBean   ------------------
@interface PageBean : BaseObject

PPropertyString(pageNum);
PPropertyString(pageSize);
PPropertyString(startOfPage);
PPropertyString(totalNum);
PPropertyString(totalPageNum);
/**
 *  里面是Page模型
 */
@property (strong, nonatomic) NSMutableArray *page;//不可以写成这个样子 pageArray，必须和请求的数据数组一致
@end

//------------------  新类：Page   ------------------
@interface Page : BaseObject

PPropertyString(annualRate);
PPropertyString(auditStatus);
PPropertyString(borrowAmount);
PPropertyString(borrowLogo);
PPropertyString(borrowShow);

PPropertyString(borrowStatus);
PPropertyString(borrowTitle);
PPropertyString(borrowWay);
PPropertyString(credit);
PPropertyString(creditrating);
PPropertyString(deadline);
PPropertyString(excitationSum);
PPropertyString(excitationType);

PPropertyString(hasPWD);
PPropertyString(idstan);
PPropertyString(imgPath);
PPropertyString(investNum);
PPropertyString(isDayThe);

PPropertyString(minTenderedSum);
PPropertyString(purpose);
PPropertyString(schedules);
PPropertyString(t_b_region);
PPropertyString(username);
PPropertyString(vip);
PPropertyString(vipStatus);
@end

//------------------  新类：ProvinceList   ------------------
@interface ProvinceList : BaseObject

PPropertyString(agencyId);
PPropertyString(parentId);
PPropertyString(regionId);
PPropertyString(regionName);
PPropertyString(regionType);
@end



