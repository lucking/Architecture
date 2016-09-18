//
//  Common.m
//  ZM_BaseViewController
//
//  Created by tangdi on 15/6/12.
//  Copyright (c) 2015年 ZM. All rights reserved.
//

#import "Common.h"
#import "JSONKit.h"
#import "EncodeDecode.h"

#import "CommonCrypto/CommonDigest.h" // md5加密：使用

// 加密密钥
#define  Sign_Key  @"192006250b4c09247ec02edce69f6a2d"

@implementation Common


//======================="  特殊判断  "=================================

#pragma mark 判断登录密码格式
+ (BOOL)isCharAndNumber:(NSString*)mystring
{
    //   NSString *mystring = @"Letter123";
    // 数字和字符混合组成 (不能有特殊符号，不能有空格)
    NSCharacterSet *disallowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789QWERTYUIOPLKJHGFDSAZXCVBNMqwertyuioplkjhgfdsazxcvbnm"] invertedSet];
    NSRange Range = [mystring rangeOfCharacterFromSet:disallowedCharacters];
    // 不能全是数字
    NSCharacterSet *CharSet1= [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    NSRange Range1= [mystring rangeOfCharacterFromSet:CharSet1];
    // 不能全是字母
    NSCharacterSet *CharSet2 = [[NSCharacterSet characterSetWithCharactersInString:@"QWERTYUIOPLKJHGFDSAZXCVBNMqwertyuioplkjhgfdsazxcvbnm"] invertedSet];
    NSRange Range2= [mystring rangeOfCharacterFromSet:CharSet2];
    
    NSLog(@"---> mystring.length：%lu",(unsigned long)mystring.length);
    if (mystring.length>=6 && mystring.length<=16) {//只能为6～16
        
        if (Range.location == NSNotFound){          //只能由数字和字符混合组成
            if (Range1.location != NSNotFound) {    //不能全是数字
                if (Range2.location != NSNotFound) {//不能全是字母
                    
                    return YES;
                    
                }else return NO;
            }else return NO;
        }else return NO;
    }else return NO;
}



//========="  验证邮箱、手机号、身份证、qq  "=================================

static NSString *emailRegex=@"^([a-zA-Z0-9]+[_|\\_|\\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\\_|\\.]?)*[a-zA-Z0-9]+\\.[a-zA-Z]{2,3}$";
static NSString *qqRegex=@"^[1-9][0-9]{4,9}$";
static NSString *mobileNumberRegex=@"^1[0-9]{10,10}$";
static NSString *passwordRegex=@"^[a-zA-Z0-9]{8,17}$";

+(BOOL)validateCheck:(NSString *)str stringType:(VALIDATE_CHECK)type
{
    NSError *error;
    NSRegularExpression *regex;
    NSTextCheckingResult *result;
    NSString *regexStr = @"";
    if(type==VALIDATE_CHECK_EMAIL)
    {
        regexStr= emailRegex;
    }
    else if(type==VALIDATE_CHECK_QQ)
    {
        regexStr= qqRegex;
    }
    else if(type==VALIDATE_CHECK_MOBILE)
    {
        regexStr= mobileNumberRegex;
    }
    else if(type==VALIDATE_CHECK_PASSWORD)
    {
        regexStr= passwordRegex;
    }
    regex=[NSRegularExpression regularExpressionWithPattern:regexStr options:0 error:&error];
    result=[regex firstMatchInString:str options:0 range:NSMakeRange(0, [str length])];
    if(!result){
        return NO;
    }else{
        return YES;
    }
}

#pragma mark 验证邮箱
#pragma
+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
#pragma mark 验证手机号
#pragma
//1.简单的判断方法
+ (BOOL)validatePhone:(NSString *)phone
{   //这只是简单地判断手机号格式。其实手机的格式还是有一点复杂的
    //手机号以13，15，17，18开头
    NSString *phoneRegex = @"1[3|5|7|8|][0-9]{9}";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:phone];
}

