//
//  UISearchBar+RAC.h
//  BM
//
//  Created by txooo on 17/8/16.
//  Copyright © 2017年 领琾. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RACSignal;

@interface UISearchBar (RAC)

- (RACSignal *)rac_textSignal;

- (RACSignal *)rac_isActiveSignal;

@end
