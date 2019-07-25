//
//  UISearchBar+MKAdd.h
//  MK100
//
//  Created by txooo on 2018/6/14.
//  Copyright © 2018年 txooo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISearchBar (TXAdd)
- (void)tx_setTextFont:(UIFont *)font;
- (void)tx_setTextColor:(UIColor *)textColor;
- (void)tx_setCancelButtonTitle:(NSString *)title;
/**
 *  设置取消按钮字体
 *
 *  @param font 字体
 */
- (void)tx_setCancelButtonFont:(UIFont *)font;
@end