#pragma mark 身份证识别2 准确
#pragma
+(BOOL)checkIDCardNum:(NSString*)cardNo
{
    if (cardNo.length != 18) {
        return  NO;
    }
    NSArray* codeArray = [NSArray arrayWithObjects:@"7",@"9",@"10",@"5",@"8",@"4",@"2",@"1",@"6",@"3",@"7",@"9",@"10",@"5",@"8",@"4",@"2", nil];
    NSDictionary* checkCodeDic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"1",@"0",@"X",@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2", nil]  forKeys:[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil]];
    
    NSScanner* scan = [NSScanner scannerWithString:[cardNo substringToIndex:17]];
    int val;
    BOOL isNum = [scan scanInt:&val] && [scan isAtEnd];
    if (!isNum) {
        return NO;
    }
    int sumValue = 0;
    
    for (int i =0; i<17; i++) {
        sumValue+=[[cardNo substringWithRange:NSMakeRange(i , 1) ] intValue]* [[codeArray objectAtIndex:i] intValue];
    }
    NSString* strlast = [checkCodeDic objectForKey:[NSString stringWithFormat:@"%d",sumValue%11]];
    
    if ([strlast isEqualToString: [[cardNo substringWithRange:NSMakeRange(17, 1)]uppercaseString]]) {
        return YES;
    }
    return  NO;
}


//==========================="   尺寸   "================================
#pragma mark 计算字符串的尺寸高度_height：宽度固定
+ (float)getTextSizeHeight:(NSString*)string Font:(UIFont*)myfont Width:(float)width
{
    //获取文本
    NSMutableParagraphStyle *paragraph= [[NSMutableParagraphStyle alloc]init];
    paragraph.alignment = NSLineBreakByWordWrapping;
    NSDictionary *attributeDic = @{NSFontAttributeName: myfont, NSParagraphStyleAttributeName: paragraph};
    //string
    CGSize mySize =[string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributeDic context:nil].size;
    
    //NSLog(@"-----> fontSize.height: %f \n ",mySize.height);
    float height= mySize.height + 1;// ＋1 防止四舍五入
    return height;
}
#pragma mark 计算字符串的尺寸宽度_width：高度固定
+ (float)getTextSizeWidth:(NSString*)string Font:(UIFont*)myfont  Height:(float)height
{
    //获取文本
    NSMutableParagraphStyle *paragraph= [[NSMutableParagraphStyle alloc]init];
    paragraph.alignment = NSLineBreakByWordWrapping;
    NSDictionary *attributeDic = @{NSFontAttributeName: myfont, NSParagraphStyleAttributeName: paragraph};
    //string
    CGSize mySize =[string boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributeDic context:nil].size;
    //    NSLog(@"-----> fontSize.width: %f \n ",mySize.width);
    float width= mySize.width + 1;
    return width;
}

#pragma mark  改变一种字体大小
+ (void)changeTextFontLab:(UILabel *)myLabel text:(NSString *)text font:(UIFont *)font
{
    NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:myLabel.text];
    //改变字体大小
    //NSMakeRange(5,2); //(从第几个开始，共截取的范围)
    NSRange textRang = [[noteStr string] rangeOfString:text];
    NSRange Range = NSMakeRange(textRang.location, textRang.length);
    [noteStr addAttribute:NSFontAttributeName value:font range:Range];
    [myLabel setAttributedText:noteStr];
}

#pragma mark 此方法同时只能添加一次 NSMutableAttributedString 改变一种颜色
+ (void)changeTextColorLab:(UILabel *)myLabel text:(NSString *)text color:(UIColor *)color
{
    NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:myLabel.text];
    //NSRange Range = NSMakeRange(5,2);//(从第几个开始，共截取的范围)
    //改变颜色
    NSRange textRang = [[noteStr string] rangeOfString:text];
    NSRange redRange = NSMakeRange(textRang.location, textRang.length);
    [noteStr addAttribute:NSForegroundColorAttributeName value: color range:redRange];
    [myLabel setAttributedText:noteStr];
}
#pragma mark 改变label的文本的 两种颜色
+ (void)changeTextColorLab:(UILabel *)myLabel textA:(NSString *)textA  colorA:(UIColor *)colorA  textB:(NSString *)textB  color:(UIColor *)colorB{
    
    NSMutableAttributedString *MutAttStr = [[NSMutableAttributedString alloc] initWithString:myLabel.text];
    //改变颜色1
    NSRange RangeA = NSMakeRange([[MutAttStr string] rangeOfString:textA].location, [[MutAttStr string] rangeOfString: textA].length);
    [MutAttStr addAttribute:NSForegroundColorAttributeName value:colorA range:RangeA];
    //改变颜色2
    NSRange RangeB = NSMakeRange([[MutAttStr string] rangeOfString:textB].location, [[MutAttStr string] rangeOfString: textB].length);
    [MutAttStr addAttribute:NSForegroundColorAttributeName value:colorB range:RangeB];
    
    [myLabel setAttributedText:MutAttStr];
}

