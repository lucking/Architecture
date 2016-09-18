//
//  TestViewController.m
//  ZMArchitecture
//
//  Created by tangdi on 16/3/1.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "TestViewController.h"

#import "LetfRightTextView.h"
#import "TopBottomTextView.h"
#import "UIView+Frame.h"
#import "UIColor+ZMAdd.h"
#import "Common.h"

@interface TestViewController ()<UIGestureRecognizerDelegate>
{
    NSArray *titleArrayAA;

}
@property (nonatomic, weak) LetfRightTextView *accNumView;
@property (nonatomic, weak) LetfRightTextView *phoneNumView;
@property (nonatomic, weak) LetfRightTextView *accDateView;
@property (nonatomic, weak) LetfRightTextView *yearDateView;
@property (nonatomic, weak) TopBottomTextView *topTextView;

@end

@implementation TestViewController
/**
 *  系统返回按钮
 */
//- (BOOL)navigationShouldPopOnBackButton {
//    NSLog(@"---> 系统返回按钮_navigationShouldPopOnBackButton");
//    //使用自己的
//    [self.navigationController popToRootViewControllerAnimated:YES];
//    //禁用系统的
//    return NO;
//}

- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:YES];
	[self tabBarHidden:YES];//隐藏tabBar
//    [self backBtnWhiteHidden:NO];
	//显示navBar
	//self.navigationController.navigationBar.hidden = NO;

    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    //返回按钮颜色
//    self.navigationController.navigationBar.tintColor = Green_COLOR;
    self.navigationController.navigationBar.tintColor = Clear_COLOR;
    //标题
    [self setTitle:@"TestVC" TitleColor:[UIColor whiteColor]];
    //返回
    [self backBtnWhiteColor];
    self.view.backgroundColor = BgColor;

    
//    titleArrayAA = @[@"TestAAVC",@"TestBBVC"];
//    float top = 80;
//    for (int i=0; i<titleArrayAA.count; i++) {
//        int _tag = 101+i;
//        [self addBtnTitle:titleArrayAA[i] Tag:_tag X:5 Y:top+45*i Width:SSWIDTH/2-10 Height:35];
//    }
    
    
    
    
    //
    NSString *str12= @"1234567890ABCDEFGHIJKLMN!";
    NSString *subToString = [str12 substringToIndex:6];     //从首位到第六位，共截取前六位
    
    NSString *subFromString = [str12 substringFromIndex:6]; //从第六后面，第七位开始截取，一直截取到最后一位
    
    NSString *rangeString = [str12 substringWithRange:NSMakeRange(6, 3)]; //从第六后面，共截取3位
    
    // NSString *str12A= @"This is a string";
    // NSString *str12B= @"string";
    
    // NSRange range123= [str12A rangeOfString:str12B].location;
    // NSRange range123= [str12A rangeOfString:str12B];
    
    NSLog(@"--->12: subToString  ：%@ ",subToString);
    NSLog(@"--->12: subFromString：%@ ",subFromString);
    NSLog(@"--->12: rangeString  ：%@ ",rangeString);

    
}


- (void)testField {
    
    
    TopBottomTextView *topTextView = [[TopBottomTextView alloc] initWithFrame:CGRectMake(0, 80, SSWIDTH, 80)];
    topTextView.backgroundColor =  UIColorWithRGB(247,247,247);
    topTextView.title = @"帐户余额";
    topTextView.titleLab.font = FFont(16);
    topTextView.titleLab.textColor = [UIColor colorWithRed:1.000 green:0.400 blue:0.400 alpha:1.000];
    topTextView.text = @"100.00元";
    topTextView.textField.font = FFBoldFont(20);
    topTextView.textField.textColor = ColorHexString(@"f23030");
    topTextView.interval = 5.0f;
    [self.view addSubview:topTextView];
    
    
    [self addTextFieldFrame:CGRectMake(0, topTextView.bottom+10, SSWIDTH, 50) title:@"帐户号码:" text:@"13022155071" bottomLineX:20 tag:111];
    [self addTextFieldFrame:CGRectMake(0, _accNumView.bottom, SSWIDTH, 50) title:@"绑定手机:" text:@"13022155071" bottomLineX:0 tag:222];
    
    
    [self addTextFieldFrame:CGRectMake(0, _phoneNumView.bottom+10, SSWIDTH, 50) title:@"帐户有效期:" text:@"2017-09-01" bottomLineX:20 tag:333];
    
    [self addTextFieldFrame:CGRectMake(0, _accDateView.bottom, SSWIDTH, 50) title:@"包年有效期:" text:@"您当前不是包年客户" bottomLineX:0 tag:444];
    

}
- (void )addTextFieldFrame:(CGRect)frame title:(NSString *)title text:(NSString *)text bottomLineX:(float)bottomLineX tag:(NSInteger)tag
{
    LetfRightTextView *textField = [[LetfRightTextView alloc] initWithFrame:frame];
    textField.backgroundColor = White_COLOR;
    textField.title = title;
    textField.titleLab.textColor = Gray_888888;
    textField.textField.text = text;
    textField.textField.font = FFont(16);
    textField.textField.textColor = Gray_444444; //ColorHexString(@"666666");
//    textField.topLineX = 20;
    textField.tag = tag;
    [self.view addSubview:textField];
    if (tag==111) {
        _accNumView = textField;
        textField.bottomLineX = bottomLineX;

    }else if (tag==222){
        _phoneNumView = textField;
        
    }else if (tag==333){
        _accDateView = textField;
        textField.bottomLineX = bottomLineX;

    }else if (tag==444){
        _yearDateView = textField;
    }
}


