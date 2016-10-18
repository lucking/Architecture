//
//  NetworkSession.m
//  ZM_BaseViewController
//
//  Created by tangdi on 15/11/22.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "NetworkSession.h"

@implementation NetworkSession


/**
 *  AFNetworking 3.0以上  
 *  为了安全，以下URL 因该加密处理，暂时不做处理
 */
+ (instancetype)sharedSessionManager
{
	static NetworkSession* instance;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{

		instance = [NetworkSession manager];
		[instance.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
		instance.requestSerializer.timeoutInterval = 30.f;
        
	});
	return instance;
}



@end



