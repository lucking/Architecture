//
//  DES.h
//  AES加密
//
//  Created by tangdi on 16/3/3.
//  Copyright © 2016年 TD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DES : NSObject


/**
 *  DES加密算法： CBC模式
 */
+ (NSString *)encryptDESwithText:(NSString *)sText;//加密
+ (NSString *)decryptDESwithText:(NSString *)sText;//解密




/**
 *  DES 原始方法
 *  DES加密算法： ECB模式
 */
//加密
+(NSString *) encryptUseDES:(NSString *)clearText key:(NSString *)key;
//解密
+(NSString*) decryptUseDES:(NSString*)cipherText key:(NSString*)key;






@end
