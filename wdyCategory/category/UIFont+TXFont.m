//
//  UIFont+CustomFont.m
//  Zhuan
//
//  Created by txooo on 16/7/7.
//  Copyright © 2016年 领琾. All rights reserved.
//

#import "UIFont+TXFont.h"

@implementation UIFont (TXFont)
+ (UIFont *)iconfontWithSize:(CGFloat)size{
    return [self fontWithName:@"iconfont" size:size];
}

+ (UIFont *)iconfontV2WithSize:(CGFloat)size{
    return [self fontWithName:@"iconfontv2" size:size];
}

+ (UIFont *)vmallfontWithSize:(CGFloat)size {
    return [self fontWithName:@"vmallfont" size:size];
}

@end
