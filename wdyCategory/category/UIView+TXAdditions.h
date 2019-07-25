//
//  UIView+TXAdditions.h
//  BM
//
//  Created by txooo on 17/7/12.
//  Copyright © 2017年 领琾. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef struct LineViewInsets {
    CGFloat top, bottom;
} LineViewInsets;

UIKIT_STATIC_INLINE LineViewInsets LineViewInsetsMake(CGFloat top, CGFloat bottom) {
    LineViewInsets insets = {top, bottom};
    return insets;
}

@interface UIView (Line)

- (void)addDashLineBorder;
- (void)addLineWithEdgeInsets:(LineViewInsets)insets;

@end
