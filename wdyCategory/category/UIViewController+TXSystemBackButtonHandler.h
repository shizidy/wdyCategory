//
//  UIViewController+SystemBackButtonHandler.h
//  BM
//
//  Created by txooo on 17/3/17.
//  Copyright © 2017年 领琾. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BackButtonHandlerProtocol <NSObject>
@optional
// Override this method in UIViewController derived class to handle 'Back' button click
-(BOOL)navigationShouldPopOnBackButton;
@end

@interface UIViewController (TXSystemBackButtonHandler)<BackButtonHandlerProtocol>

@end