#pragma mark  改变一种文本的颜色、字体大小
+ (void)changeTextColorAndFontLab:(UILabel *)myLabel text:(NSString *)text color:(UIColor *)color font:(float)font
{
    NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:myLabel.text];
    NSRange textRang = [[noteStr string] rangeOfString:text];
    NSRange Range = NSMakeRange(textRang.location, textRang.length);
    
    UIFont * myFont = [UIFont systemFontOfSize:font];
    [noteStr addAttribute:NSForegroundColorAttributeName value:color range:Range];
    [noteStr addAttribute:NSFontAttributeName value:myFont range:Range];
    
    [myLabel setAttributedText:noteStr];
}

//#pragma mark  改变一种文本的颜色
//+ (NSMutableAttributedString *)setLabelParaStr:(NSString *)rangeStr AllStr:(NSString *)allStr WithColor:(UIColor *)color
//{
//    NSRange range = [allStr rangeOfString:rangeStr];
//    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc]initWithString:allStr];
//    [attribute addAttributes:@{NSForegroundColorAttributeName:color} range:range];
//    
//    return attribute;
//}


#pragma mark 改变label的文本的 两种以上颜色及字体
+ (void)changeTextColorLab:(UILabel *)myLabel
               stringArray:(NSArray *)strArray
                colorArray:(NSArray *)colorArray
                 fontArray:(NSArray *)fontArray {
    
    NSMutableAttributedString *mutAttStr = [[NSMutableAttributedString alloc] initWithString:myLabel.text];
    
    NSString* _str = nil;
    UIFont*  _font = nil;
    NSRange _range = NSMakeRange(0, 0);
    
    for (int i=0; i<strArray.count; i++) {
        NSLog(@"---> strArray.count = %ld",strArray.count);
        _str = strArray[i];
        NSUInteger location = [[mutAttStr string] rangeOfString:_str].location;
        NSUInteger length   = [[mutAttStr string] rangeOfString:_str].length;
        _range = NSMakeRange(location, length);
        // 改变颜色
        if (colorArray.count >= (i+1)) {
            [mutAttStr addAttribute:NSForegroundColorAttributeName value:colorArray[i] range:_range];
        }
        // 改变字体大小
        if (fontArray.count >= (i+1)) {
            _font = [UIFont systemFontOfSize:[fontArray[i] floatValue]];
            [mutAttStr addAttribute:NSFontAttributeName value:_font range:_range];
        }
    }
    [myLabel setAttributedText:mutAttStr];
}



#pragma mark 改变label分割开的字符 为一种颜色
+ (void)changeTextColorLab:(UILabel *)myLabel color:(UIColor *)myColor{
    
    NSMutableAttributedString *MutAttStr = [[NSMutableAttributedString alloc] initWithString:myLabel.text];
    //改变颜色1
    NSRange RangeA = NSMakeRange([[MutAttStr string] rangeOfString: @"天"].location, [[MutAttStr string] rangeOfString: @"天"].length);
    [MutAttStr addAttribute:NSForegroundColorAttributeName value: myColor range:RangeA];
    //改变颜色2
    NSRange RangeB = NSMakeRange([[MutAttStr string] rangeOfString: @"小时"].location, [[MutAttStr string] rangeOfString: @"小时"].length);
    [MutAttStr addAttribute:NSForegroundColorAttributeName value: myColor range:RangeB];
    //改变颜色3
    NSRange RangeC = NSMakeRange([[MutAttStr string] rangeOfString: @"分"].location, [[MutAttStr string] rangeOfString: @"分"].length);
    [MutAttStr addAttribute:NSForegroundColorAttributeName value: myColor range:RangeC];
    //改变颜色4
    NSRange RangeD = NSMakeRange([[MutAttStr string] rangeOfString: @"秒"].location, [[MutAttStr string] rangeOfString: @"秒"].length);
    [MutAttStr addAttribute:NSForegroundColorAttributeName value: myColor range:RangeD];

    
    [myLabel setAttributedText:MutAttStr];
}

