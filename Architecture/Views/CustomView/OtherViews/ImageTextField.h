//
//  ImageTextField.h
//  LiCaiStandard
//
//  Created by tangdi on 15/10/2.
//  Copyright (c) 2015年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTextField.h"


typedef void (^ImageTextFieldBlock) (NSString *pswString);

//============================="  代理协议  "==============================
@class ImageTextField;

@protocol ImageTextFieldDelegate <NSObject>

@optional
- (void)imageTextField:(ImageTextField *)ITView BtnClick:(UIButton *)Btn;

@end
//=============================================================================


@interface ImageTextField : UIView
{
	CGFloat myWidth;
	CGFloat myHeight;
}
/*
 * 左图片
 */
@property(nonatomic,strong)UIImageView* leftImgView;
/*
 * 输入框
 */
@property(nonatomic,strong)BaseTextField* mainText;
/*
 * 右图按钮
 */
@property(nonatomic,readwrite)UIButton* rightBtn;
/*
 * 头部的线
 */
@property(nonatomic,strong)UIView* topLine;
/*
 * 右线
 */
@property(nonatomic,strong)UIView* rightLine;

/**
 *  点击按钮回调
 */
@property (nonatomic , strong) ImageTextFieldBlock rightBtnBlock;


@property (nonatomic,weak) id<ImageTextFieldDelegate> delegate;


- (void)reloadUIwithDic:(NSDictionary *)parameter withType:(NSString *)type;

@end








