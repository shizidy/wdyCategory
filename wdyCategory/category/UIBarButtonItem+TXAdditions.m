//
//  UIBarButtonItem+TXAdditions
//  BM
//
//  Created by txooo on 17/5/11.
//  Copyright © 2017年 领琾. All rights reserved.
//

#import "UIBarButtonItem+TXAdditions.h"
#import <objc/runtime.h>

static const void *TXBarButtonItemBlockKey = &TXBarButtonItemBlockKey;

@implementation UIBarButtonItem (TXAdditions)

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title
                                      image:(UIImage *)image
                                     action:(void (^)(id))action {
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 60, 40);
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    if(title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if(image) {
        [button setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }
    [button addTarget:self action:@selector(tx_handleAction:) forControlEvents:UIControlEventTouchUpInside];
    objc_setAssociatedObject(button, TXBarButtonItemBlockKey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:button];
    return item;
}

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title
                                      image:(UIImage *)image
                                selectImage:(UIImage *)selectImage
                                     action:(void (^)(id))action {
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 60, 40);
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    if(title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if(image) {
        [button setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }
    if(selectImage) {
        [button setImage:[selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    }
    [button sizeToFit];
    [button addTarget:self action:@selector(tx_handleAction:) forControlEvents:UIControlEventTouchUpInside];
    objc_setAssociatedObject(button, TXBarButtonItemBlockKey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:button];
    return item;
}

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title
                                       size:(CGFloat)fontSize
                                     target:(id)target
                                     action:(SEL)action{
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:title
                                                            style:UIBarButtonItemStylePlain
                                                           target:target
                                                           action:action];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}
                        forState:UIControlStateNormal];
    return item;
}

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title
                                       size:(CGFloat)fontSize
                                     action:(void (^)(id))action {
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:title
                                                            style:UIBarButtonItemStylePlain
                                                           target:self
                                                           action:@selector(tx_handleAction:)];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}
                        forState:UIControlStateNormal];
    objc_setAssociatedObject(item, TXBarButtonItemBlockKey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return item;
}

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title font:(UIFont *)font action:(void (^)(id sender))action {
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:title
                                                            style:UIBarButtonItemStylePlain
                                                           target:self
                                                           action:@selector(tx_handleAction:)];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],
                                   NSFontAttributeName:font}
                        forState:UIControlStateNormal];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],
                                   NSFontAttributeName:font}
                        forState:UIControlStateHighlighted];
    objc_setAssociatedObject(item, TXBarButtonItemBlockKey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return item;
}

+ (void)tx_handleAction:(id)sender {
    void (^block)(id) = objc_getAssociatedObject(sender, TXBarButtonItemBlockKey);
    if (block) block(sender);
}

@end
