//
//  MBProgressHUD+Add.m
//  视频客户端
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD+TXAdd.h"
#import <TXMacro/TXMacroHeader.h>
#import "NSBundle+TXUtilsAddition.h"
#import "UIView+TXExtension.h"

#define kHudSuperViewHeight Screen_Height - kNavigationBarHeight - kTopBarHeight - kBottomBarHeight

@implementation MBProgressHUD (TXAdd)
#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view {
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = text;
    hud.userInteractionEnabled = NO;
    if (icon) {
        NSString *bundlePath = [[NSBundle txUtils_bundle] resourcePath];
        // 设置图片
        hud.customView =
        [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@/%@", bundlePath, icon]]];
    }
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    if (view.height >= kHudSuperViewHeight) {
        hud.offset = CGPointMake(0, -kTopBarHeight);
    }
    hud.bezelView.color = [UIColor blackColor];
    hud.contentColor = [UIColor whiteColor];
    // 2秒之后再消失
    [hud hideAnimated:YES afterDelay:2];
}

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view {
    [self show:error icon:@"error" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view {
    [self show:success icon:@"success" view:view];
}

+ (void)showMessage:(NSString *)text view:(UIView *)view {
    if (!text) {
        return;
    }
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    [self show:text icon:nil view:view];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.label.text = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    if (view.height >= kHudSuperViewHeight) {
        hud.offset = CGPointMake(0, -kTopBarHeight);
    }
    hud.bezelView.color = [UIColor blackColor];
    hud.contentColor = [UIColor whiteColor];
    // YES代表需要蒙版效果
    return hud;
}
@end
