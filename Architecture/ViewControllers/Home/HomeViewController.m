//
//  HomeViewController.m
//  ZMArchitecture
//
//  Created by tangdi on 16/1/6.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "HomeViewController.h"
#import "YTKKeyValueStore.h"
#import "Finance.h"
#import "NSString+ZMAdd.h"
#import "AppDelegate.h"

#define CompanyTopText	@"		上海棠棣信息科技有限公司（股票代码833777，简称“棠棣信息”）是得到了国家信息产业部、上海市各级政府认可的高新技术企业，专业为国际国内各类银行、互联网金融企业等金融机构以及智慧社区、医疗机构等提供行业一流软件产品和系统集成服务。\n		棠棣信息2009年成立，总部位于中国上海“张江高科技园区”，是上海市科技小巨人培育企业、上海市高新技术企业，拥有数十项软件著作权。在北京、福州、广州、合肥等地设有分公司，技术服务站点遍及全国各大城市。\n		棠棣信息的发展始终放眼于全球范围内信息化、智能化发展的前沿进程，紧随全球“工业4.0”的步伐，棠棣信息也投入了大量的研发力量，使产品及服务始终保持行业领先水平。"

#define LINESPACE 4.4

#define MAIN_BASE_GRAY_COLOR    [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0]
#define contentFontName  @"FZLanTingHei-L-GBK"


@interface HomeViewController ()
{
	NSTimer* timer;
}
@end

@implementation HomeViewController
- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	//隐藏navBar
	self.navigationController.navigationBar.hidden = NO;
//	[self.navigationController setNavigationBarHidden:YES animated:TRUE];
//	[self.navigationController setToolbarHidden:YES animated:TRUE];
	//显示tabBar
//	[self tabBarHidden:NO];


}
- (void)viewDidLoad {
    [super viewDidLoad];
	// 初始化UI
	[self initUI];

//	[self aaaaa];

//	[self bbbbb];
//	[self testZMSpaceLabel];


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

    
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SSWIDTH, SSHEIGHT)];
    //iOS设置父视图透明度而不影响子视图
    view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];

    //[self.view addSubview:view];

    //[self.navigationController.view addSubview:view];
    
    //[self.tabBarController.view addSubview:view];

    [[AppDelegate sharedAppDelegate].window addSubview:view];
    //[view removeFromSuperview];

    
}


- (void)testZMSpaceLabel {

	NSString *labelText = CompanyTopText;


	//自定义的Label视图
	ZMSpaceLabel *readNewsLable =[[ZMSpaceLabel alloc] initWithFrame:CGRectZero];
	readNewsLable.textColor = MAIN_BASE_GRAY_COLOR;
	readNewsLable.lineBreakMode = NSLineBreakByWordWrapping;
	readNewsLable.backgroundColor = [UIColor yellowColor];
	readNewsLable.font = [UIFont fontWithName:contentFontName size:14];
	[readNewsLable setText:labelText];

	// readNewsLable.characterSpacing = 1.0f;
	readNewsLable.linesSpace = 4.4f;

	int height = [readNewsLable getAttributedStringHeightWidthValue:SSWIDTH];
	NSLog(@"Label高度是多少？ %i", height);

	/*设置label的frame值*/
	readNewsLable.frame = CGRectMake(0, 20, SSWIDTH, height);
	readNewsLable.numberOfLines = 0;
	[self.view addSubview:readNewsLable];


}

- (void)testYTKKeyValueStore {

	[NSThread detachNewThreadSelector:@selector(subThread) toTarget:self withObject:@"Hello world !"];

	// 创建数据库
	YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"Product.db"];
	// 创建表格
	NSString *tableName = @"Finance_table";
	//	[store createTableWithName:tableName];
	// 查询获取模型
	Page *page1 = [store getModelObjectById:@"2" className:[Page class] fromTable:tableName];
	NSLog(@"borrowTitle1 = %@", page1.borrowTitle);



//	// 删除表库
//		YTKKeyValueStore *store = [[YTKKeyValueStore alloc] init];
//		[store deleteDatabseWithDBName:@"Product.db"];
//

	//	NSString* password = @"111111";
	//	password = [password md5Encrypt];
	//
	//	NSDictionary* params = @{@"custId":@"chenyangyang",
	//							 @"custPwd":password};
	//	// requestPostURl
	//	[NetworkManager requestGetURl:Login withParameters:params success:^(id data) {
	//
	//		NSLog(@"data = \n %@",data);
	//
	//	} failure:^(NSError *error) {
	//	}];
    
    
    
}

