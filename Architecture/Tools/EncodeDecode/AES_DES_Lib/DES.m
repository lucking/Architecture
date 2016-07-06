//
//  DES.m
//  AES加密
//
//  Created by tangdi on 16/3/3.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "DES.h"
#import "NSData+Base64.h"
#import "NSString+Base64.h"
#import "NSData+CommonCrypto.h"
#import "GTMBase64.h"


/**
 *  设置：密钥、初始值
 */
#define DES_PASS_KEY	@"des"
#define DES_PASS_IV		@"12345678"

@implementation DES

//加密
+ (NSString *)encryptDESwithText:(NSString *)sText
{
	NSData* keyData = [DES_PASS_KEY dataUsingEncoding:NSUTF8StringEncoding];
	NSData* messageData = [sText dataUsingEncoding:NSUTF8StringEncoding];

	id dataKey = [keyData SHA256Hash];
	NSData *encryptedData = [messageData DESEncryptedDataUsingKey:dataKey iV:DES_PASS_IV error:nil];
	NSString *base64EncodStr = [NSString base64StringFromData:encryptedData length:[encryptedData length]];

	return base64EncodStr;
}

//解密
+ (NSString *)decryptDESwithText:(NSString *)sText
{
	NSData *encryptedData = [NSData base64DataFromString:sText];

	NSData* keyData = [DES_PASS_KEY dataUsingEncoding:NSUTF8StringEncoding];
	id dataKey = [keyData SHA256Hash];
	NSData *decryptedData = [encryptedData decryptedDESDataUsingKey:dataKey iV:DES_PASS_IV error:nil];

	return [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
}





//加密
+(NSString *) encryptUseDES:(NSString *)clearText key:(NSString *)key
{
    NSData *data= [clearText dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesEncrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          nil,
                                          [data bytes],
                                          [data length],
                                          buffer,
                                          1024,
                                          &numBytesEncrypted);
    
    NSString* plainText = nil;
    if (cryptStatus == kCCSuccess) {
        NSData *dataTemp = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        plainText = [GTMBase64 stringByEncodingData:dataTemp];
    }else{
        NNSLog(@"DES加密失败");
    }
    return plainText;
}
//解密
+(NSString*) decryptUseDES:(NSString*)cipherText key:(NSString*)key
{
    // 利用 GTMBase64 解碼 Base64 字串
    NSData* cipherData = [GTMBase64 decodeString:cipherText];
    
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    
    // IV 偏移量不需使用
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          nil,
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          1024,
                                          &numBytesDecrypted);
    NSString* plainText = nil;
    if (cryptStatus == kCCSuccess) {
        NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        
        plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] ;
    }
    return plainText;
}


@end