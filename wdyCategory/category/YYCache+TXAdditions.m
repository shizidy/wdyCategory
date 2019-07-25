//
//  YYCache+BMAdditions.m
//  BM
//
//  Created by txooo on 17/4/21.
//  Copyright © 2017年 领琾. All rights reserved.
//

#import "YYCache+TXAdditions.h"

@implementation YYCache (TXAdditions)

static YYCache *cache;
static dispatch_once_t token;

- (void)dealloc {
    NSLog(@"%s", __func__);
}

+ (instancetype)sharedCacheWithName:(NSString *)cacheName {
    dispatch_once(&token, ^{
        cache = [YYCache cacheWithName:cacheName];
    });
    return cache;
}

+ (instancetype)sharedCache {
    if (!cache) {
        return [YYCache sharedCacheWithName:@"EmptyUser"];
    }
    return cache;
}

- (void)deallocCache{
    token = 0;
    cache = nil;
}

@end
