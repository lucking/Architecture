//
//  ZMMainTabBarController.m
//  ZM_NavTabBar
//
//  Created by tangdi on 15/9/23.
//  Copyright (c) 2015年 ZM. All rights reserved.
//

#import "ZMMainTabBarController.h"
#import "ZMBarButton.h"
#import "ZMTabBar.h"
#import "ZMNavController.h"

#import "HomeViewController.h"
#import "TransferViewController.h"
#import "AccountViewController.h"
#import "MoreViewController.h"

#import "Common.h"
#import "UIColor+ZMAdd.h"


@interface ZMMainTabBarController ()< ZMTabBarDelegate >
{
    ZMTabBar *zmtabBar;
}
@property(nonatomic, assign)NSInteger indexTo;

@end

@implementation ZMMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // self.view.backgroundColor = [UIColor cyanColor];
	// self.hidesBottomBarWhenPushed = YES;
	// self.tabBar.hidden = YES;
    
    // 装载子视图控制器
    [self loadViewControllers];
  
    // 自定义tabBar视图
    [self customTabBarView];

	// 接受通知：返回首页
	GetNotificatSelector(ChangSelIndex:, @"BackToFirst",@"0");
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ChangSelIndex:) name:@"BackToSecond" object:@"1"];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ChangSelIndex:) name:@"BackToThree" object:@"2"];

}
- (BOOL)shouldAutorotate {
    
    return YES;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    
//    return UIInterfaceOrientationMaskPortrait;
    return UIInterfaceOrientationMaskAll;
}


// 跳到指定模块
- (void)ChangSelIndex:(NSNotification *)notify {
    
    //遍历所有子试图subviews
    for (UIView *subViews in self.tabBar.subviews) {    //NSLog(@"tabBar.subviews = %@",subViews);
        if ([subViews isKindOfClass:[ZMTabBar class]]) {
            ZMTabBar *tabBar = (ZMTabBar*)subViews;

            for (UIView *subViews in tabBar.subviews) {

				if ([subViews isKindOfClass:[ZMBarButton class]]) {

					ZMBarButton *btn = (ZMBarButton*)subViews;
					NSInteger index = [[notify object] integerValue]; // NSLog(@"index = %ld",(long)index);
					if (btn.tag == index) {
                        [tabBar btnClick:btn];
                    }
                }
            }
        }
    }
}
#pragma mark - Private Method
//初始化子控制器
- (void)loadViewControllers{
    //1.
    HomeViewController  *aaVC =[[HomeViewController alloc] init];
    ZMNavController* aaNavRootVC= [[ZMNavController alloc] initWithRootViewController:aaVC];
    [aaVC setTitle:@"首页" TitleColor:[UIColor whiteColor]];
    //UINavigationController *aaNavRootVC = [[UINavigationController alloc] initWithRootViewController:aaVC];
	//2.
	TransferViewController *bbVC= [[TransferViewController alloc] init];
	ZMNavController* bbNavRootVC = [[ZMNavController alloc] initWithRootViewController:bbVC];
	[bbVC setTitle:@"模拟" TitleColor:[UIColor whiteColor]];
    //3.
    AccountViewController *ccVC= [[AccountViewController alloc] init];
    ZMNavController* ccNavRootVC = [[ZMNavController alloc] initWithRootViewController:ccVC];
    [ccVC setTitle:@"我的账户" TitleColor:[UIColor whiteColor]];
    //4.
    MoreViewController *ddVC = [[MoreViewController alloc] init];
    ZMNavController* ddNavRootVC = [[ZMNavController alloc] initWithRootViewController:ddVC];
    [ddVC setTitle:@"更多" TitleColor:[UIColor whiteColor]];
    
    
//    //1.
//    HomeViewController  *aaVC =[[HomeViewController alloc] init];
//    UINavigationController* aaNavRootVC= [[UINavigationController alloc] initWithRootViewController:aaVC];
//    [aaVC setTitle:@"首页" TitleColor:[UIColor whiteColor]];
//    //2.
//    TransferViewController *bbVC= [[TransferViewController alloc] init];
//    UINavigationController* bbNavRootVC = [[UINavigationController alloc] initWithRootViewController:bbVC];
//    [bbVC setTitle:@"模拟" TitleColor:[UIColor whiteColor]];
//    //3.
//    AccountViewController *ccVC= [[AccountViewController alloc] init];
//    UINavigationController* ccNavRootVC = [[UINavigationController alloc] initWithRootViewController:ccVC];
//    [ccVC setTitle:@"我的账户" TitleColor:[UIColor whiteColor]];
//    //4.
//    MoreViewController *ddVC = [[MoreViewController alloc] init];
//    UINavigationController* ddNavRootVC = [[UINavigationController alloc] initWithRootViewController:ddVC];
//    [ddVC setTitle:@"更多" TitleColor:[UIColor whiteColor]];
    
    

    NSArray *viewControllers = @[aaNavRootVC,
                                 bbNavRootVC,
                                 ccNavRootVC,
                                 ddNavRootVC];
    self.viewControllers = viewControllers;
    //[self setViewControllers:viewControllers animated:YES];

//    aaVC.view.backgroundColor = Color_E91E63;
//    bbVC.view.backgroundColor = Color_2196F3;
//    ccVC.view.backgroundColor = Color_5AB963;
//    ddVC.view.backgroundColor = Color_FFC107;

}
// 自定义tabBar视图
- (void)customTabBarView{

    zmtabBar = [[ZMTabBar alloc]init];
    zmtabBar.backgroundColor = [UIColor colorWithHexString:@"5AB963"];//fcfcfc
    zmtabBar.frame = self.tabBar.bounds;
    zmtabBar.delegate = self;
    [self.tabBar addSubview:zmtabBar];//用系统的
}

#pragma mark ******************** ZMTabBarDelegate代理方法 ********************
#pragma
- (void)ChangSelIndexForm:(NSInteger)from to:(NSInteger)to
{
	//NSLogline(@"---> IndexTabBarto = %@",@(to));
	self.selectedIndex = to;
}


@end
