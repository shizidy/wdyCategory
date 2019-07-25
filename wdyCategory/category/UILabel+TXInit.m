//
//  UILabel+TXInit.m
//  TXToolbox
//
//  Created by txooo on 17/5/15.
//  Copyright © 2017年 领琾. All rights reserved.
//

#import "UILabel+TXInit.h"

@implementation UILabel (TXInit)
+ (instancetype)labelWith:(NSString *)text {
    UILabel *label = [UILabel label];
    label.text = text;
    return label;
}

+ (instancetype)labelWith:(NSString *)text textColor:(UIColor *)color {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = color;
    return label;
}

+ (instancetype)labelWith:(NSString *)text textColor:(UIColor *)color backgroundColor:(UIColor *)bgColor {
    UILabel *label = [UILabel labelWith:text textColor:color];
    label.backgroundColor = bgColor;
    return label;
}

+ (instancetype)centerlabelWith:(NSString *)text {
    UILabel *label = [UILabel labelWith:text];
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}


+ (instancetype)labelWith:(NSString *)text font:(UIFont *)font {
    UILabel *label = [UILabel labelWith:text];
    label.font = font;
    return label;
}

+ (instancetype)labelWith:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor {
    UILabel *label = [UILabel labelWith:text font:font];
    label.textColor = textColor;
    return label;
}

+ (instancetype)labelWith:(NSString *)text boldFont:(CGFloat)size {
    UILabel *label = [UILabel labelWith:text];
    label.font = [UIFont boldSystemFontOfSize:size];
    return label;
}

+ (instancetype)centerlabelWith:(NSString *)text font:(UIFont *)font {
    UILabel *label = [UILabel centerlabelWith:text];
    label.font = font;
    return label;
}

+ (instancetype)centerlabelWith:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor {
    UILabel *label = [UILabel centerlabelWith:text font:font];
    label.textColor = textColor;
    label.adjustsFontSizeToFitWidth = YES;
    return label;
}

+ (instancetype)centerlabelWith:(NSString *)text boldFont:(CGFloat)size {
    UILabel *label = [UILabel centerlabelWith:text];
    label.font = [UIFont boldSystemFontOfSize:size];
    return label;
}

+ (UILabel *)label {
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentLeft;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor blackColor];
    return label;
}

+ (UILabel*)labelWithRect:(CGRect)rect text:(NSString*)text font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor alignment:(NSTextAlignment)alignment textColor:(UIColor*)textColor{
    UILabel*label=[[UILabel alloc]initWithFrame:rect];
    if(text != nil){
        label.text = text;
    }
    if(backgroundColor != nil){
        label.backgroundColor = backgroundColor;
    }
    label.textAlignment = alignment;
    if(textColor != nil){
        label.textColor = textColor;
    }
    if(font != nil){
        label.font = font;
    }
    return label;
}
@end
