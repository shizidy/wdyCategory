
//
//  UIButton+TXInit.m
//  TXToolbox
//
//  Created by txooo on 17/5/15.
//  Copyright © 2017年 领琾. All rights reserved.
//

#import "UIButton+TXInit.h"
#import <objc/runtime.h>

static const void *TXButtonBlockKey = &TXButtonBlockKey;

@implementation UIButton (TXInit)

+ (instancetype)buttonWithTitle:(NSString *)title action:(void (^)(id sender))action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:@selector(tx_handleAction:) forControlEvents:UIControlEventTouchUpInside];
    objc_setAssociatedObject(button, TXButtonBlockKey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return button;
}

+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)color action:(void (^)(id sender))action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button addTarget:self action:@selector(tx_handleAction:) forControlEvents:UIControlEventTouchUpInside];
    objc_setAssociatedObject(button, TXButtonBlockKey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return button;
}

+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)color font:(UIFont *)font action:(void (^)(id sender))action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = font;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button addTarget:self action:@selector(tx_handleAction:) forControlEvents:UIControlEventTouchUpInside];
    objc_setAssociatedObject(button, TXButtonBlockKey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return button;
}

+ (instancetype)buttonWithtitle:(NSString *)title
                     titleColor:(UIColor *)titleColor
                backGroundColor:(UIColor *)backGroundColor
                           Font:(UIFont *)font
                   cornerRadius:(CGFloat)cornerRadius
                         action:(void (^)(id sender))action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.layer.cornerRadius = cornerRadius;
    button.titleLabel.font = font;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setBackgroundColor:backGroundColor];
    [button addTarget:self action:@selector(tx_handleAction:) forControlEvents:UIControlEventTouchUpInside];
    objc_setAssociatedObject(button, TXButtonBlockKey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return button;
}

+ (void)tx_handleAction:(UIButton *)sender {
    void (^block)(id) = objc_getAssociatedObject(sender, TXButtonBlockKey);
    if (block) block(sender);
}

+(UIButton *)buttonItemWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor backGroundColor:(UIColor *)backGroundColor Font:(UIFont *)font cornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth target:(id)target action:(SEL)action{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    if(title != nil && ![title isEqualToString:@""]){
        [button setTitle:title forState:UIControlStateNormal];
    }
    if(titleColor != nil){
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if(backGroundColor != nil){
        button.backgroundColor = backGroundColor;
    }
    if(font != nil){
        button.titleLabel.font = font;
    }
    button.layer.cornerRadius = cornerRadius;
    if(borderColor != nil){
        button.layer.borderColor = borderColor.CGColor;
    }
    button.layer.borderWidth = borderWidth;
    if(target !=nil && action != nil){
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return  button;
}

@end
