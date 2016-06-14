//
//  NSObject+AlertView.m
//  Architecture
//
//  Created by ZM on 16/6/12.
//  Copyright © 2016年 ZM. All rights reserved.
//

#import "NSObject+AlertView.h"


typedef void (^click)(NSInteger index);


@implementation NSObject (AlertView)


#pragma mark - AlertController
+ (void)showAlertTitle:(NSString *)titlet message:(NSString *)message okTitle:(NSString *)okTitle cancelTitle:(NSString *)cancelTitle okAction:(void (^)(void))okActe cancelAction:(void (^)(void))cancelActe completion:(void (^)(void))complete
{
    UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:titlet message:message preferredStyle:UIAlertControllerStyleAlert];
    
    // okAction
    if ((okTitle != nil) && ![okTitle isEqualToString:@""] && okActe != nil) {
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            okActe();//有回调
        }];
        [alertVC addAction:okAction];
    }
    
    // cancelAction
    if ((cancelTitle != nil) && ![cancelTitle isEqualToString:@""] && cancelActe != nil) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            cancelActe();//有回调
        }];
        [alertVC addAction:cancelAction];
    }
    
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (complete != nil) {
        [window.rootViewController presentViewController:alertVC animated:NO completion:^{
            complete();//有回调
        }];
    }else{
        [window.rootViewController presentViewController:alertVC animated:NO completion:nil];
    }
}


+ (void)AlertTitle:(NSString *)titlet
           message:(NSString *)message
         andOthers:(NSArray<NSString *> *)others
          animated:(BOOL)animated
            action:(click)click
        completion:(void (^)(void))complete
{
    UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:titlet message:message preferredStyle:UIAlertControllerStyleAlert];
    
    
    [others enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (idx == 0)
        {
            [alertVC addAction:[UIAlertAction actionWithTitle:obj style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
                if (action)
                {
                    click(idx);
                }
            }]];
        }
        else{
            [alertVC addAction:[UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                if (action)
                {
                    click(idx);
                }
            }]];
        }
    }];
    

    
    
//    // okAction
//    if ((okTitle != nil) && ![okTitle isEqualToString:@""] && okActe != nil) {
//        
//        UIAlertAction *okAction = [UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            okActe();//有回调
//        }];
//        [alertVC addAction:okAction];
//    }
//    
//    // cancelAction
//    if ((cancelTitle != nil) && ![cancelTitle isEqualToString:@""] && cancelActe != nil) {
//        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//            cancelActe();//有回调
//        }];
//        [alertVC addAction:cancelAction];
//    }
    
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (complete != nil) {
        [window.rootViewController presentViewController:alertVC animated:NO completion:^{
            complete();//有回调
        }];
    }else{
        [window.rootViewController presentViewController:alertVC animated:NO completion:nil];
    }
}





#pragma mark - *****  alert view
- (void)AlertWithTitle:(NSString *)title
                  message:(NSString *)message
                andOthers:(NSArray<NSString *> *)others
                 animated:(BOOL)animated
                   action:(click)click
{
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [others enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (idx == 0)
        {
            [alertVC addAction:[UIAlertAction actionWithTitle:obj style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
                if (action)
                {
                    click(idx);
                }
            }]];
        }
        else{
            [alertVC addAction:[UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                if (action)
                {
                    click(idx);
                }
            }]];
        }
    }];
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];

    [window.rootViewController presentViewController:alertVC animated:NO completion:nil];

}




@end
