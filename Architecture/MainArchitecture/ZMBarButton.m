//
//  ZMBarButton.m
//  ZM_NavTabBar
//
//  Created by tangdi on 15/9/23.
//  Copyright (c) 2015年 ZM. All rights reserved.
//

#import "ZMBarButton.h"

@implementation ZMBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //如果要立即刷新，要先调用[view setNeedsLayout]，把标记设为需要布局，然后马上调用[view layoutIfNeeded]，实现布局
        //[self setNeedsLayout];
        //[self layoutIfNeeded];
        
        self.backgroundColor = [UIColor clearColor];
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}
/*
 *  重新设置内部：图片的frame
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = 20;
    CGFloat imageH = imageW;
    CGFloat imageX = (self.frame.size.width - imageW)/2;
    CGFloat imageY = 5;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}
/*
 *  重新设置内部：文字的frame
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = CGRectGetMaxY(self.imageView.frame) + 2;;
    CGFloat titleX = 0;
    CGFloat titleH = 20;
    CGFloat titleW = self.frame.size.width;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}


- (void)setHighlighted:(BOOL)highlighted
{
    // 目的就是重写取消高亮显示
}

/*
 *  不给用了：你猜为什么，storeBoard能用
 **/
//重写\重载要点: 叫做自动布局。iOS6.0时,当使用‘约束-基础’布局基本实现应用‘约束-基础’布局,否则什么也不做。
//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//        self.titleLabel.x = self.imageView.x;
//        self.backgroundColor = [UIColor redColor];
//
//    self.imageView.y = 5;
//    self.imageView.width = 25;
//    self.imageView.height = 25;
//    self.imageView.x = (self.width - self.imageView.width)/2.0;
//    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
//
//
//    self.titleLabel.x = self.imageView.x - (self.titleLabel.width - self.imageView.width)/2.0;
//    //    NSLog(@"--- self.titleLabel.x     : %f \n ",self.titleLabel.x);
//
//    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame) + 2;
//
//    self.titleLabel.font = [UIFont fontWithName:@"HYQiHei" size:10];
//    self.titleLabel.shadowColor = [UIColor clearColor];
//
//    self.titleLabel.textAlignment = NSTextAlignmentCenter;
//}


@end




