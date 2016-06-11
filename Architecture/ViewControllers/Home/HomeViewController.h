//
//  HomeViewController.h
//  ZMArchitecture
//
//  Created by tangdi on 16/1/6.
//  Copyright © 2016年 TD. All rights reserved.
//

#import "BaseViewController.h"
#import "RegisterViewController.h"
//
//#import "ThreadQueueViewController.h"
//
//#import "GTMBase64.h"
//#import "EncodeDecode.h"
//#import "JSONKit.h"
#import "NSString+ZMAdd.h"

#import "ZMSpaceLabel.h"

typedef enum {
	HomeBtnTagAA       = 101,
	HomeBtnTagBB       = 102,
	HomeBtnTagCC       = 103,
	HomeBtnTagDD       = 104,
	HomeBtnTagEE       = 105,
	HomeBtnTagFF       = 106,
	HomeBtnTagGG       = 107,
	HomeBtnTagHH       = 108,

}HomeButtonTag;

typedef NS_ENUM(NSInteger, MyUITableViewStyle) {
	MyUITableViewStylePlain,          // regular table view
	MyUITableViewStyleGrouped         // preferences style table view
};



@interface HomeViewController : BaseViewController
{
	NSArray *titleArrayAA;

	UIScrollView* sscrollView;
	float HHeight;
}
@end
