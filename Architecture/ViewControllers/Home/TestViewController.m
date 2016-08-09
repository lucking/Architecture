//
//  TestViewController.m
//  ZMArchitecture
//
//  Created by tangdi on 16/3/1.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "TestViewController.h"
#import "Common.h"

@interface TestViewController ()
{
    
}
@end

@implementation TestViewController


- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:YES];

	[self tabBarHidden:YES];//隐藏tabBar
	//[self returnViewWhite]; //返回
	//标题
	[self setTitle:@"TestVC" TitleColor:[UIColor whiteColor]];
	//显示navBar
	self.navigationController.navigationBar.hidden = NO;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    //返回按钮颜色
    self.navigationController.navigationBar.tintColor = Green_COLOR;
    
    //使用系统返回按钮
    [self addBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backItem) tintColor:[UIColor whiteColor] isRightItem:NO];
    
    
    //navBar 的背景颜色
    //self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    
    //navBar 的标题属性
    //self.navigationController.navigationBar.titleTextAttributes =  [NSDictionary dictionaryWithObjectsAndKeys: FFont(14), NSFontAttributeName, nil];
    

	// 子视图
//	[self subviews];

	// 获取不同格式的时间
//	[self dateFormat];
	NNSLog(@"---> getCurrentVC_Test = %@ \n ",[Common getCurrentVC]);


}

- (void)backItem {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)test {

    // 测试
    [Common showAlertTitle:nil message:@"第一次进入" okTitle:@"确定" cancelTitle:nil okAction:^{
        NSLog(@"---> 确定");
        
    }  cancelAction:^{
        NSLog(@"---> 取消");
        
    } completion:^{
        NSLog(@"---> 弹出时");
    }];
}

- (void)sizeTest {
    
    NSSLog(@"mainScreen_width  = %f",[UIScreen mainScreen].bounds.size.width);
    NSSLog(@"mainScreen_height = %f \n ",[UIScreen mainScreen].bounds.size.height);
    NSSLog(@"bounds_width  = %f",self.view.bounds.size.width);
    NSSLog(@"bounds_height = %f \n ",self.view.bounds.size.height);
    NSSLog(@"frame_width = %f",self.view.frame.size.width);
    NSSLog(@"frame_height= %f \n  \n ",self.view.frame.size.height);
    
    
    NSLog(@"SSPureHeight45 = %f",SSPureHeight45);
    
    float aa =  SSPureHeight45;
    float bb =  SSPureHeight45;
    float cc =  SSHEIGHT;
    float dd =  SSHEIGHT;
    NSLog(@"aa = %p",&aa);
    NSLog(@"bb = %p",&bb);
    NSLog(@"cc = %p",&cc);
    NSLog(@"dd = %p",&dd);
    
    
    NSLog(@"aa = %f",aa);
    NSLog(@"bb = %f \n \n ",bb);

}

#pragma mark -----------------------"  获取不同格式的时间  "---------------------------------
- (void)dateFormat {

	// 获取当前时间
	NSDate* currentDate = [NSDate date];

	NSString* dateStr11 = [NSDate dateFormatWithDate:currentDate dateFormatStatus:DFstatusMMdd];
	NSString* dateStr22 = [NSDate dateFormatWithDate:currentDate dateFormatStatus:DFstatusYYYYMMdd];
	NSString* dateStr33 = [NSDate dateFormatWithDate:currentDate dateFormatStatus:DFstatusHHmmss];
	NSString* dateStr44 = [NSDate dateFormatWithDate:currentDate dateFormatStatus:DFstatusYYYYMMddHHmmss];

	NSLog(@"dateStr11 = %@ ",dateStr11);
	NSLog(@"dateStr22 = %@ ",dateStr22);
	NSLog(@"dateStr33 = %@ ",dateStr33);
	NSLog(@"dateStr44 = %@ ",dateStr44);

}
#pragma mark -----------------------"  子视图  "---------------------------------
- (void)subviews
{
	UISearchBar* searchBar= [[ UISearchBar alloc] initWithFrame:CGRectMake(20, 100, 300, 200)];
	searchBar.text =  @"子试图s";
	[self.view addSubview:searchBar];

	NSMutableArray* mutArray = [[NSMutableArray alloc] init];
	//遍历所有子视图subView
	for (UIView *subView in searchBar.subviews) {

		NSLog(@"searchBar.subviews = %@",subView);

		[mutArray  addObject:subView];
	}

	NNSLog(@"\n \n ");
	for (UIView *subView11 in mutArray) {

		NSLog(@"subView11 = %@",subView11.subviews); // 总共有两个子图层： UISearchBarBackground、UISearchBarTextField
	}
	NNSLog(@"\n \n ");

	NSLog(@"superview = %@",searchBar.superview);
	NSLog(@"superclass= %@ \n ",searchBar.superclass);


	NSLog(@"---> subviews  = %@",[((UIView *)[searchBar.subviews objectAtIndex:0]).subviews lastObject]);
	NSLog(@"---> superclass= %@",[((UIView *)[searchBar.subviews objectAtIndex:0]).subviews lastObject].superclass);
	NSLog(@"\n \n ");

	UIButton* Btn=[UIButton buttonWithType:UIButtonTypeCustom];
	Btn.frame= CGRectMake(60, 100, 200, 60);
	Btn.backgroundColor= [UIColor cyanColor];
	[Btn setTitle:@"按钮" forState:UIControlStateNormal];
	[Btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[Btn setTintColor:[UIColor whiteColor]];
	[self.view addSubview:Btn];

	//遍历所有子试图subviews
	for (UIView *subViews in Btn.subviews) {

		NSLog(@"Btn.subviews = %@",subViews);
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
