//
//  NetworkSessionHeader.h
//  Architecture
//
//  Created by ZM on 2016/10/11.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface NetworkSessionHeader : AFHTTPSessionManager

/**
 *  AFNetworking 3.0以上
 */
+ (instancetype)headerSessionManager;

@end
