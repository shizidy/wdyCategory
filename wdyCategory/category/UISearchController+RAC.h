//
//  UISearchController+RAC.h
//  BM
//
//  Created by txooo on 17/3/6.
//  Copyright © 2017年 领琾. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RACSignal;

@interface UISearchController (RAC)
- (RACSignal *)rac_textSignal;
- (RACSignal *)rac_isActiveSignal;
@end
