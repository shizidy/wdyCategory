//
//  UIButton+TXInit.h
//  TXToolbox
//
//  Created by txooo on 17/5/15.
//  Copyright © 2017年 领琾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (TXInit)

+ (instancetype)buttonWithTitle:(NSString *)title action:(void (^)(id sender))action;

+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)color action:(void (^)(id sender))action;

+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)color font:(UIFont *)font action:(void (^)(id sender))action;

+ (instancetype)buttonWithtitle:(NSString *)title
                      titleColor:(UIColor *)titleColor
                 backGroundColor:(UIColor *)backGroundColor
                            Font:(UIFont *)font
                    cornerRadius:(CGFloat)cornerRadius
                          action:(void (^)(id sender))action;

+ (UIButton *)buttonItemWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor backGroundColor:(UIColor *)backGroundColor Font:(UIFont *)font cornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth target:(id)target action:(SEL)action;

@end
