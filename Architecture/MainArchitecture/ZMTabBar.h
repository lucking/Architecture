//
//  ZMTabBar.h
//  ZM_NavTabBar
//
//  Created by tangdi on 15/9/23.
//  Copyright (c) 2015年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseHeader.h"
#import "ZMBarButton.h"
#import "UIView+Frame.h"

/**************************************************************/
@protocol ZMTabBarDelegate <NSObject>

@optional

- (void)ChangSelIndexForm:(NSInteger)from to:(NSInteger)to;

@end
/**************************************************************/


@interface ZMTabBar : UIView
{
    
}
@property (nonatomic,weak) id<ZMTabBarDelegate> delegate;

- (void)addBarButtonWithNorName:(NSString *)nor andDisName:(NSString *)dis andTitle:(NSString *)title;


#pragma mark - /************************  按钮点下方法  **************************/
- (void)btnClick:(ZMBarButton *)btn;

@end
