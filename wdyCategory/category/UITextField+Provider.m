//
//  UITextField+Provider.m
//  MK100
//
//  Created by txooo on 2018/3/14.
//  Copyright © 2018年 txooo. All rights reserved.
//

#import "UITextField+Provider.h"
#import "NSObject+NullSafe.h"
#import <objc/runtime.h>
#import <TXMacro/TXMacroHeader.h>

@implementation UITextField (Provider)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("UITextField") swizzleMethod:NSSelectorFromString(@"dealloc") withMethod:@selector(mkDealloc)];
        [objc_getClass("UITextField") swizzleMethod:@selector(didMoveToWindow) withMethod:@selector(txDidMoveToWindow)];
    });
}

- (void)mkDealloc {
    [self mkDealloc];
}

- (void)txDidMoveToWindow {
    [self txDidMoveToWindow];
    if (@available(iOS 11.2, *)) {
        NSString *keyPath = @"textContentView.provider";
        @try {
            if (self.window) {
                id provider = [self valueForKeyPath:keyPath];
                if (!provider && self) {
                    [self setValue:self forKeyPath:keyPath];
                }
            } else {
                [self setValue:nil forKeyPath:keyPath];
            }
        } @catch (NSException *exception) {
            DLog(@"%@", exception);
        }
    }
}

@end
