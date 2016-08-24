
//
//  BaseViewController.m
//  ZM_NavTabBar
//
//  Created by tangdi on 15/9/23.
//  Copyright (c) 2015年 ZM. All rights reserved.
//

#import "BaseViewController.h"
#import "ZMMainTabBarController.h"
#import "AppDelegate.h"
#import "BaseHeader.h"


@interface BaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
	//self.navigationItem.hidesBackButton = YES;
	
	//导航栏下的起始坐标设置为(0,0)
	//   self.edgesForExtendedLayout = UIRectEdgeNone;

	// 添加单击手势
	//   [self addTapGesture];
    
    
    //在此写（在viewDidLoad里写），有3级以上vc，vc消失时，delegate为nil，失去右滑返回功能
    //self.navigationController.interactivePopGestureRecognizer.delegate = self;

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //[self.navigationController.navigationBar setBarTintColor:NavBg_COLOR];
    //在此写（在viewWillAppear里写），有3级以上vc，vc消失时，delegate为重新代理，依然支持右滑返回功能
    //self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
    
}
- (void)viewDidAppear:(BOOL)animated {
    //    self.backBtn.hidden = YES;
    
}

//系统方法：右滑返回
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    NSLog(@"---> self.navVC.childVCs.count = %ld ",self.navigationController.childViewControllers.count);
    NSLog(@"---> self.childVCs.count = %ld \n ",self.childViewControllers.count);
    return self.navigationController.childViewControllers.count > 1;
    //或
//    return YES;
}

- (void)addScrollView{

	self.sscrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0,SSWIDTH,SSHEIGHT)];
	self.sscrollview.contentSize = CGSizeMake(SSWIDTH,SSHEIGHT);
	self.sscrollview.showsVerticalScrollIndicator = NO;
	self.sscrollview.showsHorizontalScrollIndicator= NO;
	//self.sscrollview.delegate= self;
	[self.view addSubview:self.sscrollview];

}

#pragma mark 导航标题 navigationTitle
-(void)setTitle:(NSString*)title TitleColor:(UIColor*)color
{
    UILabel *titleLab= [[UILabel alloc]init];
    titleLab.frame= CGRectMake(0, 0, 100, 30);
    titleLab.textColor = color;
    [titleLab setText:title];
    titleLab.textAlignment= NSTextAlignmentCenter;
    titleLab.font= [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = titleLab;
}

#pragma mark 自定义返回按钮：黑色箭头
-(void)returnViewBlack
{
    //隐藏系统的
    self.navigationItem.hidesBackButton = YES;
    //自定义：返回按钮
    UIButton *returnBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    returnBtn.frame = CGRectMake(0,0,34, 34);
    [returnBtn setImage:[UIImage imageNamed:@"back_icon"] forState:UIControlStateNormal];
    [returnBtn addTarget:self action:@selector(UpInsidedemo) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *BarBtn= [[UIBarButtonItem alloc]initWithCustomView:returnBtn];
    self.navigationItem.leftBarButtonItem= BarBtn;
    
}
#pragma mark 自定义返回按钮：白色箭头
-(void)returnViewWhite
{	//隐藏系统的
    self.navigationItem.hidesBackButton = YES;
    //返回按钮
	UIButton *returnBtn= [[UIButton alloc] initWithFrame:CGRectMake(20,5,15, 20)];
    [returnBtn setImage:[UIImage imageNamed:@"backarrow26-44.png"] forState:UIControlStateNormal];
    [returnBtn addTarget:self action:@selector(UpInsidedemo) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:returnBtn];
    
    UIBarButtonItem *BarBtn= [[UIBarButtonItem alloc]initWithCustomView:returnBtn];
    self.navigationItem.leftBarButtonItem= BarBtn;
}


-(void)UpInsidedemo{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark  设置tabBar的颜色
- (void)setTabBarColor:(UIColor *)color
{
//    [self.navigationController.tabBarController.tabBar setBarTintColor:color];
    [self.navigationController.navigationBar setBarTintColor:color];
}
#pragma mark tabBar的显示或隐藏
- (void)tabBarHidden:(BOOL)hidden{

    ZMMainTabBarController *tabBarVC= (ZMMainTabBarController *)self.tabBarController;
    tabBarVC.tabBar.hidden = hidden;
    self.tabBarController.tabBar.hidden = hidden;
}
#pragma mark 是否允许左边菜单侧滑
- (void)leftSlideVCsetPanEnabled:(BOOL)enabled{
    
//    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    [appDelegate.LeftSlideVC setPanEnabled:enabled];
}


//使用系统的 BarButtonSystemItem
- (void)addBarButtonSystemItem:(UIBarButtonSystemItem)systemItem target:(id)target
                        action:(SEL)action
                     tintColor:(UIColor *)tintColor
                   isRightItem:(BOOL)isRightItem
{
    if (isRightItem) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemItem target:target action:action];
        self.navigationItem.rightBarButtonItem.tintColor = tintColor;
        
    }else {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemItem target:target action:action];
        self.navigationItem.leftBarButtonItem.tintColor = tintColor;
        
    }
}
//添加图片的 BarButtonItem
- (void)addBarButtonImageItemImgName:(NSString *)imgName
                              action:(SEL)action
                           tintColor:(UIColor *)tintColor
                         isRightItem:(BOOL)isRightItem
{
    if (isRightItem) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imgName] style:UIBarButtonItemStylePlain target:self action:action];
        self.navigationItem.rightBarButtonItem.tintColor = tintColor;
        
    }else {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imgName] style:UIBarButtonItemStylePlain target:self action:action];
        self.navigationItem.leftBarButtonItem.tintColor = tintColor;

        
    }
}