- (void)subThread {
//	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
//	CFRunLoopRun();
//	[pool release];
}
- (void)runLoop
{

	/**
	 *  NSRunLoop类声明的编程接口对象管理输入源。
		NSRunLoop对象处理鼠标和键盘等输入来源来自窗口系统的事件,NSPort对象,NSConnection对象。还一个NSRunLoop对象流程NSTimer事件。您的应用程序不能创建或显式管理NSRunLoop对象。每个NSThread对象,包括应用程序的主线程,有着NSRunLoop对象自动创建它。如果你需要访问当前线程的运行循环,你与类方法currentRunLoop这样做。

	 注意: 从NSRunloop的角度,NSTimer对象不是“输入”是一种特殊类型,和一件事意味着他们不会引起火灾时运行循环返回。

	 警告: NSRunLoop类一般不被认为是线程安全的,其方法应该只被称为当前线程的上下文中。
	 你不应该打电话给一个NSRunLoop对象的方法在不同的线程中运行,这样做可能会导致意想不到的结果。


	 NSTimer 在子线程中应该手动创建NSRunLoop ，否则不能循环执行。

	 模式（NSRunLoop）:
	 NSDefaultRunLoopMode：默认的运行模式，用于大部分操作，除了NSConnection对象事件。
	 NSRunLoopCommonModes

	 NSConnectionReplyMode：用来监控NSConnection对象的回复的，很少能够用到。
	 NSModalPanelRunLoopMode：用于标明和Mode Panel相关的事件。
	 NSEventTrackingRunLoopMode：用于跟踪触摸事件触发的模式（例如UIScrollView上下滚动）。
	 NSRunLoopCommonModes：是一个模式集合，当绑定一个事件源到这个模式集合的时候就相当于

	 绑定到了集合内的每一个模式。
	 Cocoa应用默认包含Default、Panel、Event Tracking模式，
	 Core Foundation只包含Default模式，我们可以通过CFRunLoopAddCommonMode添加模式。
	 

	 模式（MainRunLoop）:
	 UITrackingRunLoopMode

	 */
	[[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];

	// [NSRunLoop currentRunLoop] acceptInputForMode:<#(nonnull NSString *)#> beforeDate:<#(nonnull NSDate *)#>];



	//我们在使用NSTimer的时候，可能会接触到runloop的概念，下面是一个简单的例子：

	timer= [NSTimer timerWithTimeInterval:1 target:self selector:@selector(changeTimeAtTimedisplay) userInfo:nil repeats:YES];

	//必须手动加入到当前循环中去
	NSRunLoop *runloop = [NSRunLoop currentRunLoop];
	[runloop addTimer:timer forMode:NSDefaultRunLoopMode];
	// 同上
	[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];

	[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];




	//此方法默认添加到当前NSRunLoop中
	[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeTimeAtTimedisplay) userInfo:nil repeats:YES];

}

- (void)changeTimeAtTimedisplay {

//	NSArray *sortDescriptors= [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"forcatsProfitRate" ascending:YES]];
//	
//
//
//	myMutableArr= (NSMutableArray*)[myMutableArr sortedArrayUsingDescriptors:sortDescriptors];
//	NSLog(@"--->排序后：%@",myMutableArr);

}

- (void)initUI
{
	titleArrayAA = @[@"HomeManager",@"RequestVC",@"TestVC",@"StroeDataVC",@"TestTableVC",@"RegisterVC",@"77",@"88",@"99"];
	float top = 80;
	for (int i=0; i<titleArrayAA.count; i++) {
		int _tag = 101+i;
		[self addBtnTitle:titleArrayAA[i] Tag:_tag X:5 Y:top+45*i Width:SSWIDTH/2-10 Height:35];
	}

	HHeight = 40+5;
	[self addBgView:sscrollView title:@"车牌" YY:20+HHeight*0 tag:111];
	[self addBgView:sscrollView title:@"车辆品牌" YY:20+HHeight*0 tag:222];
	[self addBgView:sscrollView title:@"车型" YY:20+HHeight*0 tag:333];
	// ....
}
#pragma mark 按钮方法
-(void)myBtnClick:(UIButton*)Btn{
	[self.view endEditing:YES];

	if (Btn.tag==101) {    //

    }
	else if (Btn.tag==102){//

	}
	else if (Btn.tag==103){//

	}
	else if (Btn.tag==104){//

	}
	else if (Btn.tag==105){//

	}
	else if (Btn.tag==106){//
		RegisterViewController* pushVC= [[RegisterViewController alloc] init];
		[self.navigationController pushViewController:pushVC animated:YES];

	}
	else if (Btn.tag==107){//


	}else if (Btn.tag==108){//


	}else if (Btn.tag==109){//
		
	}
	
}
// 添加视图
- (void)addBgView:(UIView *)Bgview title:(NSString *)myTitle YY:(CGFloat)yy tag:(NSInteger)myTag {

	//标题
	float labWW = 100;

	UILabel* titleLab=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, labWW, HHeight)];
	titleLab.textColor= ziti_Color;
	titleLab.font= FFont(15);
	titleLab.text= myTitle;
	titleLab.textAlignment= NSTextAlignmentLeft;
	[Bgview addSubview:titleLab];

	float xx = CGRectGetMaxX(titleLab.frame);
	UITextField* textfield = [[UITextField alloc] initWithFrame:CGRectMake(xx,yy,SSWIDTH-labWW-20, HHeight)];
	textfield.backgroundColor = [UIColor whiteColor];
	textfield.layer.cornerRadius= 5;
	textfield.text= @"";
	textfield.font=  FFont(15);
	textfield.textAlignment= NSTextAlignmentCenter;
	textfield.tag = myTag;
	[textfield addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];
	[Bgview addSubview:textfield];

}
#pragma mark 编辑的时候 触发的方法
#pragma
- (void)textFieldEditingChanged:(UITextField *)textField {

	if (textField.tag ==111) {

	}else if (textField.tag == 222){


	}
	// ...
}

@end
