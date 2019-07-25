//
//  UIBarButtonItem+ZJS_Extention.h
//  彩票
//
//  Created by mac on 16/2/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (TXAdditions)

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title
                                      image:(UIImage *)image
                                     action:(void (^)(id sender))action;

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title
                                      image:(UIImage *)image
                                selectImage:(UIImage *)selectImage
                                     action:(void (^)(id sender))action;

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title
                                       size:(CGFloat)fontSize
                                     target:(id)target
                                     action:(SEL)action;

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title
                                       size:(CGFloat)fontSize
                                     action:(void (^)(id sender))action;

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title
                                       font:(UIFont *)font
                                     action:(void (^)(id sender))action;

@end
