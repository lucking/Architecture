//
//  MessageSender.m
//  ZMArchitecture
//
//  Created by tangdi on 16/2/25.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "MessageSender.h"

@implementation MessageSender


- (instancetype)init{
	self = [super init];
	if (self) {

	}
	return self;
}

- (void)test{

	// [self messageSender:self didFailSendMessage:@"" strategy:MessageSendStrategyText error:nil];

}


- (void)messageSender:(MessageSender *)messageSender didSuccessSendMessage:(BaseMessage *)message
			 strategy:(MessageSendStrategy)strategy{

}
- (void)messageSender:(MessageSender *)messageSender didFailSendMessage:(BaseMessage *)message
			 strategy:(MessageSendStrategy)strategy
				error:(NSError *)error{

}




@end
