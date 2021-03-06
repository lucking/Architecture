//
//  UITableView+Add.m
//  Yuanfuyun_1
//
//  Created by 佳佳 on 16/4/13.
//  Copyright © 2016年 罗小华. All rights reserved.
//

#import "UITableView+Add.h"
#import <objc/runtime.h>


@implementation UITableView (Add)

static const char sectionKey;
static const char UITableViewCellKey;
static const char heightForRow;
static const char ClickActionCellKey;

#pragma mark -----------------------"  UITableViewDelegate  "---------------------------------
//行高
-(void)SetUpHeightForRowBlock:(heightForRowBlock)block{
	if (block) {
		objc_setAssociatedObject(self, &heightForRow, block, OBJC_ASSOCIATION_RETAIN);
	}

}
//点击事件
-(void)SetUpTableViewDidSelectRowBlock:(DidSelectRowBlock)block{
	if (block) {
		objc_setAssociatedObject(self, &ClickActionCellKey, block, OBJC_ASSOCIATION_COPY);
	}
}
// RowHeight
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    heightForRowBlock block = objc_getAssociatedObject(self, &heightForRow);
    if (block) {
        return block(tableView,indexPath);
    }else {
        tableView.estimatedRowHeight = 99;
        return tableView.rowHeight = UITableViewAutomaticDimension;
    } ;
    
}
// didSelect
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	DidSelectRowBlock block = objc_getAssociatedObject(self, &ClickActionCellKey);
	if (block) {
		block(tableView,indexPath);
	}else{
		NSLog(@"11");
	}
}


#pragma mark -----------------------"  UITableViewDataSource  "---------------------------------
// Row_Block
-(void)SetUpSectionBlock:(sectionBlock)block{

    if (block) {
        objc_setAssociatedObject(self, &sectionKey, block, OBJC_ASSOCIATION_RETAIN);
    }
}
// cell_Block
-(void)SetUpTableViewCellBlock:(tableViewCellBlock)block{
	if (block) {
		objc_setAssociatedObject(self, &UITableViewCellKey, block, OBJC_ASSOCIATION_RETAIN);
		self.delegate = self;
		self.dataSource = self;
	}
}

// Row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    sectionBlock block = objc_getAssociatedObject(self, &sectionKey);
    return  block(tableView,section);
}

// cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableViewCellBlock block = objc_getAssociatedObject(self, &UITableViewCellKey);
    return block(tableView,indexPath);
}


@end
