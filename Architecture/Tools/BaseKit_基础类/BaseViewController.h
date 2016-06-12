//
//  BaseViewController.h
//  ZM_NavTabBar
//
//  Created by tangdi on 15/9/23.
//  Copyright (c) 2015年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController < UIScrollViewDelegate >
{
    
}
@property(nonatomic,strong) UIScrollView* sscrollview;
- (void)addScrollView;


#pragma mark 导航标题 navigationTitle
-(void)setTitle:(NSString*)title TitleColor:(UIColor*)color;
//#pragma mark 自定义返回按钮
//-(void)returnView;
#pragma mark 自定义返回按钮：黑色箭头
-(void)returnViewBlack;
#pragma mark 自定义返回按钮：白色箭头
-(void)returnViewWhite;

#pragma mark  设置tabBar的颜色
- (void)setTabBarColor:(UIColor *)color;
#pragma tabBar的显示或隐藏
- (void)tabBarHidden:(BOOL)hidden;
#pragma mark 是否允许左边菜单侧滑
- (void)leftSlideVCsetPanEnabled:(BOOL)enabled;


#pragma mark  清除UITableView底部多余的分割线
- (void)clearTableViewLine:(UITableView *)tabelView;
#pragma mark  添加线
-(void)addlineBg:(UIView*)view Rect:(CGRect)rect Color:(UIColor*)color Alpha:(float)alpha;
//添加线
-(void)addlineBg:(UIView*)view X:(float)xx Y:(float)yy Width:(float)width Height:(float)height Alpha:(float)alpha;

#pragma mark 添加单击手势：控制键盘
- (void)addTapGesture;
//手势绑定的事件
-(void)tapGestureClick;



// 添加按钮：UIButton
-(void)addBtnTitle:(NSString*)title Tag:(int)tag X:(float)xx Y:(float)yy Width:(float)myWidth Height:(float)myHeight;
- (void)myBtnClick:(UIButton *)Btn;



@end
