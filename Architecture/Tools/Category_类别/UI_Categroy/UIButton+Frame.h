//
//  UIButton+Frame.h
//  HuiFang
//
//  Created by tangdi on 15/12/2.
//  Copyright © 2015年 TD. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^ButtonBlock) (void);


typedef void (^IntBlock) (int);

typedef NSString* (^StrBlock) (NSString *);



@interface UIButton (Frame)
{

}
/**
 *  点击按钮回调
 */
@property(nonatomic , strong)ButtonBlock BtnBlock;





@end
