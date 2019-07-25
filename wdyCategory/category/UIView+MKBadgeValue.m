//
//  UIView+BadgeValue.m
//  MK100
//
//  Created by txooo on 2018/3/20.
//  Copyright © 2018年 txooo. All rights reserved.
//

#import "UIView+MKBadgeValue.h"
#import <objc/runtime.h>

const static void *MKBadgeValueKey = &MKBadgeValueKey;

@interface UIView ()

@property (nonatomic, strong) UILabel *mk_badgeValueLabel;

@end

@implementation UIView (MKBadgeValue)

- (void)setMk_badgeValueLabel:(UILabel *)mk_badgeValueLabel {
    objc_setAssociatedObject(self, MKBadgeValueKey, mk_badgeValueLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)mk_badgeValueLabel {
    return objc_getAssociatedObject(self, MKBadgeValueKey);
}

- (void)mk_setBadgeValue:(NSString *)value {
    if (!self.mk_badgeValueLabel) {
        [self initLabelIsBadgeValue:YES offset:UIOffsetZero isRedDot:NO];
    }
    [self setBadgeValue:value];
}

- (void)mk_setBadgeValueOnLeft:(NSString *)value {
    if (!self.mk_badgeValueLabel) {
        [self initLabelIsBadgeValue:NO offset:UIOffsetZero isRedDot:NO];
    }
    [self setBadgeValue:value];
}

- (void)mk_setBadgeValue:(NSString *)value offset:(UIOffset)offset {
    if (!self.mk_badgeValueLabel) {
        [self initLabelIsBadgeValue:YES offset:offset isRedDot:NO];
    }
    [self setBadgeValue:value];
}

- (void)mk_setRedDotOffset:(UIOffset)offset isHidden:(BOOL)isHidden {
    if (!self.mk_badgeValueLabel) {
        [self initLabelIsBadgeValue:YES offset:offset isRedDot:YES];
    }
    self.mk_badgeValueLabel.hidden = isHidden;
}

- (void)initLabelIsBadgeValue:(BOOL)isBadgeValue offset:(UIOffset)offset isRedDot:(BOOL)isRedDot {
    UILabel *valueLabel = [[UILabel alloc]init];
    valueLabel.textColor = [UIColor whiteColor];
    valueLabel.textAlignment = NSTextAlignmentCenter;
    valueLabel.backgroundColor = [UIColor redColor];
    CGFloat offX = isRedDot ? 2 : 5;
    CGFloat x = self.frame.size.width - offX;
    CGFloat h = self.frame.size.height;
    CGFloat w = isRedDot ? 8 : 18;
    valueLabel.frame = isBadgeValue ? CGRectMake(x - offset.horizontal, -offX + offset.vertical, w, w) : CGRectMake(-offX + offset.horizontal, h/2 - w/2 + offset.vertical, w, w);
    valueLabel.layer.cornerRadius = w/2;
    valueLabel.clipsToBounds = YES;
    [self addSubview:valueLabel];
    self.mk_badgeValueLabel = valueLabel;
}

- (void)setBadgeValue:(NSString *)value {
    NSInteger contNum = [value integerValue];
    if(contNum <= 0){
        self.mk_badgeValueLabel.hidden = YES;
    }else{
        self.mk_badgeValueLabel.hidden = NO;
        if(contNum > 99){
            self.mk_badgeValueLabel.text = @"99+";
            self.mk_badgeValueLabel.font = [UIFont systemFontOfSize:8];
        }else{
            self.mk_badgeValueLabel.text = value;
            self.mk_badgeValueLabel.font = [UIFont systemFontOfSize:10];
        }
    }
}

@end