#pragma mark  UILabel：给一段文本，添加下划线、改变颜色
+ (void)addUnderlineToLab:(UILabel *)myLabel withText:(NSString *)text color:(UIColor *)myColor
{
	NSMutableAttributedString *contentStr = [[NSMutableAttributedString alloc] initWithString:myLabel.text];
	NSRange textRang = [[contentStr string] rangeOfString:text];
	NSRange Range = NSMakeRange(textRang.location, textRang.length);
	//下划线
	[contentStr addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:Range];
	//改变颜色
	if (myColor != nil) {
		[contentStr addAttribute:NSForegroundColorAttributeName value:myColor range:Range];
	}
	[myLabel setAttributedText:contentStr];
}
// 字体：STHeitiSC-Light
+ (UIFont *)fontOfSize:(CGFloat)fontSize {
	return [UIFont fontWithName:@"STHeitiSC-Light" size:fontSize];
}
#pragma mark //字间距：UILabel
+ (void)characterSpaceLabel:(UILabel *)mylabel Space:(long)mySpaceNum
{
    //字间距
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&mySpaceNum);
    
    NSMutableAttributedString *noteStr =[[NSMutableAttributedString alloc]initWithString:mylabel.text];
    NSRange textRang = [[noteStr string] rangeOfString:mylabel.text];
    NSRange Range = NSMakeRange(textRang.location, textRang.length);
    [noteStr addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:Range];
    [mylabel setAttributedText:noteStr];
}

#pragma mark //字间距：UITextField
+ (void)characterSpaceTextField:(UITextField *)mytextField Space:(long)mySpaceNum
{
    //字间距
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&mySpaceNum);
    
    NSMutableAttributedString *noteStr =[[NSMutableAttributedString alloc]initWithString:mytextField.text];
    NSRange textRang = [[noteStr string] rangeOfString:mytextField.text];
    NSRange Range = NSMakeRange(textRang.location, textRang.length);
    [noteStr addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:Range];
    [mytextField setAttributedText:noteStr];
}

// UILabel设置行间距等属性:


//-----------------------"  UIButton  "---------------------------------

#pragma mark  UILabel：给一段文本，添加下划线、改变颜色
+ (void)addUnderlineToButton:(UIButton *)myBtn withText:(NSString *)text color:(UIColor *)myColor
{
	NSMutableAttributedString *contentStr = [[NSMutableAttributedString alloc] initWithString:myBtn.titleLabel.text];
	NSRange textRang = [[contentStr string] rangeOfString:text];
	NSRange Range = NSMakeRange(textRang.location, textRang.length);
	//下划线
	[contentStr addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:Range];

	//改变颜色
	if (myColor != nil) {
		[contentStr addAttribute:NSForegroundColorAttributeName value:myColor range:Range];
	}
	[myBtn setAttributedTitle:contentStr forState:UIControlStateNormal];
}






//#pragma mark - AlertView2
//- (void)showAlertMessage:(NSString *)message
//{
//    UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:message preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
//    [alertVC addAction:okAction];
//    
//    [self.view.window.rootViewController presentViewController:alertVC animated:NO completion:^{
//        
//    }];
//}
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
    
    
//    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
//    if (complete != nil) {
//        [window.rootViewController presentViewController:alertVC animated:NO completion:^{
//            complete();//有回调
//        }];
//    }else{
//        [window.rootViewController presentViewController:alertVC animated:NO completion:nil];
//    }
//    
//    [AppDelegate GetInstance].window.rootViewController = alertVC;
    
    [[AppDelegate GetInstance].window.rootViewController presentViewController:alertVC animated:NO completion:nil];
}


//==========================="   系统   "================================

#pragma mark 获取当前系统的版本号
+ (NSString *)getCFBundleVersion{

    NSString *Versionid = [[Common getInfoDictionary] objectForKey:@"CFBundleVersion"];
    if (Versionid) {
        return Versionid;
    }
    return nil;
}
#pragma mark 获取系统配置文件
+ (NSDictionary *)getInfoDictionary
{
    NSDictionary *infoDictionary= [[NSBundle mainBundle] infoDictionary];
    return infoDictionary;
}

#pragma mark 获取系统：appID
+ (NSString *)getInfoCFBundleId
{
	NSDictionary *InfoDic= [[NSBundle mainBundle] infoDictionary];
	NSString* appID = InfoDic[@"CFBundleIdentifier"];
	return appID;
}


