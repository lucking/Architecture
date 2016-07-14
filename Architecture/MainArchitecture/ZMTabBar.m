//
//  ZMTabBar.m
//  ZM_NavTabBar
//
//  Created by tangdi on 15/9/23.
//  Copyright (c) 2015年 ZM. All rights reserved.
//

#import "ZMTabBar.h"
#import "UIImage+ZMAdd.h"
#import "UIView+Frame.h"

@interface ZMTabBar ()
@property(nonatomic,strong) ZMBarButton *selButton;
@property(nonatomic,strong) UIImageView *imgView;
@end


@implementation ZMTabBar


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];

		// 自定义tabBar视图
		[self customTabBarView];

    }
    return self;
}

// 自定义tabBar视图
- (void)customTabBarView{

	//1.首页
	[self addBarButtonWithNorName:@"home_bottom" andDisName:@"home_bottom_click" andTitle:@"首页"];
	//2.转让
	[self addBarButtonWithNorName:@"money_bottom" andDisName:@"money_bottom_click" andTitle:@"模拟专区"];
	//3.我的账户
	[self addBarButtonWithNorName:@"mine_bottom" andDisName:@"mine_bottom_click" andTitle:@"我的账户"];
	//4.更多
	[self addBarButtonWithNorName:@"more_bottom" andDisName:@"more_bottom_click" andTitle:@"更多"];

//	self.selectedIndex = 0; // 先显示首页
}

#pragma mark - /************************* 通过传入数据赋值图片 ***************************/
- (void)addBarButtonWithNorName:(NSString *)nor andDisName:(NSString *)dis andTitle:(NSString *)title
{
    ZMBarButton *btn = [[ZMBarButton alloc]init];
    //默认：图片
    [btn setImage:[UIImage imageNamed:nor] forState:UIControlStateNormal];
    //选中：图片
    [btn setImage:[UIImage imageNamed:dis] forState:UIControlStateDisabled];

    //标题
    [btn setTitle:title forState:UIControlStateNormal];
    //默认：标题颜色
    [btn setTitleColor:Color_normal forState:UIControlStateNormal];
    //选中：标题颜色
    [btn setTitleColor:Color_select forState:UIControlStateDisabled];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    //btn.size = btn.currentBackgroundImage.size;
    [self addSubview:btn];
    

	if (self.subviews.count == 1) {
		btn.tag = 0;
		[self btnClick:btn];
	}

}
#pragma mark - /************************  动态加载时设置frame值  **************************/
- (void)layoutSubviews
{
	for (int i = 0; i<self.subviews.count; i++) { // $$$$$
		//找到视图的按钮
		UIButton *btn = self.subviews[i];
		CGFloat btnW = [UIScreen mainScreen].bounds.size.width/self.subviews.count; //按钮个数
		CGFloat btnH = 60;
		CGFloat btnX = i * btnW;
		CGFloat btnY = 0;
		btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
		// 绑定tag 便于后面使用
		btn.tag = i;
	}

}
#pragma mark - /************************  按钮点下方法  **************************/
- (void)btnClick:(ZMBarButton *)btn
{
    //NSLog(@"selectedIndex = %@",@(btn.tag));
    // 响应代理方法 实现页面跳转
    if ([self.delegate respondsToSelector:@selector(ChangSelIndexForm:to:)]) {
        [self.delegate ChangSelIndexForm:_selButton.tag to:btn.tag];
    }
    
    // 设置按钮显示状态 并切换选中按钮
    _selButton.enabled = YES;
    _selButton = btn;
    btn.enabled = NO;
}

@end
