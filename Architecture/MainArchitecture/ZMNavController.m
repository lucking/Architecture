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
    // 没有效果
    //[[UINavigationBar appearance] setTintColor:NavBg_COLOR];//UIColorWithRGBA(227, 0, 42, 1.0)

    //iOS7之后由于navigationBar.translucent默认是YES，坐标零点默认在（0，0）点  当不透明的时候，零点坐标在（0，64）；如果你想设置成透明的，而且还要零点从（0，64）开始，那就添加：self.edgesForExtendedLayout = UIRectEdgeNone;
    
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor purpleColor];
    
    //1.navigationBar下（0，0）开始
    // self.navigationController.navigationBar.translucent = YES;//navigationBar的毛玻璃效果
    
    //2.导航栏下的起始坐标设置为(0,0)
    // self.edgesForExtendedLayout = UIRectEdgeNone;

    //3.自适应
    self.automaticallyAdjustsScrollViewInsets = NO;

    
    /**
     *  UIWebView、UIScrollView 使用1和3 （不是1或3）：因为 SSHEIGHT 的高度是全屏的高度
     *
     * 方式一：
     *  //navigationBar下（0，0）开始
        self.navigationController.navigationBar.translucent = YES;// navigationBar的毛玻璃效果
        //自适应
        self.automaticallyAdjustsScrollViewInsets = NO;
        wwebView = [[UIWebView alloc] initWithFrame:CGRectMake(5,70, SSWIDTH-10, SSHEIGHT-80)];
     
     * 方式二：
     *  //navigationBar下（0，0）开始
        self.navigationController.navigationBar.translucent = NO;// navigationBar的毛玻璃效果
        //自适应
        self.automaticallyAdjustsScrollViewInsets = NO;
        wwebView = [[UIWebView alloc] initWithFrame:CGRectMake(5,10, SSWIDTH-10, SSHEIGHT-80)];
     *
     */
    
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



