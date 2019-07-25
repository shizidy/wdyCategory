//
//  SAMKeychain+Util.m
//  BM
//
//  Created by txooo on 17/5/11.
//  Copyright © 2017年 领琾. All rights reserved.
//

#import "SAMKeychain+TXUtil.h"

@implementation SAMKeychain (TXUtil)

+ (NSString *)uuid{
    return [self passwordForService:[[NSBundle mainBundle]bundleIdentifier] account:[[NSBundle mainBundle] infoDictionary][@"CFBundleDisplayName"]];
}

+ (BOOL)setUUID{
    if ([[self class] uuid]) {
        return YES;
    }
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    assert(uuid != NULL);
    CFStringRef uuidStr = CFUUIDCreateString(NULL, uuid);
    return [self setPassword: [NSString stringWithFormat:@"%@", uuidStr] forService:[[NSBundle mainBundle] bundleIdentifier] account:[[NSBundle mainBundle] infoDictionary][@"CFBundleDisplayName"]];
}

@end
