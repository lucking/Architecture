//
//  InfoDictionaryManager.m
//  HuiFang
//
//  Created by tangdi on 15/12/22.
//  Copyright © 2015年 TD. All rights reserved.
//

#import "InfoDictionaryManager.h"
#import "Common.h"

static NSMutableDictionary *infoDict ;

@implementation InfoDictionaryManager
Singleton_Instance_method_Impl(InfoDictionaryManager);


- (void)testUse{

	NSUUID* uuid = [[NSUUID alloc]init];

	[uuid getUUIDBytes:nil];
}


#pragma mark 获取系统配置文件
- (NSDictionary *)getInfoDictionary{
	NSDictionary *infoDictionary= [[NSBundle mainBundle] infoDictionary];
	return infoDictionary;
}

// 根据key 获取对应的配置信息
+(NSObject *)getValueOfInfoDict:(NSString *)key{
    if(infoDict == nil){
        NSString* File = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
        infoDict = [[NSMutableDictionary alloc] initWithContentsOfFile:File];
    }
    return [infoDict objectForKey:key];
}



// 获取当前系统的版本号
- (NSString *)appVersion{

	NSString *Versionid = [[self getInfoDictionary] objectForKey:@"CFBundleVersion"];
	return Versionid;
}
// app名称
- (NSString *)appName{

	NSString *name = [[self getInfoDictionary] objectForKey:@"CFBundleName"];
	return name;
}
// appId
- (NSString *)appId{

	NSString *appId = [[self getInfoDictionary] objectForKey:@"CFBundleIdentifier"];
	return appId;
}



@end


