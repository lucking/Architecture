//
//  YuEView.m
//  Architecture
//
//  Created by ZM on 16/8/4.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "YuEView.h"
#import "UIView+Frame.h"

@implementation YuEView

// 工厂方法
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = BgColor;
        
        myWidth = SSWIDTH;
        myHeight= self.height;
        
        [self createUI];
    }
    return self;
}

- (void)createUI {
    
    float labBtnHeight = 30;
    
    float imgViewHeigh =  myHeight-labBtnHeight;
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, imgViewHeigh, imgViewHeigh)];
    imgView.center = CGPointMake(myWidth/2, myHeight/2);
    imgView.image = [UIImage imageNamed:@""];
    imgView.layer.cornerRadius = imgViewHeigh/2;
    imgView.clipsToBounds = YES;
    imgView.layer.borderWidth = 1.f;//设置边框宽度
    imgView.layer.borderColor = Gray_999999.CGColor;//设置边框颜色
    [self addSubview:imgView];
    self.imgView = imgView;
    

    // UILabel
    float labWidth = imgViewHeigh-20;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 70, labWidth, labBtnHeight)];
    label.center = CGPointMake(myWidth/2, imgView.center.y-labBtnHeight/2);
    label.backgroundColor = [UIColor yellowColor];
    label.font = [UIFont systemFontOfSize:12];
    label.text = @"账户余额";
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    self.titleLab = label;
    
    UILabel *yuELab = [[UILabel alloc] initWithFrame:CGRectMake(50, self.titleLab.bottom, labWidth, labBtnHeight)];
    yuELab.center = CGPointMake(myWidth/2, imgView.center.y+labBtnHeight/2);
    yuELab.backgroundColor = [UIColor whiteColor];
    yuELab.font = [UIFont boldSystemFontOfSize:18];
    yuELab.text = @"100元";
    yuELab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:yuELab];
    self.yuELab = yuELab;
    
    
    UIButton *Btn = [[UIButton alloc] initWithFrame:CGRectMake(50, self.imgView.bottom-10, imgViewHeigh/2, labBtnHeight)];
    Btn.backgroundColor = White_COLOR;
    Btn.center = CGPointMake(myWidth/2, imgView.bottom-5);
    Btn.layer.cornerRadius = 2;
    Btn.clipsToBounds = YES;
    Btn.layer.borderWidth = 1.f;
    Btn.layer.borderColor = Gray_999999.CGColor;
    Btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [Btn setTitleColor:[UIColor colorWithWhite:0.246 alpha:1.000] forState:UIControlStateNormal];
    [Btn setTitle:@"充值" forState:UIControlStateNormal];
    Btn.tag = 111;
    [self addSubview:Btn];
    self.chongzhiBtn = Btn;
    
}

@end
