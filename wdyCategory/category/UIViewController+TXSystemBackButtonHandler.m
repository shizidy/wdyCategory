//
//  UIViewController+SystemBackButtonHandler.m
//  BM
//
//  Created by txooo on 17/3/17.
//  Copyright © 2017年 领琾. All rights reserved.
//

#import "UIViewController+TXSystemBackButtonHandler.h"
//#import <objc/runtime.h>
//static NSString *const kOriginDelegate = @"kOriginDelegate";
@implementation UIViewController (TXSystemBackButtonHandler)

@end

@implementation UINavigationController (ShouldPopOnBackButton)

//+ (void)load
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Class class = [self class];
//        
//        SEL originSelector = @selector(viewDidLoad);
//        SEL swizzledSelector = @selector(bm_viewDidLoad);
//        
//        Method originMethod = class_getInstanceMethod(class, originSelector);
//        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
//        
//        BOOL didAddMethod = class_addMethod(class,
//                                            originSelector,
//                                            method_getImplementation(swizzledMethod),
//                                            method_getTypeEncoding(swizzledMethod));
//        if (didAddMethod) {
//            class_replaceMethod(class,
//                                swizzledSelector,
//                                method_getImplementation(originMethod),
//                                method_getTypeEncoding(originMethod));
//        } else {
//            method_exchangeImplementations(originMethod, swizzledMethod);
//        }
//    });
//}
//
//- (void)bm_viewDidLoad
//{
//    [self bm_viewDidLoad];
//    
//    objc_setAssociatedObject(self, [kOriginDelegate UTF8String], self.interactivePopGestureRecognizer.delegate, OBJC_ASSOCIATION_ASSIGN);
//    self.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
//}

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {
    if([self.viewControllers count] < [navigationBar.items count]) {
        return YES;
    }
    
    BOOL shouldPop = YES;
    UIViewController* vc = [self topViewController];
    if([vc respondsToSelector:@selector(navigationShouldPopOnBackButton)]) {
        shouldPop = [vc navigationShouldPopOnBackButton];
    }
    
    if(shouldPop) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self popViewControllerAnimated:YES];
        });
    } else {
        // Workaround for iOS7.1. Thanks to @boliva - http://stackoverflow.com/posts/comments/34452906
        for(UIView *subview in [navigationBar subviews]) {
            if(0. < subview.alpha && subview.alpha < 1.) {
                [UIView animateWithDuration:.25 animations:^{
                    subview.alpha = 1.;
                }];
            }
        }
    }
    return shouldPop;
}

#pragma mark - 手势
//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
//    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
//        UIViewController *vc = [self topViewController];
//        if([vc respondsToSelector:@selector(navigationShouldPopOnBackButton)]) {
//            return [vc navigationShouldPopOnBackButton];
//        }
//        id<UIGestureRecognizerDelegate> originDelegate = objc_getAssociatedObject(self, [kOriginDelegate UTF8String]);
//        return [originDelegate gestureRecognizerShouldBegin:gestureRecognizer];
//    }
//    return YES;
//}

@end
