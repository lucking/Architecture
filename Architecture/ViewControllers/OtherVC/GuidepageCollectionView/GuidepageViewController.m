//
//  GuidepageViewController.m
//  ZMGuidepage
//
//  Created by tangdi on 15/11/6.
//  Copyright © 2015年 ZM. All rights reserved.
//

#import "GuidepageViewController.h"

@interface GuidepageViewController ()

@end

@implementation GuidepageViewController

//static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    
    return [self initWithCollectionViewLayout:layout];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置滚动效果
    self.collectionView.showsHorizontalScrollIndicator = NO;// 取消滚动条
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    // 添加padgeController
    [self addPadgeController];
    NSLog(@"----->WIDTH  = %f",PPWIDTH);
    NSLog(@"----->HEIGHT = %f",PPHEIGHT);

}
- (void)addPadgeController
{
    //设置圆点的效果
    UIPageControl *page = [[UIPageControl alloc] initWithFrame:CGRectMake(PPScreenX(200), PPHEIGHT-20, 200,20)];
    //    page.center = CGPointMake(self.view.frame.size.width/2, PPHEIGHT-20);
    page.backgroundColor = [UIColor clearColor];
    page.numberOfPages = PPagesCount;                       //页数
    page.pageIndicatorTintColor = [UIColor whiteColor];     //当前显示页 圆点的颜色
    page.currentPageIndicatorTintColor = [UIColor redColor];//圆点默认颜色
    _pageControl = page;
    [self.view addSubview:page];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x / scrollView.frame.size.width + 0.5;
    _pageControl.currentPage = page;
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return PPagesCount;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 创建cell
    GuideCollectionCell *cell = [GuideCollectionCell cellWithCollectionView:collectionView indexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    NSString *imageName = [NSString stringWithFormat:@"welcome-1-%ld",(long)indexPath.row + 1];
    if (self.view.frame.size.height==568) {
        imageName = [imageName stringByAppendingString:@"-568h"];
    }
    cell.imageName = imageName;
	
    [cell setIndexPath:indexPath pagecount:PPagesCount];
    
    return cell;
}

@end


