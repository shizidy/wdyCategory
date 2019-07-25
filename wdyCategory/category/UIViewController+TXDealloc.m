//
//  NSObject+Dealloc.m
//  ZhuanMCH
//
//  Created by txooo on 17/4/5.
//  Copyright © 2017年 黄宜波. All rights reserved.
//

#import "UIViewController+TXDealloc.h"
#import <objc/runtime.h>
#import <TXMacro/TXMacroHeader.h>

@implementation UIViewController (TXDealloc)

+ (void)load{
    Method txDealloc = class_getInstanceMethod(self, @selector(txDealloc));
    Method dealloc = class_getInstanceMethod(self,NSSelectorFromString(@"dealloc"));
    method_exchangeImplementations(txDealloc, dealloc);
}

- (void)txDealloc{
    DLog(@"%@---Dealloc",self);
    [self txDealloc];
}

@end

@implementation UIView (TXDealloc)
#if 0
+ (void)load{
    Method txDealloc = class_getInstanceMethod(self, @selector(txDealloc));
    Method dealloc = class_getInstanceMethod(self,NSSelectorFromString(@"dealloc"));
    method_exchangeImplementations(txDealloc, dealloc);
}

- (void)txDealloc{
    DLog(@"%@---Dealloc",[self class]);
    [self txDealloc];
}
#endif
@end

