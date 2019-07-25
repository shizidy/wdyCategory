//
//  NSString+Category.m
//  BM
//
//  Created by txooo on 17/4/17.
//  Copyright © 2017年 领琾. All rights reserved.
//

#import "NSString+TXCategory.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (TXCategory)

-(BOOL)isEmpty {
    if ([self isEqual:[NSNull null]]) {
        return YES;
    } else if ([self isKindOfClass:[NSNull class]]){
        return YES;
    } else if (self == nil){
        return YES;
    } else if ([@"" isEqualToString:self]){
        return YES;
    } else if (!self) {
        return YES;
    }
    return NO;
}

- (BOOL)validateMobile {
    //    电信号段:133/153/180/181/189/177/166/199
    //    联通号段:130/131/132/155/156/185/186/145/176
    //    移动号段:134/135/136/137/138/139/150/151/152/157/158/159/182/183/184/187/188/147/178
    //    虚拟运营商:170
    //测试号段 1224444 匹配新号段
    NSString *MOBILE = @"^1(2[2]|3[0-9]|4[57]|5[0-35-9]|6[0-9]|8[0-9]|7[0-9]|9[0-9])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:self];
}

/**
 * 网址正则验证 1或者2使用哪个都可以
 *
 *  @return 返回值类型为BOOL
 */
