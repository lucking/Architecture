//
//  MoreViewController.h
//  ZMArchitecture
//
//  Created by tangdi on 16/1/6.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "BaseViewController.h"

@interface MoreViewController : BaseViewController
{
	NSArray *titleArrayAA;


	// 版本更新
	NSDictionary* versionDic;
	NSString* lastVersion;
	NSString* trackViewUrl;
	NSString* trackName;
}
@end
