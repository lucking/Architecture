//
//  APPInfoManager.m
//  Architecture
//
//  Created by ZM on 16/7/20.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "APPInfoManager.h"
#import "Common.h"

static NSMutableDictionary *infoDict ;

@implementation APPInfoManager

Singleton_Instance_method_Impl(APPInfoManager);


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



// Version
- (NSString *)appVersion{
    
    NSString *Versionid = [[self getInfoDictionary] objectForKey:@"CFBundleVersion"];
    return Versionid;
}
// AppName
- (NSString *)appName{
    return [[self getInfoDictionary] objectForKey:@"CFBundleName"];
}
// AppId
- (NSString *)appId{
    return [[self getInfoDictionary] objectForKey:@"CFBundleIdentifier"];
}


// CFBundleInfoPlistURL
- (NSString *)CFBundleInfoPlistURL{
    return [[self getInfoDictionary] objectForKey:@"CFBundleInfoPlistURL"];
}
/**
 *  ......
 */





//============================"    "=============================

- (void)test {
    
    NNSLog(@"NNSLog");
    
    NSLog(@"---> currentDeviceStyle = %d ",[APPInfoManager currentDeviceStyle]);
    NSLog(@"---> currentSystemVersion = %@ ",[APPInfoManager currentSystemVersion]);
    NSLog(@"---> currentAPPVersion = %@ ",[APPInfoManager currentAPPVersion]);
    NSLog(@"---> UUID = %@ ",[APPInfoManager UUID]);
    NSLog(@"---> cellularProvider = %@ ",[APPInfoManager cellularProvider]);
    
    NSLog(@"---> getBatteryState = %@ ",[APPInfoManager getBatteryState]);
    NSLog(@"---> getBatteryLevel = %f \n\n ",[APPInfoManager getBatteryLevel]);
    
}

//判断手机型号
+ (int)currentDeviceStyle
{
    
    float Height = [UIScreen mainScreen].bounds.size.height;
    float Width = [UIScreen mainScreen].bounds.size.width;
    //    NSLog(@"%f,,,, %f", Height, Width);
    
    if ([[UIDevice currentDevice].model isEqualToString:@"iPad"]) {
        return iPad_app;
    }else {
        if (Height == 667) {
            return iPhone6_app;
            
        }else if (Height == 568&& Width == 320) {
            return iPhone5_app;
            
        }else if (Height == 480) {
            return iPhone4_app;
            
        }else if (Height == 736.000000) {
            return iPhone6p_app;
        }
    }
    return iPad_app;
}
//获取当前系统版本号
+ (NSString *)currentSystemVersion
{
    return [UIDevice currentDevice].systemVersion;
}
//获取当前APP版本号
+ (NSString *)currentAPPVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}

//获取当前系统UUID
+ (NSString *)UUID
{
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    NSString *uuid = (__bridge NSString *)((__bridge CFUUIDRef)((NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString))));
    CFRelease(puuid);
    CFRelease(uuidString);
    return uuid;
}

//获取运营商名称
+ (NSString *)cellularProvider
{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    NSString *mCarrier = [NSString stringWithFormat:@"%@",[carrier carrierName]];
    return mCarrier;
}

//获取电池状态和等级
+ (NSString*) getBatteryState {
    UIDevice *device = [UIDevice currentDevice];
    if (device.batteryState == UIDeviceBatteryStateUnknown) {
        return @"UnKnow";
    }else if (device.batteryState == UIDeviceBatteryStateUnplugged){
        return @"Unplugged";//未充电
    }else if (device.batteryState == UIDeviceBatteryStateCharging){
        return @"Charging";//正在充电
    }else if (device.batteryState == UIDeviceBatteryStateFull){
        return @"Full";//满电
    }
    return nil;
}
//获取电量的等级，0.00~1.00
+ (float) getBatteryLevel {
    return [UIDevice currentDevice].batteryLevel;
}

@end

