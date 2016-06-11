//
//  KVOManager.h
//  ZM_BaseViewController
//
//  Created by tangdi on 15/11/13.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "Singleton.h"

@interface KVOManager : Singleton
{

}
//创建实例
Singleton_Instance_method_Interface(KVOManager);

/*
 * 需要监测的属性
 */
@property(nonatomic,strong) UIColor *color;
@property(nonatomic,strong) UIImage *image;
@property(nonatomic,strong) UIImageView *imageView;
@property(nonatomic,copy)   NSString *title;

/**
 *  VC1
 */

@end