#pragma mark  清除UITableView底部多余的分割线
- (void)clearTableViewLine:(UITableView *)tabelView{
    
    UIView *View=[UIView new];
    View.backgroundColor= [UIColor clearColor];
    [tabelView setTableHeaderView:View];
	[tabelView setTableFooterView:View];

}
#pragma mark  添加线
-(void)addlineBg:(UIView*)view Rect:(CGRect)rect Color:(UIColor*)color Alpha:(float)alpha
{
    UIView* line1= [[UIView alloc]initWithFrame:rect];
    //line1.backgroundColor= [UIColor grayColor];
    line1.backgroundColor= color;
    line1.alpha= alpha;
    [view addSubview:line1];
}
//添加线
-(void)addlineBg:(UIView*)view X:(float)xx Y:(float)yy Width:(float)width Height:(float)height Alpha:(float)alpha
{
	UIView *line1= [[UIView alloc]init];
	line1.frame=CGRectMake(xx,yy ,width, height);
	line1.backgroundColor= [UIColor grayColor];//redColor
	line1.alpha= alpha;
	[view addSubview:line1];
}


#pragma mark 添加单击手势：控制键盘
- (void)addTapGesture
{
	UITapGestureRecognizer * gesture =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureClick)];
	gesture.numberOfTapsRequired = 1;
	[self.view addGestureRecognizer:gesture];
}
//手势绑定的事件
-(void)tapGestureClick
{
	[self.view endEditing:YES];
}



// 添加按钮：UIButton
-(void)addBtnTitle:(NSString*)title Tag:(int)tag X:(float)xx Y:(float)yy Width:(float)myWidth Height:(float)myHeight
{
	UIButton *Btn1= [UIButton buttonWithType:UIButtonTypeCustom];
	Btn1.backgroundColor = [UIColor whiteColor];
	Btn1.frame =CGRectMake(xx,yy, myWidth, myHeight);
	Btn1.layer.cornerRadius= 5;
	Btn1.layer.masksToBounds= YES;
	Btn1.layer.borderWidth= 1.2;
	Btn1.layer.borderColor= Color_70AEE1.CGColor;
	Btn1.titleLabel.font= [UIFont systemFontOfSize:15];
	Btn1.tag = tag;
	[Btn1 setTitle:title forState:UIControlStateNormal];
	[Btn1 setTitleColor:Color_F44336 forState:UIControlStateNormal];
	[Btn1 addTarget:self action:@selector(myBtnClick:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:Btn1];
}
- (void)myBtnClick:(UIButton *)Btn{

}
- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end



