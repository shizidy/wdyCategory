//
//  YYCache+BMAdditions.h
//  BM
//
//  Created by txooo on 17/4/21.
//  Copyright © 2017年 领琾. All rights reserved.
//

#import <YYCache/YYCache.h>

@interface YYCache (TXAdditions)

// 登录成功时调用
+ (instancetype)sharedCacheWithName:(NSString *)cacheName;
+ (instancetype)sharedCache;
- (void)deallocCache;

@end
