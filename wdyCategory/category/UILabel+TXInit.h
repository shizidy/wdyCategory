//
//  UILabel+TXInit.h
//  TXToolbox
//
//  Created by txooo on 17/5/15.
//  Copyright © 2017年 领琾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (TXInit)
+ (instancetype)labelWith:(NSString *)text;

+ (instancetype)labelWith:(NSString *)text textColor:(UIColor *)color;

+ (instancetype)labelWith:(NSString *)text textColor:(UIColor *)color backgroundColor:(UIColor *)bgColor;

+ (instancetype)centerlabelWith:(NSString *)text;

+ (instancetype)labelWith:(NSString *)text font:(UIFont *)font;

+ (instancetype)labelWith:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor;

+ (instancetype)labelWith:(NSString *)text boldFont:(CGFloat)size;

+ (instancetype)centerlabelWith:(NSString *)text font:(UIFont *)font;

+ (instancetype)centerlabelWith:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor;

+ (instancetype)centerlabelWith:(NSString *)text boldFont:(CGFloat)size;

+(UILabel*)labelWithRect:(CGRect)rect text:(NSString*)text font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor alignment:(NSTextAlignment)alignment textColor:(UIColor*)textColor;

@end
