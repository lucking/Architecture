//
//  GuidepageViewController.h
//  ZMGuidepage
//
//  Created by tangdi on 15/11/6.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuideCollectionCell.h"
#import <Availability.h>

//宽度：bounds
#define PPWIDTH  ([UIScreen mainScreen].bounds.size.width)
//高度：bounds
#define PPHEIGHT ([UIScreen mainScreen].bounds.size.height)
//宽度：Frame
#define PPFrameWIDTH  (self.view.frame.size.width)
//高度：Frame
#define PPFrameHEIGHT (self.view.frame.size.height)

#define PPScreenX(w) (PPWIDTH - (w))/2
#define PPagesCount 4

@interface GuidepageViewController : UICollectionViewController
{
    
}
@property (nonatomic, weak) UIPageControl *pageControl;


@end
