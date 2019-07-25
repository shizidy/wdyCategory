//
//  UITabBar+TXAdditions.m
//  TXToolbox
//
//  Created by txooo on 17/5/15.
//  Copyright © 2017年 领琾. All rights reserved.
//

#import "UITabBar+TXAdditions.h"

@implementation UITabBar (TXAdditions)

- (void)showBadgeValueAtIndex:(NSInteger)index value:(NSString *)value {
    [self removeBadgeOnItemIndex:index];
    UILabel *badgeView = [[UILabel alloc]init];
    badgeView.tag = 888 + index;
    badgeView.text = value;
    
    int contNum = [value intValue];
    if(contNum <= 0){
        badgeView.hidden = YES;
    }else{
        badgeView.hidden = NO;
        if(contNum > 99){
            badgeView.text = @"99+";
            badgeView.font = [UIFont systemFontOfSize:8];
        }else{
            badgeView.text = value;
            badgeView.font = [UIFont systemFontOfSize:10];
        }
    }
    
    badgeView.textColor = [UIColor whiteColor];
    badgeView.textAlignment = NSTextAlignmentCenter;
    badgeView.backgroundColor = [UIColor redColor];
    CGRect tabFrame = self.frame;
    
    float percentX = (index + 0.6) / self.items.count;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.005 * tabFrame.size.height);
    badgeView.frame = CGRectMake(x, y, 18, 18);
    badgeView.layer.cornerRadius = 9;
    badgeView.clipsToBounds = YES;
    [self addSubview:badgeView];
}

- (void)hideBadgeValueAtIndex:(NSInteger)index {
    [self removeBadgeOnItemIndex:index];
}

- (void)removeBadgeOnItemIndex:(NSInteger)index{
    for (UIView *subView in self.subviews) {
        if (subView.tag == 888+index) {
            [subView removeFromSuperview];
        }
    }
}

@end
