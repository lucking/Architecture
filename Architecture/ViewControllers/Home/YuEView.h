//
//  YuEView.h
//  Architecture
//
//  Created by ZM on 16/8/4.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YuEView : UIView
{
    CGRect topRect, bottomRect;
    float  myWidth, myHeight;

}
//背景
@property (nonatomic, weak) UIImageView *imgView;
//标题
@property (nonatomic, weak) UILabel *titleLab;
//余额
@property (nonatomic, weak) UILabel *yuELab;
//充值
@property (nonatomic, weak) UIButton *chongzhiBtn;


@end
