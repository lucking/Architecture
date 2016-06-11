//
//  InfoDictionaryManager.m
//  HuiFang
//
//  Created by tangdi on 15/12/22.
//  Copyright © 2015年 TD. All rights reserved.
//

#import "InfoDictionaryManager.h"
#import "Common.h"

@implementation InfoDictionaryManager

Singleton_Instance_method_Impl(InfoDictionaryManager);


- (void)testUse{


	NSUUID* uuid = [[NSUUID alloc]init];

	[uuid getUUIDBytes:nil];

}

#pragma mark 获取当前系统的版本号
- (NSString *)getCFBundleVersion{
	NSString *Versionid = [[Common getInfoDictionary] objectForKey:@"CFBundleVersion"];
	if (Versionid) {
		return Versionid;
	}
	return nil;
}
#pragma mark 获取系统配置文件
- (NSDictionary *)getInfoDictionary{
	NSDictionary *infoDictionary= [[NSBundle mainBundle] infoDictionary];
	return infoDictionary;
}

//
- (NSString *)appVersion{

	NSString *Versionid = [[self getInfoDictionary] objectForKey:@"CFBundleVersion"];
	return Versionid;
}
//
- (NSString *)appName{

	NSString *name = [[self getInfoDictionary] objectForKey:@"CFBundleName"];
	return name;
}
//
- (NSString *)appId{

	NSString *appId = [[self getInfoDictionary] objectForKey:@"CFBundleIdentifier"];
	return appId;
}



@end


