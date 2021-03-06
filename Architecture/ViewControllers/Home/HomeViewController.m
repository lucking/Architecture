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
#import "TestViewController.h"
//#import "TestAAViewController.h"
#import "ZMCache.h"
#import "NetworkManager.h"

#define CompanyTopText	@"		上海棠棣信息科技有限公司（股票代码833777，简称“棠棣信息”）是得到了国家信息产业部、上海市各级政府认可的高新技术企业，专业为国际国内各类银行、互联网金融企业等金融机构以及智慧社区、医疗机构等提供行业一流软件产品和系统集成服务。\n		棠棣信息2009年成立，总部位于中国上海“张江高科技园区”，是上海市科技小巨人培育企业、上海市高新技术企业，拥有数十项软件著作权。在北京、福州、广州、合肥等地设有分公司，技术服务站点遍及全国各大城市。\n		棠棣信息的发展始终放眼于全球范围内信息化、智能化发展的前沿进程，紧随全球“工业4.0”的步伐，棠棣信息也投入了大量的研发力量，使产品及服务始终保持行业领先水平。"

#define LINESPACE 4.4

#define MAIN_BASE_GRAY_COLOR    [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0]
#define contentFontName  @"FZLanTingHei-L-GBK"


@interface HomeViewController ()
{
	NSTimer* timer;
    Ivar aa;

}
@property (nonatomic, strong) UILabel *label;
@end

@implementation HomeViewController
- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	//隐藏navBar
//	self.navigationController.navigationBar.hidden = NO;
//	[self.navigationController setNavigationBarHidden:YES animated:TRUE];
//	[self.navigationController setToolbarHidden:YES animated:TRUE];
	//显示tabBar
	[self tabBarHidden:NO];


}
- (void)viewDidLoad {
    [super viewDidLoad];
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSuccess) name:@"loginSuccess" object:nil];
        
	// 初始化UI
//	[self initUI];
    

    [self test];
    

    
    [self requestTest];
    
}


- (void)requestTest {
    
    NSDictionary *params = @{@"cid":@"remen",
                             };
    NSString *urlStr = @"http://zhekou.yijia.com/lws/view/ichuanyi/suit_list_data_get.php?";
    
    [[NetworkSession sharedSessionManager] GET:urlStr parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"---> responseObject: %@", responseObject);
       
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"---> error: %@", error);
    }];

}

- (void)test1 {
    
    //    // 添加联系人: 加号+
    //    [self addBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem) tintColor:[UIColor whiteColor] isRightItem:YES];
    
    
    //获取缓存文件大小
    //    [ZMCache myClearCacheAction];
    
    [ZMCache getCachefileSizeTarget:self select:@selector(getCachefileSize:)];
    
    
    
    
    //    NSMutableArray *titleArray = [NSMutableArray arrayWithObjects:@"TestVC",@"ObjectStringVC",@"TestBBVC",@"StroeDataVC",@"TestTableVC",@"RegisterVC",@"77",@"88",@"99", nil];
    //
    //    [titleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    //
    //        if (idx==2) {
    //            [titleArray removeObject:obj];
    //        }
    //    }];
    //    NSLog(@"---> titleArray = %@",titleArray);
    //
    //
    //    // UILabel
    //    _label = [[UILabel alloc] initWithFrame:CGRectMake(50, 70, 250, 100)];
    //    _label.backgroundColor = [UIColor yellowColor];
    //    _label.font = [UIFont systemFontOfSize:15];
    //    _label.text = @"hello,girl";
    //    _label.textColor = [UIColor redColor];
    //    _label.textAlignment = NSTextAlignmentCenter;
    //    [self.view addSubview:_label];
}

#pragma mark 按钮方法
-(void)myBtnClick:(UIButton*)Btn{
    [self.view endEditing:YES];
    
    _label.alpha = 0;
    
//    if (Btn.tag==101) {    //
//        TestViewController* pushVC= [[TestViewController alloc] init];
//        [self.navigationController pushViewController:pushVC animated:YES];
//    }
//    else if (Btn.tag==102){//
//        ObjectStringController* pushVC= [[ObjectStringController alloc] init];
//        [self.navigationController pushViewController:pushVC animated:YES];
//        
//    }
//    else if (Btn.tag==103){//
//        
//        [MMBProgress hudShowMessage:@"帐户已过期，请充值！" afterDelay:3.0f];
//        
//    }
//    else if (Btn.tag==104){//
//        
//    }
//    else if (Btn.tag==105){//
//        
//    }
//    else if (Btn.tag==106){//
//        RegisterViewController* pushVC= [[RegisterViewController alloc] init];
//        [self.navigationController pushViewController:pushVC animated:YES];
//        
//    }
//    else if (Btn.tag==107){//
//        
//        
//    }else if (Btn.tag==108){//
//        
//        
//    }else if (Btn.tag==109){//
//        
//    }
    
}




