//
//  MoreViewController.m
//  ZMArchitecture
//
//  Created by tangdi on 16/1/6.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];


	NNSLog(@"---> getCurrentVC_DD = %@ \n ",[Common getCurrentVC]);

	[self initUI];
	

}

- (void)initUI {

	titleArrayAA = @[@"版本更新",@"返回首页",@"33",@"44",@"55"
					 ,@"66",@"77",@"88",@"99",@"00"];

	float top = 80;
	[self addBtnTitle:titleArrayAA[0] Tag:101 X:5 Y:top+45*0 Width:SSWIDTH/2-10 Height:35];
	[self addBtnTitle:titleArrayAA[1] Tag:102 X:5 Y:top+45*1 Width:SSWIDTH/2-10 Height:35];
	[self addBtnTitle:titleArrayAA[2] Tag:103 X:5 Y:top+45*2 Width:SSWIDTH/2-10 Height:35];


	NSString *UUID = [[UIDevice currentDevice].identifierForVendor UUIDString];
	NSSLog(@"UUID = %@",UUID);


}
#pragma mark 按钮方法
-(void)myBtnClick:(UIButton*)Btn{
	[self.view endEditing:YES];

	if (Btn.tag==101) {    //

	}
	else if (Btn.tag==102){//
		//[[NSNotificationCenter defaultCenter] postNotificationName:@"BackToFirst" object:@"0"];
		// 同上
		PostNotificat(@"BackToFirst",@"0");

	}
	else if (Btn.tag==103){//

	}
	else if (Btn.tag==104){//

	}
	else if (Btn.tag==105){//

	}
	else if (Btn.tag==106){//

	}
	else if (Btn.tag==107){//


	}else if (Btn.tag==108){//


	}else if (Btn.tag==109){//
		
	}
	
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
