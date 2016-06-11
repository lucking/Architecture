//
//  UIButton+Frame.m
//  HuiFang
//
//  Created by tangdi on 15/12/2.
//  Copyright © 2015年 TD. All rights reserved.
//

#import "UIButton+Frame.h"


@implementation UIButton (Frame)
@dynamic BtnBlock;


- (void)setX:(CGFloat)x
{
	CGRect frame = self.frame;
	frame.origin.x = x;
	self.frame = frame;
}
- (CGFloat)x{
	return self.frame.origin.x;
}

//-(void)setImage:(UIImage *)image forState:(UIControlState)state {
//
//}

//-(void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state {
//
//}

//- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
//
//	// self.BtnBlock();
//
//}


-(void)setTitleEdgeInsets:(UIEdgeInsets)titleEdgeInsets{


}







@end