-(void)getCachefileSize:(id)object{
    
    NSString *fileSize  = (NSString*)object;
    NSLog(@"---> getCachefileSize = %@",fileSize);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
//    显示
//    [self.callBottomView showCallBottomView];
//    [self tabBarHidden:YES];

    
    
    /**
     *  --> responseObject: {
     data={
     orderid=28266561;
     showno=;
     };
     code=1;
     }

     ---> responseObject: {
     data={
     orderid=28270477;
     showno=;
     };
     code=1;
     }

     */
    //app_id：3582
    //app_key: 32815741
    // 1.回拨呼叫
//    NSString *urlStr = @"http://api.yaloe.com/webapi.php?act=call";
    
    //2.呼叫回调方法
//    NSString *urlStr = @"http://www.callback.com/";

    //6.用户信息查询
//    NSString *urlStr = @"http://api.yaloe.com/webapi.php?act=getUserInfo";

    
    //    NSString *urlStr = @"http://admin.yaloe.com/";
    //    NSString *urlStr = @"http://api.yaloe.com/";
    
    NSDictionary *params = @{@"appid":@"3582",
                             @"mynumber":@"13022155071",
                             @"callnumber":@"18205152815",
                             @"fee_type":@"1",
                             @"return_url":@"http://www.callback.com/",
                             @"max":@"6000",
                             @"params":@"customParams",
                             };
//    NSDictionary *params = @{@"orderid":@"28270477",
//                             @"state":@"1",
//                             @"fee_time":@"22",
//                             @"hold_time":@"22",
////                             @"start_time":@"2016175801",
////                             @"end_time":@"2016175823",
//                             @"params":@"customParams",
//                             };

    NSLog(@"---> params = %@",params);
        
    
//    [NetworkManager requestCallGetURl:urlStr withParameters:params hudShow:YES success:^(id data) {
//        
//    } failure:^(NSError *error) {
//        
//    }];
    
    
}

- (void)autoSize {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 70, GetHeight(150), 100)];
    label.backgroundColor = [UIColor yellowColor];
    label.font = [UIFont systemFontOfSize:15];
    label.text = @"hello,girl";
    label.textColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    [window addSubview:label];
    
}

- (void)test {
    
    //	[self aaaaa];
    //	[self bbbbb];
    //	[self testZMSpaceLabel];
    
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SSWIDTH, SSHEIGHT)];
    //iOS设置父视图透明度而不影响子视图
    view.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
    
    //[self.view addSubview:view];
    
    //[self.navigationController.view addSubview:view];
    
    //[self.tabBarController.view addSubview:view];
    
    //[[AppDelegate sharedAppDelegate].window addSubview:view];
    //[view removeFromSuperview];
    
    
    // 测试
    //    [Common showAlertTitle:nil message:@"第一次进入" okTitle:@"确定" cancelTitle:@"取消" okAction:^{
    //        NSLog(@"---> 确定");
    //
    //    }  cancelAction:^{
    //        NSLog(@"---> 取消");
    //
    //    } completion:^{
    //        NSLog(@"---> 弹出时");
    //    }];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 380, 200, 60)];
    label.backgroundColor = BgColor;
    label.font = [UIFont systemFontOfSize:16];
    label.text = @"Hello, girl, Boy, money";
    label.textColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    

    NSArray *colorArray = @[[UIColor greenColor],[UIColor blueColor],Orange_COLOR];
    
    [Common changeTextLab:label
                   stringArray:@[@"Hello",@"Boy",@"money"]
                    colorArray:colorArray
                     fontArray:@[@"18",@"20"]];
    
    
    
    [UIColor redColor];
    
    //    [self setLabelParaStr:@"hello" AllStr:label.text WithColor:[UIColor cyanColor]];
    //    [label setAttributedText:[self setLabelParaStr:@"hello" AllStr:label.text WithColor:[UIColor cyanColor]]];
    //    [label setAttributedText:[self setLabelParaStr:@"boy" AllStr:label.text WithColor:[UIColor greenColor]]];
    
    [UIColor redColor];
}



#pragma mark  改变一种文本的颜色
- (NSMutableAttributedString *)setLabelParaStr:(NSString *)rangeStr AllStr:(NSString *)allStr WithColor:(UIColor *)color
{
    NSRange range = [allStr rangeOfString:rangeStr];
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc]initWithString:allStr];
    [attribute addAttributes:@{NSForegroundColorAttributeName:color} range:range];
    
    return attribute;
}
- (void)testZMSpaceLabel {

	NSString *labelText = CompanyTopText;

	//自定义的Label视图
	ZMSpaceLabel *readNewsLable =[[ZMSpaceLabel alloc] initWithFrame:CGRectZero];
	readNewsLable.textColor = MAIN_BASE_GRAY_COLOR;
	readNewsLable.lineBreakMode = NSLineBreakByWordWrapping;
	readNewsLable.backgroundColor = [UIColor yellowColor];
	readNewsLable.font = [UIFont fontWithName:contentFontName size:14];
    readNewsLable.text = labelText;
    readNewsLable.numberOfLines = 0;
    [self.view addSubview:readNewsLable];
    
	int height = [readNewsLable getAttributedStringHeightWidthValue:SSWIDTH];
	NSLog(@"Label高度是多少？ %i", height);
	/*设置label的frame值*/
    // readNewsLable.characterSpacing = 1.0f;
    readNewsLable.linesSpace = 4.4f;
	readNewsLable.frame = CGRectMake(0, 20, SSWIDTH, height);

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

- (void)changeTimeAtTimedisplay {

//	NSArray *sortDescriptors= [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"forcatsProfitRate" ascending:YES]];
//	
//	myMutableArr= (NSMutableArray*)[myMutableArr sortedArrayUsingDescriptors:sortDescriptors];
//	NSLog(@"--->排序后：%@",myMutableArr);

}

- (void)initUI
{
	titleArrayAA = @[@"TestVC",@"ObjectStringVC",@"TestBBVC",@"StroeDataVC",@"TestTableVC",@"RegisterVC",@"77",@"88",@"99"];
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
