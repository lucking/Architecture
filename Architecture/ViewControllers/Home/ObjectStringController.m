//
//  ObjectStringController.m
//  Architecture
//
//  Created by ZM on 16/9/19.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "ObjectStringController.h"
#import "People.h"

@interface ObjectStringController ()

@end

@implementation ObjectStringController

- (void)viewDidLoad {
    [super viewDidLoad];
    //标题
    [self setTitle:@"ObjectStringVC" TitleColor:[UIColor whiteColor]];
    [self backBtnWhiteColor];   //返回
    [self tabBarHidden:YES];    //隐藏tabBar


    [self descriptionModel];
    
}

- (void)descriptionModel {
    
    People *pp = [[People alloc] init];
    pp.name = @"zhangmeng";
    pp.age = @"20";
    pp.sex = @"man";
    
    NSLog(@"---> people = %@ ",[pp description]);

}

@end
