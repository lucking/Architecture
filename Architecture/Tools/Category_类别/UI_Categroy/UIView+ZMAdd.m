//
//  UIView+ZMAdd.m
//  ZMArchitecture
//
//  Created by tangdi on 16/5/11.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "UIView+ZMAdd.h"

@implementation UIView (ZMAdd)

- (void)tableAnimationDuration:(NSTimeInterval)duration  animation:(void (^)(void) )animationBlock {

	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:duration];

	animationBlock();

	[UIView commitAnimations];
}

@end
