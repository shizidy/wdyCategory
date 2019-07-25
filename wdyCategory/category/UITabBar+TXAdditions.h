//
//  UITabBar+TXAdditions.h
//  TXToolbox
//
//  Created by txooo on 17/5/15.
//  Copyright © 2017年 领琾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (TXAdditions)

- (void)showBadgeValueAtIndex:(NSInteger)index value:(NSString *)value;

- (void)hideBadgeValueAtIndex:(NSInteger)index;

@end