- (BOOL)validateUrl {
    NSError *error;
    // 正则1 必须带http
    //    NSString *regulaStr =@"\\bhttps?://[a-zA-Z0-9\\-.]+(?::(\\d+))?(?:(?:/[a-zA-Z0-9\\-._?,'+\\&%$=~*!():@\\\\]*)+)?";
    // 正则2
    NSString *regulaStr =@"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSArray *arrayOfAllMatches = [regex matchesInString:self options:0 range:NSMakeRange(0, [self length])];
    
    for (NSTextCheckingResult *match in arrayOfAllMatches){
        if ([self substringWithRange:match.range]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)validateEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    
    return [emailTest evaluateWithObject:self];
}

- (BOOL)containChinese {
    for(int i=0; i< [self length]; i++) {
        int a = [self characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)stringIsPureInt {
    NSScanner *scan = [NSScanner scannerWithString:self];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

//条码标准校检
- (BOOL)validataBarCodeEANLevel {
    if (!self.length) {
        return NO;
    }else if (self.length < 8 || self.length > 14) {
        return NO;
    }
    //偶数位, 奇数位和
    int evenSum = 0, oddSum = 0, checkCode = 0;
    NSInteger i = 0;
    while (i < self.length) {
        int num = [[self substringWithRange:NSMakeRange(self.length - i - 1, 1)] intValue];
        if (i == 0) {
            checkCode = num;
        }
        if (i > 0 && i % 2 == 1) {
            evenSum += num;
        }
        if (i > 1 && i % 2 == 0) {
            oddSum += num;
        }
        i++;
    }
    //倒序:校检码 = 10(10的最小整数倍) - 所有偶数位之和乘以3+第三位起所有奇数位之和 % 10
    int resultCheckNumber = 10 - (evenSum * 3 + oddSum) % 10;
    if (resultCheckNumber == checkCode || resultCheckNumber % 10 == 0) {
        return YES;
    }
    return NO;
}

- (NSString *)pinyin {
    NSMutableString *str = [self mutableCopy];
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics, NO);
    return [str stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (NSString *)pinyinInitial {
    if ([self isEmpty]) {
        return nil;
    }
    NSMutableString *str = [self mutableCopy];
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics, NO);
    
    NSArray *word = [str componentsSeparatedByString:@" "];
    NSMutableString *initial = [[NSMutableString alloc] initWithCapacity:str.length / 3];
    for (NSString *str in word) {
        [initial appendString:[str substringToIndex:1]];
    }
    
    return initial;
}

- (NSString *)dateConvertToYYMMDDHHMM {
    if ([self isEmpty]) {
        return @"";
    }
    NSString *date = [self stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    return [date substringToIndex:16];
}

- (NSString *)dateConvertToYYMMDDHHMMSS {
    if ([self isEmpty]) {
        return @"";
    }
    NSString *dateStr = [[[self stringByReplacingOccurrencesOfString:@"T" withString:@" "] componentsSeparatedByString:@"."] firstObject];
    return dateStr;
}

- (NSString *)dateWithoutTConvertToYYMMDDHHMMSS {
    if ([self isEmpty]) {
        return @"";
    }
    NSArray *array = [self componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"/ "]];
    if (array.count >=3) {
        return [NSString stringWithFormat:@"%@-%@-%@ %@",array[2],array.firstObject,array[1],array.lastObject];
    }
    return self;
}

- (NSString *)dateConvertToYYMMDD {
    if ([self isEmpty]) {
        return @"";
    }
    return [self substringToIndex:10];
}

- (NSString *)dateConvertToHHMMSS {
    if (self.isEmpty) {
        return @"";
    }
    return [[self componentsSeparatedByString:@"T"].lastObject componentsSeparatedByString:@"."].firstObject;
}

- (NSString *)dateConvertToHHMM {
    if (self.isEmpty) {
        return @"";
    }
    return [[[self componentsSeparatedByString:@"T"].lastObject componentsSeparatedByString:@"."].firstObject substringToIndex:5];
}

- (NSString *)dateConvertToMMDD {
    if (self.isEmpty) {
        return @"";
    }
    return [[self componentsSeparatedByString:@"T"].firstObject substringFromIndex:5];
}

- (NSString *)dateConvertToYYMMDDWithPoint {
    if ([self isEmpty]) {
        return @"";
    }
    return [[self substringToIndex:10] stringByReplacingOccurrencesOfString:@"-" withString:@"."];
}

- (NSString *)dateOfWeekDay {
    if ([self isEmpty]) {
        return @"";
    }
    NSDateFormatter *myDateFormatter = [[NSDateFormatter alloc] init];
    [myDateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *formatterDate=[myDateFormatter dateFromString:self];
    
    NSDateFormatter *outputFormatter=[[NSDateFormatter alloc]init];
    [outputFormatter setDateFormat:@"EEEE-MMMM-d"];
    NSString *outputDateStr=[outputFormatter stringFromDate:formatterDate];
    NSArray *weekArray=[outputDateStr componentsSeparatedByString:@"-"];
    
    return [weekArray objectAtIndex:0];
}

- (NSString *)dateWithoutTConvertFormat:(NSString *)format {
    return [self dateWithFormat:@"yyyy-MM-dd HH:mm:ss" convertFormat:format];
}

- (NSString *)dateWithFormat:(NSString *)orignFormat convertFormat:(NSString *)resultFormat {
    if ([self isEmpty]) {
        return @"";
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = orignFormat;
    NSDate *date = [formatter dateFromString:self];
    
    NSDateFormatter *resFormatter = [[NSDateFormatter alloc] init];
    resFormatter.dateFormat = resultFormat;
    return [resFormatter stringFromDate:date];
}

-(NSString *)dealNullString{
    NSString * string = nil;
    if ([self isEqual:[NSNull null]] ||([self isEqualToString:@"null"]) || ([self isEqualToString:@"(null)"]) || ([self isEqualToString:@"<null>"])) {
        string = @"";
    }else{
        string = self;
    }
    return string;
}

- (NSString *)afterDateWithYears:(NSInteger)years months:(NSInteger)months days:(NSInteger)days format:(NSString *)format {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    
    NSDate *nowDate = [dateFormatter dateFromString:self];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    
    [adcomps setYear:years];
    
    [adcomps setMonth:months];
    
    [adcomps setDay:days];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:nowDate options:0];
    NSString *reslutDate = [dateFormatter stringFromDate:newdate];
    return reslutDate;
}


- (NSString *)md5String {
    const char * Cstr = [self UTF8String];
    unsigned char buff[16];
    CC_MD5(Cstr, (CC_LONG)strlen(Cstr), buff);
    NSMutableString *strrr = [NSMutableString string];
    for (int i = 0; i < 16; i ++) {
        [strrr appendFormat:@"%02x",buff[i]];
    }
    return strrr;
}

- (NSString *)sha1 {
    // see http://www.makebetterthings.com/iphone/how-to-get-md5-and-sha1-in-objective-c-ios-sdk/
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

+ (NSString *)uuid {
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    assert(uuid != NULL);
    CFStringRef uuidStr = CFUUIDCreateString(NULL, uuid);
    return (__bridge NSString *)uuidStr;
}

- (CGSize)sizeForFont:(UIFont *)font {
    if ([self respondsToSelector:@selector(sizeWithAttributes:)]) {
        NSDictionary* attribs = @{NSFontAttributeName:font};
        return ([self sizeWithAttributes:attribs]);
    }
    //    return ([self sizeWithFont:font]);
    return CGSizeZero;
}

- (CGSize)sizeForFont:(UIFont*)font
     constrainedToSize:(CGSize)constraint
         lineBreakMode:(NSLineBreakMode)lineBreakMode {
    NSDictionary *attributes = @{NSFontAttributeName:font};
        CGSize boundingBox = [self boundingRectWithSize:constraint options: NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
        
     CGSize size = CGSizeMake(ceil(boundingBox.width), ceil(boundingBox.height));
    return size;
}

- (CGSize)calculateSize:(CGSize)size font:(UIFont *)font {
    CGSize expectedLabelSize = CGSizeZero;
    NSDictionary *attributes = @{NSFontAttributeName:font};
    expectedLabelSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;
    return CGSizeMake(ceil(expectedLabelSize.width), ceil(expectedLabelSize.height));
}

- (CGSize)calculateSize:(CGSize)size lineSpace:(CGFloat)lineSpace font:(UIFont *)font {
    CGSize expectedLabelSize = CGSizeZero;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpace;
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    expectedLabelSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;
    return CGSizeMake(ceil(expectedLabelSize.width), ceil(expectedLabelSize.height));
}

- (CGSize)calculateAttributes:(NSDictionary *)attributes size:(CGSize)size{
    CGSize expectedLabelSize = CGSizeZero;
    expectedLabelSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;
    return CGSizeMake(ceil(expectedLabelSize.width), ceil(expectedLabelSize.height));
}

-(NSAttributedString *)attributeWithStr:(NSString *)str color:(UIColor *)color font:(UIFont *)font{
    if (!str) {
        return nil;
    }
    NSRange range = [self rangeOfString:str];
    NSMutableAttributedString * newStr = [[NSMutableAttributedString alloc] initWithString:self];
    [newStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    [newStr addAttribute:NSFontAttributeName value:font range:range];
    return  newStr;
}

- (NSAttributedString *)attributeWithStr:(NSString *)str color:(UIColor *)color font:(UIFont *)font withLastStringColor:(UIColor *)otherColor font:(UIFont *)otherFont {
    NSRange range = [self rangeOfString:str];
    NSRange range2 = NSMakeRange(range.location + range.length, self.length - (range.location + range.length));
    
    NSMutableAttributedString * newStr = [[NSMutableAttributedString alloc] initWithString:self];
    [newStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    [newStr addAttribute:NSFontAttributeName value:font range:range];
    [newStr addAttribute:NSForegroundColorAttributeName value:otherColor range:range2];
    [newStr addAttribute:NSFontAttributeName value:otherFont range:range2];
    return  newStr;
}

- (NSString *)encodeURLPercentEscapeString{
    NSString *outputStr =
    (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(NULL, /* allocator */
                                                                 (__bridge CFStringRef)self,
                                                                 NULL, /* charactersToLeaveUnescaped */
                                                                 (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                 kCFStringEncodingUTF8);
    return outputStr;
}

- (NSString *)decodeURLPercentEscapeString {
    NSMutableString *outputStr = [NSMutableString stringWithString:self];
    [outputStr replaceOccurrencesOfString:@"+"
                               withString:@""
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0,[outputStr length])];
    
    return [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
}

- (NSString *)imageUrlWithImageSize:(ImageSizeType)ImageSizeType {
    switch (ImageSizeType) {
        case ImageSizeTypeDefault:
            return [self stringByAppendingString:@",1,250,250,3"];
            break;
        case (ImageSizeTypeThumbnail):
            return [self stringByAppendingString:@",1,80,80,3"];
            break;
        case (ImageSizeTypeFullScreen):
            return [self stringByAppendingString:@",1,480,480,3"];
            break;
        case (ImageSizeTypeOriginal):
            return self;
            break;
    }
}

- (NSInteger)daysAfterDateString:(NSString *)dateString format:(NSString *)format {
    NSDateFormatter *dateFomatter = [[NSDateFormatter alloc] init];
    dateFomatter.dateFormat = format;
    NSDate *nowDate = [dateFomatter dateFromString:self];

    //字符串转NSDate格式的方法
    NSDate *valueDate = [dateFomatter dateFromString:dateString];
    //计算两个中间差值(秒)
    NSTimeInterval time = [nowDate timeIntervalSinceDate:valueDate];
    
    //开始时间和结束时间的中间相差的时间
    NSInteger days = ((NSInteger)time)/(3600*24);
    return days;
}

- (NSDateComponents *)componentsDateString:(NSString *)dateString {
    NSDateFormatter *dateFomatter = [[NSDateFormatter alloc] init];
    dateFomatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    // 截止时间data格式
    NSDate *expireDate = [dateFomatter dateFromString:dateString];
    // 当前时间data格式
    NSDate *nowDate = [dateFomatter dateFromString:self];
    // 当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 需要对比的时间数据
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth
    | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 对比时间差
    NSDateComponents *dateComponents = [calendar components:unit fromDate:nowDate toDate:expireDate options:0];
    return dateComponents;
}

@end
