//
//  CallBottomView.h
//  Architecture
//
//  Created by ZM on 16/8/4.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CallButton.h"


//=============================================================================
// 协议代理
@class CallBottomView;

@protocol CallBottomViewDelegate <NSObject>

@optional
- (void)callBottomView:(CallBottomView *)callBottomView BtnClick:(UIButton *)Btn;
@end
//=============================================================================



@interface CallBottomView : UIView
{
    CGRect topRect, bottomRect;
}
//收起
@property (nonatomic, weak) UIButton *shouqiBtn;
//本地电话
//@property (nonatomic, weak) UIButton *callBtn;
@property (nonatomic, weak) CallButton *callBtn;
//历史记录
@property (nonatomic, weak) UIButton *recordBtn;

/**
 *  代理属性
 */
@property (nonatomic, weak) id<CallBottomViewDelegate> delegate;


// 显示：
- (void)showCallBottomView;
// 隐藏：
- (void)dismissCallBottomView;
// 移除：
- (void)removeCallBottomView;

@end
