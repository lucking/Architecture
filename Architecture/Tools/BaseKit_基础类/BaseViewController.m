
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



@interface BaseViewController ()

@end

@implementation BaseViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
	self.navigationItem.hidesBackButton = YES;
	
	//导航栏下的起始坐标设置为(0,0)
	//   self.edgesForExtendedLayout = UIRectEdgeNone;

	// 添加单击手势
	//   [self addTapGesture];

}
- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	//[self.navigationController.navigationBar setBarTintColor:NavBg_COLOR];

}

- (void)addScrollView{

	self.sscrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0,SSWIDTH,SSHEIGHT)];
	self.sscrollview.contentSize = CGSizeMake(SSWIDTH,SSHEIGHT);
	self.sscrollview.showsVerticalScrollIndicator = NO;
	self.sscrollview.showsHorizontalScrollIndicator= NO;
	self.sscrollview.delegate= self;
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
	UIButton *returnBtn= [[UIButton alloc] initWithFrame:CGRectMake(0,0,15, 20)];
    [returnBtn setImage:[UIImage imageNamed:@"backarrow26-44"] forState:UIControlStateNormal];
    [returnBtn addTarget:self action:@selector(UpInsidedemo) forControlEvents:UIControlEventTouchUpInside];
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


#pragma mark - AlertView1
//- (void)showAlertMessage:(NSString *)message
//{
//	UIAlertView *alter= [[UIAlertView alloc]initWithTitle:@"温馨提示" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//	[alter show];
//}
#pragma mark - AlertView2
- (void)showAlertMessage:(NSString *)message
{
	UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:message preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
	[alertVC addAction:okAction];

	[self.view.window.rootViewController presentViewController:alertVC animated:NO completion:^{

	}];
}
#pragma mark - AlertController
- (void)showAlertTitle:(NSString *)titlet message:(NSString *)message okTitle:(NSString *)okTitle cancelTitle:(NSString *)cancelTitle okAction:(void (^)(void))okActe cancelAction:(void (^)(void))cancelActe completion:(void (^)(void))complete
{
	UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:titlet message:message preferredStyle:UIAlertControllerStyleAlert];

	// okAction
	if ((okTitle != nil) && ![okTitle isEqualToString:@""] && okActe != nil) {

		UIAlertAction *okAction = [UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
			okActe();//有回调
		}];
		[alertVC addAction:okAction];
	}

	// cancelAction
	if ((cancelTitle != nil) && ![cancelTitle isEqualToString:@""] && cancelActe != nil) {
		UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
			cancelActe();//有回调
		}];
		[alertVC addAction:cancelAction];
	}


	UIWindow * window = [[UIApplication sharedApplication] keyWindow];
	if (complete != nil) {
		[window.rootViewController presentViewController:alertVC animated:NO completion:^{
			complete();//有回调
		}];
	}else{
		[window.rootViewController presentViewController:alertVC animated:NO completion:nil];
	}
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



