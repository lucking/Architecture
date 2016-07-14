//
//  MessageSender.h
//  ZMArchitecture
//
//  Created by tangdi on 16/2/25.
//  Copyright © 2016年 TD. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MessageSender;
@class BaseMessage;
//一:声明协议
@protocol MessageSenderDelegate;
@protocol MessageSenderDataSource;

typedef NS_ENUM (NSUInteger, MessageSendStrategy)
{
	MessageSendStrategyText = 0,
	MessageSendStrategyImage = 1,
	MessageSendStrategyVoice = 2,
	MessageSendStrategyVideo = 3
};



@interface MessageSender : NSObject
{

}
@property (nonatomic, strong) NSArray *strategyList;

@property (nonatomic, weak) id<MessageSenderDelegate> delegate;

@end




/**
 *  MessageSenderDelegate、MessageSenderDataSource
 */
#pragma mark ---" Delegate "---
@protocol MessageSenderDelegate<NSObject>
@required
- (void)messageSender:(MessageSender *)messageSender didSuccessSendMessage:(BaseMessage *)message
			 strategy:(MessageSendStrategy)strategy;

- (void)messageSender:(MessageSender *)messageSender didFailSendMessage:(BaseMessage *)message
			 strategy:(MessageSendStrategy)strategy
				error:(NSError *)error;
@end;


#pragma mark ---" DataSource "---
@protocol MessageSenderDataSource <NSObject>
@required//1.需求方法

@optional//2.可选方法

@end




