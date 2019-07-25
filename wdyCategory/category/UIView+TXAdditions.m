//
//  UIView+TXAdditions.m
//  BM
//
//  Created by txooo on 17/7/12.
//  Copyright © 2017年 领琾. All rights reserved.
//

#import "UIView+TXAdditions.h"
#import <CoreGraphics/CoreGraphics.h>
#import <TXMacro/TXMacroHeader.h>

@implementation UIView (Line)

CAShapeLayer *borderLayer;

- (void)addDashLineBorder {
    CGFloat viewWidth = CGRectGetWidth(self.bounds);
    CGFloat viewHeight = CGRectGetHeight(self.bounds);
    borderLayer = [CAShapeLayer layer];
    borderLayer.bounds = CGRectMake(0, 0, viewWidth, viewHeight);
    borderLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    borderLayer.path = [UIBezierPath bezierPathWithRect:borderLayer.bounds].CGPath;
    borderLayer.lineWidth = 1. / [[UIScreen mainScreen] scale];
    //虚线边框
    borderLayer.lineDashPattern = @[@2, @1];
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.strokeColor = MYColorFromHEX(0xe1e1e1).CGColor;
    [self.layer addSublayer:borderLayer];
}

- (void)addLineWithEdgeInsets:(LineViewInsets)insets {
    CGFloat viewWidth = CGRectGetWidth(self.bounds);
    CGFloat viewHeight = CGRectGetHeight(self.bounds);
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
//    borderLayer.bounds = CGRectMake(0, 0, viewWidth, viewHeight);
//    borderLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(viewWidth, insets.top)];
    [path addLineToPoint:CGPointMake(viewWidth, viewHeight - insets.bottom)];
    
    borderLayer.path = path.CGPath;
    borderLayer.lineWidth = kOnePixel;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.strokeColor = MYColorFromHEX(0xe1e1e1).CGColor;
    [self.layer addSublayer:borderLayer];
}


@end