// 判断是否为空
+(BOOL)isNotEmpty:(id)object
{
	if (!object) {
		return NO;
	}
	else if (object && [object isEqual:[NSNull null]]){
		return NO;
	}
	else if ([object isKindOfClass:[NSNull class]]){
		return NO;
	}
	else if (object == nil) {
		return NO;
	}
	return YES;
}

/**
 *  判断字符串是否为空
 *
 *  为空：@return NO
 *  不空：@return YES
 */
+ (BOOL)isNotEmptyString:(NSString *)object {
    
    if (!object) {
        return NO;
    }
    else if (object.length == 0) {
        return NO;
    }
    else if (object == nil) {
        return NO;
    }
    else if (object && [object isEqual:[NSNull null]]){
        return NO;
    }
    else if ([object isKindOfClass:[NSNull class]]){
        return NO;
    }
    else if ([object isEqualToString:@"null"]){
        return NO;
    }
    else if ([object isEqualToString:@"<null>"]){
        return NO;
    }
    return YES;
}

// 转换为空串
+(NSString*)convertNull:(id)object
{
	if (!object) {
		return @"";
	}
    if (object && [object isEqual:[NSNull null]]){
        return @"";
    }else if ([object isKindOfClass:[NSNull class]]){
        return @"";
    }else if (object == nil) {
        return @"";
    }
    
    return object;
}
// 转换为 --
+(NSString*)convertBridge:(id)object
{
	if (!object) {
		return @"--";
	}
	else if ([object isEqualToString:@""]){
		return @"--";
	}else if (object && [object isEqual:[NSNull null]]){
		return @"--";
	}else if ([object isKindOfClass:[NSNull class]]){
		return @"--";
	}else if (object == nil) {
		return @"--";
	}
	return object;
}
// 转换空串 金额
+(NSString*)convertNulltoMoney:(id)object
{
	if (!object) {
		return @"0.00";
	}
	else if ([object isEqualToString:@""]){
		return @"0.00";
	}else if (object && [object isEqual:[NSNull null]]){
		return @"0.00";
	}else if ([object isKindOfClass:[NSNull class]]){
		return @"0.00";
	}else if (object == nil) {
		return @"0.00";
	}
	return object;
}

//==========================="   getURl   "================================
//字典不排序_拼接url
+ (NSString *)getURlStringOfIP:(NSString *)url params:(NSDictionary *)params {
    
    if (params !=nil) {
        NSArray *keysArray = [params allKeys]; //获取allKeys
        NSString *keyValue = @"", *urlStr = @"";
        for (int i=0; i<keysArray.count; i++) {
            
            keyValue = [NSString stringWithFormat:@"%@=%@",keysArray[i],params[keysArray[i]]];
            urlStr = [NSString stringWithFormat:@"%@&%@",urlStr,keyValue];
        }
        NSMutableString* mutStr = [[NSMutableString alloc] initWithString:urlStr];
        [mutStr deleteCharactersInRange:NSMakeRange(0,1)];
        mutStr = [NSMutableString stringWithFormat:@"%@?%@",url,mutStr];
        
        return mutStr;
    }else {
        return url;
    }
}
// 字典排序_拼接url
+ (NSString *)getURlStringOfIP:(NSString *)url sortParams:(NSDictionary *)params {
    
    if (params ==nil) {
        return @"";
    }else {
        NSArray *keysArray = [params allKeys];
        NSArray *sortedArray = [keysArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
            return [obj1 compare:obj2 options:NSNumericSearch]; //allKeys排列顺序
        }];
        
        NSMutableString* tempStr= [[NSMutableString alloc] initWithString:@""];
        for (NSString *key in sortedArray) {
            NSString *value = [params objectForKey: key];
            tempStr = [NSMutableString stringWithFormat:@"%@&%@=%@",tempStr,key,value];
        }
        [tempStr deleteCharactersInRange:NSMakeRange(0,1)]; //删除字符串：(开始位置，删除个数)
        tempStr = [NSMutableString stringWithFormat:@"%@?%@",url,tempStr];
        //NSLog(@"---> tempStr: %@ \n ",tempStr);
        return tempStr;
    }
}


