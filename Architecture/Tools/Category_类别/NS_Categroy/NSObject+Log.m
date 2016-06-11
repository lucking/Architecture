//
//  NSObject+Log.m
//  NSArrayLog
//
//  Created by boitx on 15/12/21.
//  Copyright © 2015年 boitx. All rights reserved.
//

#import "NSObject+Log.h"

@implementation NSObject (Log)




@end

@implementation NSDictionary (Log)

- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *mustr = [NSMutableString string];
    [mustr appendString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [ mustr appendFormat:@"\t%@=%@;\n",key,obj];
        
    }];
    [mustr appendString:@"}"];
    return mustr;
}

@end

@implementation NSArray (Log)

- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *mustr = [NSMutableString string];
    [mustr appendString:@"(\n"];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx < self.count -1) {
            [ mustr appendFormat:@"\t%@,\n",obj];
        }else{
            [ mustr appendFormat:@"\t%@\n",obj];
        }
    }];
    [mustr appendString:@")"];
    return mustr;
}


@end


