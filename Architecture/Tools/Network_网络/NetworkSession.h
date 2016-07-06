//
//  NetworkSession.h
//  ZM_BaseViewController
//
//  Created by tangdi on 15/11/22.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface NetworkSession : AFHTTPSessionManager

/**
 *  AFNetworking 3.0以上
 */
+ (instancetype)sharedSessionManager ;

@end