// 验证签名：密钥加密
+ (NSString *)getSign:(NSDictionary *)params {
    
    if (params ==nil) {
        return @"";
    }else {
        
        NSArray *keysArray = [params allKeys];//获取所有键存到数组
        NSArray *sortedArray = [keysArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
            
            return [obj1 compare:obj2 options:NSNumericSearch]; //由于allKeys返回的是无序数组，这里我们要排列它们的顺序
        }];
        
        NSMutableString* tempStr= [[NSMutableString alloc] initWithString:@""];
        for (NSString *key in sortedArray) {
            
            NSString *value = [params objectForKey: key];
            tempStr = [NSMutableString stringWithFormat:@"%@&%@=%@",tempStr,key,value];
        }
        [tempStr deleteCharactersInRange:NSMakeRange(0,1)]; //删除字符串：(开始位置，删除个数)
        NSString* params_key = [NSString stringWithFormat:@"%@&key=%@",tempStr,Sign_Key];
        NSLog(@"---> params_key: %@ \n ",params_key);
        
        NSString* sign_md5 = [EncodeDecode md5:params_key]; // 9A0A8659F005D6984697E2CA0A9CF3B7
        NSLog(@"---> sign_md5: %@",sign_md5);
        
        return sign_md5;
    }
}
/**
 *  转变为json数据格式：params 传参
 *
 *  @return 请求的json数据格式参数
 */
+ (NSDictionary *)JsonParameters:(NSDictionary *)params {
    
    NSString* mySign = nil;
    NSDictionary* parameters = nil;
    if (params ==nil) {
        parameters = @{@"REQ_BODY":@"",
                       @"REQ_HEAD":@{@"sign":@""}
                       };
    }else{
        mySign = [Common getSign:params];// 验证签名：密钥加密
        
        parameters = @{@"REQ_BODY":params,
                       @"REQ_HEAD":@{@"sign":mySign}
                       };
    }
    NSDictionary* JSON_Params = @{@"REQ_MESSAGE":[parameters JSONString]};
    //NSSLog(@"---> JSON_Params: %@ \n ",	JSON_Params);
    
    return JSON_Params;
}





//============================"  网络电话的 "=============================

