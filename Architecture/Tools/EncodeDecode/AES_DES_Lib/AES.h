//
//  AES.h
//  AES加密
//
//  Created by tangdi on 16/3/3.
//  Copyright © 2016年 TD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AES : NSObject


/**
 *  AES加密算法： CBC模式
 */
// 加密
+ (NSString *)encryptAESwithText:(NSString *)sText;
// 解密
+ (NSString *)decryptAESwithText:(NSString *)sText;



/**
 *  AES 原始方法
 *  AES加密算法： ECB模式
 */
//加密
+(NSString *) encryptUseAESText:(NSString *)myText;
//解密
+(NSString*) decryptUseDESText:(NSString*)myText;


@end
