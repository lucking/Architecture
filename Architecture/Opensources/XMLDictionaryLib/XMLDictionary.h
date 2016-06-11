//
//  XMLDictionar.h
//  ZMArchitecture
//
//  Created by tangdi on 16/3/8.
//  Copyright © 2016年 TD. All rights reserved.
//

#import <Foundation/Foundation.h>
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wobjc-missing-property-synthesis"


typedef NS_ENUM(NSInteger, XMLDictionaryAttributesMode)
{
	XMLDictionaryAttributesModePrefixed = 0, //default
	XMLDictionaryAttributesModeDictionary,
	XMLDictionaryAttributesModeUnprefixed,
	XMLDictionaryAttributesModeDiscard
};


typedef NS_ENUM(NSInteger, XMLDictionaryNodeNameMode)
{
	XMLDictionaryNodeNameModeRootOnly = 0, //default
	XMLDictionaryNodeNameModeAlways,
	XMLDictionaryNodeNameModeNever
};


static NSString *const XMLDictionaryAttributesKey   = @"__attributes";
static NSString *const XMLDictionaryCommentsKey     = @"__comments";
static NSString *const XMLDictionaryTextKey         = @"__text";
static NSString *const XMLDictionaryNodeNameKey     = @"__name";
static NSString *const XMLDictionaryAttributePrefix = @"_";






@interface XMLDictionar : NSObject <NSCopying>

+ (XMLDictionar *)sharedInstance;

@property (nonatomic, assign) BOOL collapseTextNodes; // defaults to YES
@property (nonatomic, assign) BOOL stripEmptyNodes;   // defaults to YES
@property (nonatomic, assign) BOOL trimWhiteSpace;    // defaults to YES
@property (nonatomic, assign) BOOL alwaysUseArrays;   // defaults to NO
@property (nonatomic, assign) BOOL preserveComments;  // defaults to NO
@property (nonatomic, assign) BOOL wrapRootNode;      // defaults to NO

@property (nonatomic, assign) XMLDictionaryAttributesMode attributesMode;
@property (nonatomic, assign) XMLDictionaryNodeNameMode nodeNameMode;

- (NSDictionary *)dictionaryWithParser:(NSXMLParser *)parser;
- (NSDictionary *)dictionaryWithData:(NSData *)data;
- (NSDictionary *)dictionaryWithString:(NSString *)string;
- (NSDictionary *)dictionaryWithFile:(NSString *)path;

@end





@interface NSDictionary (XMLDictionary)

+ (NSDictionary *)dictionaryWithXMLParser:(NSXMLParser *)parser;
+ (NSDictionary *)dictionaryWithXMLData:(NSData *)data;
+ (NSDictionary *)dictionaryWithXMLString:(NSString *)string;
+ (NSDictionary *)dictionaryWithXMLFile:(NSString *)path;

- (NSDictionary *)attributes;
- (NSDictionary *)childNodes;
- (NSArray *)comments;
- (NSString *)nodeName;
- (NSString *)innerText;
- (NSString *)innerXML;
- (NSString *)XMLString;

- (NSArray *)arrayValueForKeyPath:(NSString *)keyPath;
- (NSString *)stringValueForKeyPath:(NSString *)keyPath;
- (NSDictionary *)dictionaryValueForKeyPath:(NSString *)keyPath;

@end


@interface NSString (XMLDictionary)

- (NSString *)XMLEncodedString;

@end


#pragma GCC diagnostic pop

