//
//  NoWiFiView.m
//  ZMArchitecture
//
//  Created by tangdi on 16/1/22.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "NoWiFiView.h"

@implementation NoWiFiView


- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		self.backgroundColor = GrayColor_titView;

		myWidth=	self.frame.size.width;
		myHeight=	self.frame.size.height;



	}
	return self;
	
}


@end