#pragma mark 按钮方法
-(void)myBtnClick:(UIButton*)Btn{
    [self.view endEditing:YES];
    
    if (Btn.tag==101) {    //
//        TestAAViewController* pushVC= [[TestAAViewController alloc] init];
//        [self.navigationController pushViewController:pushVC animated:YES];
    }
    else if (Btn.tag==102){//
        
    }
    else if (Btn.tag==103){//
        
    }
    else if (Btn.tag==104){//
        
    }
    else if (Btn.tag==105){//
        
    }
    
}


- (void)test {

    
    //navBar 的背景颜色
    //self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    
    //navBar 的标题属性
    //self.navigationController.navigationBar.titleTextAttributes =  [NSDictionary dictionaryWithObjectsAndKeys: FFont(14), NSFontAttributeName, nil];
    
    //使用系统返回按钮
    //    [self addBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backItem) tintColor:[UIColor whiteColor] isRightItem:NO];
    //
    //
    //	// 子视图
    ////	[self subviews];
    //
    //	// 获取不同格式的时间
    ////	[self dateFormat];
    //	NSLog(@"---> getCurrentVC_Test = %@ \n ",[Common getCurrentVC]);
    //
    //
    //    NSLog(@"---> Btn '' @\"\" Click ");
    //    NSLog(@"---> sum = %d ",72 * 1500);
    
    
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
//	UISearchBar* searchBar= [[ UISearchBar alloc] initWithFrame:CGRectMake(20, 100, 300, 200)];
//	searchBar.text =  @"子试图s";
//	[self.view addSubview:searchBar];
//
//	NSMutableArray* mutArray = [[NSMutableArray alloc] init];
//	//遍历所有子视图subView
//	for (UIView *subView in searchBar.subviews) {
//
//		NSLog(@"searchBar.subviews = %@",subView);
//
//		[mutArray  addObject:subView];
//	}
//
//	NNSLog(@"--> \n \n ");
//	for (UIView *subView11 in mutArray) {
//
//		NSLog(@"subView11 = %@",subView11.subviews); // 总共有两个子图层： UISearchBarBackground、UISearchBarTextField
//	}
//	NNSLog(@"--> \n \n ");
//
//	NSLog(@"superview = %@",searchBar.superview);
//	NSLog(@"superclass= %@ \n ",searchBar.superclass);
//
//
//	NSLog(@"---> subviews  = %@",[((UIView *)[searchBar.subviews objectAtIndex:0]).subviews lastObject]);
//	NSLog(@"---> superclass= %@",[((UIView *)[searchBar.subviews objectAtIndex:0]).subviews lastObject].superclass);
//	NSLog(@"\n \n ");
//
//	UIButton* Btn=[UIButton buttonWithType:UIButtonTypeCustom];
//	Btn.frame= CGRectMake(60, 100, 200, 60);
//	Btn.backgroundColor= [UIColor cyanColor];
//	[Btn setTitle:@"按钮" forState:UIControlStateNormal];
//	[Btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//	[Btn setTintColor:[UIColor whiteColor]];
//	[self.view addSubview:Btn];
//
//	//遍历所有子试图subviews
//	for (UIView *subViews in Btn.subviews) {
//
//		NSLog(@"Btn.subviews = %@",subViews);
//	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
