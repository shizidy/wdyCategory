//
//  UISearchBar+RAC.m
//  BM
//
//  Created by txooo on 17/8/16.
//  Copyright © 2017年 领琾. All rights reserved.
//

#import "UISearchBar+RAC.h"
#import <objc/runtime.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface UISearchBar()<UISearchBarDelegate>

@end

@implementation UISearchBar (RAC)

- (RACSignal *)rac_textSignal {
    id delegate = self.delegate;
    
    if (!delegate) {
        self.delegate = self;
        delegate = self;
    }
    
    RACSignal *signal = objc_getAssociatedObject(self, _cmd);
    if (signal) {
        return signal;
    }
    signal = [[delegate rac_signalForSelector:@selector(searchBar:textDidChange:) fromProtocol:@protocol(UISearchBarDelegate)] map:^id(RACTuple *tuple) {
        return tuple.second;
    }];
    
    objc_setAssociatedObject(self, _cmd, signal, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return signal;
}

- (RACSignal *)rac_isActiveSignal {
    
    id delegate = self.delegate;
    
    if (!delegate) {
        self.delegate = self;
        delegate = self;
    }
    
    RACSignal *signal = objc_getAssociatedObject(self, _cmd);
    if (signal != nil) {
        return signal;
    }
    
    RACSignal *isSearching = [[delegate rac_signalForSelector:@selector(searchBarTextDidBeginEditing:) fromProtocol:@protocol(UISearchBarDelegate)] mapReplace:@YES];
    RACSignal *isEndSearching = [[delegate rac_signalForSelector:@selector(searchBarTextDidEndEditing:) fromProtocol:@protocol(UISearchBarDelegate)] mapReplace:@NO];
    signal = [RACSignal merge:@[isSearching, isEndSearching]];
    objc_setAssociatedObject(self, _cmd, signal, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return signal;
    
}

@end
