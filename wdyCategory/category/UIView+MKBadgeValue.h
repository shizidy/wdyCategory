//
//  UIView+BadgeValue.h
//  MK100
//
//  Created by txooo on 2018/3/20.
//  Copyright © 2018年 txooo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MKBadgeValue)

- (void)mk_setBadgeValue:(NSString *)value;
- (void)mk_setBadgeValueOnLeft:(NSString *)value;
- (void)mk_setBadgeValue:(NSString *)value offset:(UIOffset)offset;
- (void)mk_setRedDotOffset:(UIOffset)offset isHidden:(BOOL)isHidden;

@end
