//
//  NSString+Category.h
//  BM
//
//  Created by txooo on 17/4/17.
//  Copyright © 2017年 领琾. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,ImageSizeType) {
    ImageSizeTypeDefault,    //250*250
    ImageSizeTypeThumbnail,  //80*80
    ImageSizeTypeFullScreen, //480*480
    ImageSizeTypeOriginal
};

@interface NSString (TXCategory)

- (BOOL)isEmpty;
- (BOOL)validateMobile;
- (BOOL)validateUrl;
- (BOOL)validateEmail;
- (BOOL)containChinese;
- (BOOL)stringIsPureInt;
//true -> EAN编码 false -> 自定义编码
- (BOOL)validataBarCodeEANLevel;


- (NSString *)pinyin;
- (NSString *)pinyinInitial;

- (NSString *)dateConvertToYYMMDDHHMM;
- (NSString *)dateConvertToYYMMDDHHMMSS;
- (NSString *)dateWithoutTConvertToYYMMDDHHMMSS;
- (NSString *)dateConvertToYYMMDD;
- (NSString *)dateConvertToHHMMSS;
- (NSString *)dateConvertToHHMM;
- (NSString *)dateConvertToMMDD;
- (NSString *)dateConvertToYYMMDDWithPoint;
- (NSString *)dateOfWeekDay;
- (NSString *)dateWithoutTConvertFormat:(NSString *)format;
- (NSString *)dateWithFormat:(NSString *)orignFormat convertFormat:(NSString *)resultFormat;
- (NSString *)dealNullString;
- (NSString *)afterDateWithYears:(NSInteger)years
                          months:(NSInteger)months
                            days:(NSInteger)days
                          format:(NSString *)format;

- (NSInteger)daysAfterDateString:(NSString *)dateString format:(NSString *)format;

- (NSString *)md5String;
- (NSString *)sha1;
+ (NSString *)uuid;

- (CGSize)sizeForFont:(UIFont *)font;
- (CGSize)sizeForFont:(UIFont*)font
    constrainedToSize:(CGSize)constraint
        lineBreakMode:(NSLineBreakMode)lineBreakMode;
- (CGSize)calculateSize:(CGSize)size font:(UIFont *)font;
- (CGSize)calculateSize:(CGSize)size lineSpace:(CGFloat)lineSpace font:(UIFont *)font;
- (CGSize)calculateAttributes:(NSDictionary *)attributes size:(CGSize)size;
- (NSAttributedString *)attributeWithStr:(NSString * )str color:(UIColor *)color font:(UIFont *)font;
- (NSAttributedString *)attributeWithStr:(NSString * )str color:(UIColor *)color font:(UIFont *)font withLastStringColor:(UIColor *)otherColor font:(UIFont *)otherFont;

//url编码/解码
- (NSString *)encodeURLPercentEscapeString;
- (NSString *)decodeURLPercentEscapeString;

- (NSString *)imageUrlWithImageSize:(ImageSizeType)ImageSizeType;
//获取时间差
- (NSDateComponents *)componentsDateString:(NSString *)dateString;
@end
