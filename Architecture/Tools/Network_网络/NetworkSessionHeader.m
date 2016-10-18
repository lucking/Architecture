//
//  NetworkSessionHeader.m
//  Architecture
//
//  Created by ZM on 2016/10/11.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "NetworkSessionHeader.h"

@implementation NetworkSessionHeader


/**
 *  AFNetworking 3.0以上
 *  为了安全，以下URL 因该加密处理，暂时不做处理
 */
+ (instancetype)headerSessionManager
{
    static NetworkSessionHeader* instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [NetworkSessionHeader manager];
        [instance.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
        instance.requestSerializer.timeoutInterval = 30.f;
        
        //设置相关的请求头，通过requestSerializer来实现，可以根据自己的需求定义一个或者多个请求头
        [instance.requestSerializer setValue:@"value" forHTTPHeaderField:@"key"];
        [instance.requestSerializer setValue:@"arrObjc2" forHTTPHeaderField:@"arrKey2"];

    });
    return instance;
}


@end
