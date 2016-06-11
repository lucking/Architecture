//
//  BaseTableController.h
//  ZMFramework
//
//  Created by tangdi on 15/11/11.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZMMainTabBarController.h"


@interface BaseTableController : UITableViewController
{

}
#pragma mark  清除UITableView底部多余的分割线
- (void)clearTableViewLine:(UITableView *)tabelView;



#pragma mark  tabBar的显示或隐藏
- (void)tabBarHidden:(BOOL)hidden;
#pragma mark  自定义返回按钮：白色箭头
- (void)returnViewWhite;
#pragma mark 导航标题 navigationTitle
- (void)setTitle:(NSString*)title TitleColor:(UIColor*)color;





@end
