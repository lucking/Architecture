//
//  CallButton.m
//  Architecture
//
//  Created by ZM on 16/8/4.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "CallButton.h"

@implementation CallButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //如果要立即刷新，要先调用[view setNeedsLayout]，把标记设为需要布局，然后马上调用[view layoutIfNeeded]，实现布局
        //[self setNeedsLayout];
        //[self layoutIfNeeded];
        
//        self.backgroundColor = [UIColor clearColor];
//        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        //self.titleLabel.backgroundColor = Yellow_COLOR;
    }
    return self;
}
/*
 *  重新设置内部：图片的frame
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = 3;
    CGFloat imageH = self.frame.size.height - imageY*2;
    CGFloat imageW = imageH;
//    CGFloat imageX = (self.frame.size.width - imageW)/2;
    CGFloat imageX = 10;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}
/*
 *  重新设置内部：文字的frame
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = 0;
    CGFloat titleX = CGRectGetMaxX(self.imageView.frame);
    CGFloat titleH = self.frame.size.height;
    CGFloat titleW = self.frame.size.width- CGRectGetMaxX(self.imageView.frame) ;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (void)setHighlighted:(BOOL)highlighted
{
    // 目的就是重写取消高亮显示
}

@end
