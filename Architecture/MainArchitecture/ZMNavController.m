//
//  ZMNavController.m
//  ZM_NavTabBar
//
//  Created by tangdi on 15/9/23.
//  Copyright (c) 2015年 ZM. All rights reserved.
//

#import "ZMNavController.h"
#import "BaseHeader.h"

@interface ZMNavController ()

@end

@implementation ZMNavController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
+ (void)initialize
{
    // 设置导航栏的主题
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBarTintColor:NavBg_COLOR];
    //navigationBar一下（0，0）开始
	// self.navigationController.navigationBar.translucent = YES;//navigationBar的毛玻璃效果

}


- (void)viewDidLoad {
    [super viewDidLoad];
    //[[UINavigationBar appearance] setTintColor:UIColorWithRGBA(227, 0, 42, 1.0)];
    //self.view.backgroundColor = [UIColor purpleColor];


}

/**
 *  设置navigationBar样式
 */

- (void)setUpNavigationBarAppearance {
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    
    if (FLOATVALUE<=6.1) {
        //自定义背景图片
        if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
            UIImage *image = [UIImage imageNamed:@"top_bj@2x"];
            [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        }
    }else{
        //自定义背景图片
        if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
            UIImage *image = [UIImage imageNamed:@"top_bj@2x"];
            [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        }
        
    }
    //改变颜色
    UIImage *backgroundImage = nil;
    NSDictionary *textAttributes = nil;
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        backgroundImage = [UIImage imageNamed:@"navigationbar_background_tall"];
        
        textAttributes = @{
                           NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
                           NSForegroundColorAttributeName: [UIColor blackColor],
                           };
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        backgroundImage = [UIImage imageNamed:@"navigationbar_background"];
        
        textAttributes = @{
                           UITextAttributeFont: [UIFont boldSystemFontOfSize:18],
                           UITextAttributeTextColor: [UIColor blackColor],
                           UITextAttributeTextShadowColor: [UIColor clearColor],
                           UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero],
                           };
#endif
    }
    
    [navBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    [navBar setTitleTextAttributes:textAttributes];
}


@end



