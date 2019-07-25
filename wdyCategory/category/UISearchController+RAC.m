//
//  UISearchController+RAC.m
//  BM
//
//  Created by txooo on 17/3/6.
//  Copyright © 2017年 领琾. All rights reserved.
//

#import "UISearchController+RAC.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <objc/runtime.h>

@interface UISearchController()
<UISearchResultsUpdating, UISearchControllerDelegate>

@end

@implementation UISearchController (RAC)

- (RACSignal *)rac_textSignal{
    id searchResultsUpdater = self.searchResultsUpdater;
    
    if (!searchResultsUpdater) {
        self.searchResultsUpdater = self;
        searchResultsUpdater = self;
    }
    
    RACSignal *signal = objc_getAssociatedObject(self, _cmd);
    if (signal != nil) {
        return signal;
    }
    
    signal = [[searchResultsUpdater rac_signalForSelector:@selector(updateSearchResultsForSearchController:) fromProtocol:@protocol(UISearchResultsUpdating)] map:^id(RACTuple *tuple) {
        
        UISearchController *searchController = tuple.first;
        return searchController.searchBar.text;
    }];
    
    objc_setAssociatedObject(self, _cmd, signal, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return signal;
}

- (RACSignal *)rac_isActiveSignal{
    id delegate = self.delegate;
    
    if (!delegate) {
        self.delegate = self;
        delegate = self;
    }
    
    RACSignal *signal = objc_getAssociatedObject(self, _cmd);
    if (signal != nil) return signal;
    
    RACSignal *willPresentSearching = [[delegate rac_signalForSelector:@selector(willPresentSearchController:) fromProtocol:@protocol(UISearchControllerDelegate)] mapReplace:@YES];
    RACSignal *willDismissSearching = [[delegate rac_signalForSelector:@selector(willDismissSearchController:) fromProtocol:@protocol(UISearchControllerDelegate)] mapReplace:@NO];
    signal = [RACSignal merge:@[willPresentSearching, willDismissSearching]];
    objc_setAssociatedObject(self, _cmd, signal, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return signal;
}
@end
