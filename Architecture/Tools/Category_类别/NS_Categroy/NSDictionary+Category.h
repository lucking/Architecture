//
//  NSDictionary+Category.h
//  ZMArchitecture
//
//  Created by tangdi on 16/1/27.
//  Copyright © 2016年 TD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Category)
{

}

- (NSString *)descriptionWithLocale:(id)locale;


// NSDictionary转换为XML的plist格式： Dic -> XML
- (NSString *)dicToXML:(NSDictionary *)myDic;


@end