//字典排序_拼接url
+ (NSString *)getCallURlStringOfIP:(NSString *)url sortParams:(NSDictionary *)params {
    
    if (params ==nil) {
        return [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }else {
        NSArray *keysArray = [params allKeys];
        NSArray *sortedArray = [keysArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
            return [obj1 compare:obj2 options:NSNumericSearch]; //allKeys排列顺序
        }];
        
        NSMutableString* tempStr= [[NSMutableString alloc] initWithString:@""];
        for (NSString *key in sortedArray) {
            NSString *value = [params objectForKey: key];
            tempStr = [NSMutableString stringWithFormat:@"%@&%@=%@",tempStr,key,value];
        }
        [tempStr deleteCharactersInRange:NSMakeRange(0,1)]; //删除字符串：(开始位置，删除个数)
        
        NSString *urlStr = (NSString *)[NSMutableString stringWithFormat:@"%@?%@",url,tempStr];
        //NSLog(@"---> urlStr = %@ \n ",urlStr);
        
        return [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
}


// 加密密钥
#define  callSign_Key  @"32815741"

// 验证签名：密钥加密
+ (NSString *)getSignByCall:(NSDictionary *)params {
    
    if (params ==nil) {
        return @"";
    }else {
        NSArray *keysArray = [params allKeys];
        NSArray *sortedArray = [keysArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
            
            return [obj1 compare:obj2 options:NSNumericSearch]; //allKeys排列顺序
        }];
        NSMutableString* tempStr= [[NSMutableString alloc] initWithString:@""];
        for (NSString *key in sortedArray) {
            
            NSString *value = [params objectForKey: key];
            tempStr = [NSMutableString stringWithFormat:@"%@&%@=%@",tempStr,key,value];
        }
        //        [tempStr deleteCharactersInRange:NSMakeRange(0,1)];
        tempStr = [NSMutableString stringWithFormat:@"%@%@",tempStr,callSign_Key];
        NSLog(@"---> paramsSign_key: %@ \n ",tempStr);
        
        NSString* sign_md5 = [Common md5:tempStr];
        //NSLog(@"---> sign_md5: %@  \n ",sign_md5);
        return sign_md5;
    }
}
// 转变为json数据格式：params 传参 @return 请求的json数据格式参数
+ (NSDictionary *)getCallJsonParameters:(NSDictionary *)params {
    
    NSMutableDictionary* mutParams = [[NSMutableDictionary alloc] initWithDictionary:params];
    NSString* mySign = [Common getSignByCall:params];// 验证签名：密钥加密
    [mutParams setObject:mySign forKey:@"sign"];
    
    NSLog(@"---> mutParams: %@ \n ",mutParams);
    return mutParams;
}

/**
 *  字符串md5加密
 */
+ (NSString *)md5:(NSString *) inPutText
{
    const char *cStr = [inPutText UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}
//====================================================================








//==========================="   动画   "================================

#pragma mark 导航视图 动画
+(void)pushViewController:(UIViewController *)nav
{
    UIWindow *window=[[[UIApplication sharedApplication] delegate] window];
    window.rootViewController=nav;
    
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:window cache:YES];
    nav.modalTransitionStyle = UIModalTransitionStyleCoverVertical;    //从底部滑入
    //nav.modalPresentationStyle =  UIModalPresentationFullScreen;
    [UIView commitAnimations];
}

#pragma mark 普通动画
+(void)flipView:(UIView *)myView Rect:(CGRect)myRect forView:(UIView *)view
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:view cache:YES];
    myView.frame = myRect;
    [UIView commitAnimations];
    
}
#pragma mark 普通动画
+(void)flipView:(UIView *)myView Rect:(CGRect)myRect forView:(UIView *)view timeInterval:(NSTimeInterval)myTime
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:myTime];
	[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:view cache:YES];
	myView.frame = myRect;
	[UIView commitAnimations];

}
// 判断手机型号
+ (NSString *)ISIPHONEXX {
	NSLog(@"SSWIDTH = %@",@(SSWIDTH));
	NSLog(@"SSHEIGHT= %@",@(SSHEIGHT));

	if (IS_IPHONE4) {			NSLog(@"========= IS_IPHONE4 ");
		return @"IS_IPHONE4";

	}else if (IS_IPHONE5){		NSLog(@"========= IS_IPHONE5 ");
		return @"IS_IPHONE5";

	}else if (IS_IPHONE6){		NSLog(@"========= IS_IPHONE6 ");
		return @"IS_IPHONE6";

	}else if (IS_IPHONE6p){		NSLog(@"========= IS_IPHONE6p ");
		return @"IS_IPHONE6p";
	}
	return @"IS_IPHONExx未知";
}


+ (CGFloat)getWidth:(NSInteger)width {
    if (IS_IPHONE45){
        return (width*(SSWIDTH/320));
    }else if (IS_IPHONE6){
        return (width*(SSWIDTH/375));
    }else {
        return (width*(SSWIDTH/414));
    }
}

+ (CGFloat)getHeight:(NSInteger)height {
    if (IS_IPHONE4){
        return (height*(SSHEIGHT/480));
    }else if (IS_IPHONE5){
        return (height*(SSHEIGHT/568));
    }else if (IS_IPHONE6){
        return (height*(SSHEIGHT/667));
    }else {
        return (height*(SSHEIGHT/736));
    }
}



// 判断屏幕类型，普通还是视网膜
+ (float)scale {
	float scale = [[UIScreen mainScreen] scale];
	if (scale == 1) {
		NSLog(@"---> 普通屏幕1");
	}else if (scale == 2) {
		NSLog(@"---> 视网膜屏幕2");
	}else if (scale == 3) {
		NSLog(@"---> 高视网膜屏幕3");
	}else{
		NSLog(@"unknow screen mode !");
	}
	return scale;
}


// 判断是否是模拟器
+ (BOOL)isSimulator {
	size_t size;
	sysctlbyname("hw.machine", NULL, &size, NULL, 0);
	char *machine = malloc(size);
	sysctlbyname("hw.machine", machine, &size, NULL, 0);
	NSString *model = [NSString stringWithUTF8String:machine];
	free(machine);
	return [model isEqualToString:@"x86_64"] || [model isEqualToString:@"i386"];
}


//获取当前屏幕显示的_viewController
+ (UIViewController *)getCurrentVC {

	UIWindow *window = [[UIApplication sharedApplication] keyWindow];
	UIViewController *currentVC = [window visibleViewController];
	//NSLog(@"------> common_currentVC = %@ \n ",currentVC);
	return currentVC;
}


@end

