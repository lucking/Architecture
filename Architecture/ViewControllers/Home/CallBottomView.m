//
//  CallBottomView.m
//  Architecture
//
//  Created by ZM on 16/8/4.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "CallBottomView.h"
#import "UIView+Frame.h"

@implementation CallBottomView

// 工厂方法
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = BgColor;

        //        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        //        [window addSubview:self];
        //        self.frame = CGRectMake(0, ScreenHeight -keyHeight-49 , ScreenWidth, keyHeight);
        //        //创建数字键盘
        //        [self setupNumKeyBoard];
        
        topRect    = CGRectMake(0, SSHEIGHT-49, SSWIDTH, 49);
        bottomRect = CGRectMake(0, SSHEIGHT, SSWIDTH, 49);
        self.frame = topRect;        
        
        float width13 = 80;
        float callBtnWidth = (SSWIDTH-width13*2);

        float height  = 49;

        [self createBtnTitle:@"收起" frame:CGRectMake(0, 0, width13, height) tag:111];
        
        [self createBtnTitle:@"本地电话" frame:CGRectMake(self.shouqiBtn.right, 0, callBtnWidth, height) tag:222];

        [self createBtnTitle:@"历史记录" frame:CGRectMake(self.callBtn.right, 0, width13, height) tag:333];
    }
    return self;
}


#pragma mark 设置代理：点击按钮
- (void)callBtnClick:(UIButton *)Btn
{
    if (Btn.tag ==111) {
        [self dismissCallBottomView];
    }
    if ([self.delegate respondsToSelector:@selector(callBottomView:BtnClick:)]) {
        [self.delegate callBottomView:self BtnClick:Btn];
    }
    
}

- (UIButton *)createBtnTitle:(NSString *)title frame:(CGRect)frame tag:(int)tag {
    
    UIButton* Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    Btn.frame= frame;
    Btn.backgroundColor = [UIColor clearColor];
    Btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [Btn setTitleColor:[UIColor colorWithWhite:0.246 alpha:1.000] forState:UIControlStateNormal];
    [Btn setTitle:title forState:UIControlStateNormal];
    [Btn addTarget:self action:@selector(callBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    Btn.tag = tag;
    [self addSubview:Btn];

    if (tag==111) {
        self.shouqiBtn = Btn;

    }else if (tag==222) {
        CallButton *Btn2 = [[CallButton alloc]init];
        Btn2.frame= frame;
        Btn2.backgroundColor = [UIColor clearColor];
        Btn2.titleLabel.font = [UIFont systemFontOfSize:16];
        [Btn2 setTitleColor:[UIColor colorWithWhite:0.246 alpha:1.000] forState:UIControlStateNormal];
        [Btn2 setTitle:title forState:UIControlStateNormal];
        [Btn2 addTarget:self action:@selector(callBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        Btn2.tag = tag;
        [self addSubview:Btn2];
        
        self.callBtn = Btn2;
        self.callBtn.backgroundColor = [UIColor cyanColor];
        [ self.callBtn setImage:[UIImage imageNamed:@"call"] forState:UIControlStateNormal];

    }else if (tag==333) {
        self.recordBtn = Btn;

    }
    return Btn;
}



#pragma mark 普通动画
- (void)flipView:(UIView *)myView Rect:(CGRect)myRect forView:(UIView *)view timeInterval:(NSTimeInterval)myTime
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:myTime];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:view cache:YES];
    myView.frame = myRect;
    [UIView commitAnimations];
}

// 显示：
- (void)showCallBottomView {
    [self flipView:self Rect:topRect forView:self timeInterval:0.3];
}
// 隐藏：
- (void)dismissCallBottomView {
    [self flipView:self Rect:bottomRect forView:self timeInterval:0.3];
}

// 移除：
- (void)removeCallBottomView {
    //遍历所有子试图subviews
    for (UIView *subViews in self.subviews) {
        [subViews removeFromSuperview];
    }
    [self removeFromSuperview];
}

@end
