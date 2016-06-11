//
//  BKTypes.h
//  ZMArchitecture
//
//  Created by tangdi on 16/3/4.
//  Copyright © 2016年 TD. All rights reserved.
//

#ifndef BKTypes_h
#define BKTypes_h


// Types
typedef void (^BKVoidBlock)(void);
typedef void (^BKCompletionBlock)(BOOL finished);
typedef void (^BKContextBlock)(CGContextRef context);
typedef void (^BKRectBlock)(CGRect rect);
typedef id (^BKCacheBlock)();
typedef void (^BKIndexPathBlock)(NSIndexPath *indexPath);
typedef void (^BKButtonIndexBlock)(NSInteger buttonIndex);
typedef void (^BKStringBlock)(NSString *string);
typedef void (^BKUniCharBlock)(unichar character);
typedef void (^BKDataReadBlock)(NSData *data, NSError *error);
typedef void (^BKConnectionCompletionBlock)(NSData *responseData, NSURLResponse *urlResponse, NSError *error);
typedef void (^BKDateBlock)(NSDate *date);
typedef void (^BKViewBlock)(UIView *view);
typedef void (^BKTaskBlock)(id obj, NSDictionary *change);


// Helper Macros
#define BKBlockCat(A, B) A##B
#define BKBlockSafe(V) __block __typeof__(V) BKBlockCat(safe, V) __attribute__((unused)) = V




#endif /* BKTypes_h */
