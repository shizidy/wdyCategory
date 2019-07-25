//
//  SAMKeychain+Util.h
//  BM
//
//  Created by txooo on 17/5/11.
//  Copyright © 2017年 领琾. All rights reserved.
//

#import <SAMKeychain/SAMKeychain.h>

@interface SAMKeychain (TXUtil)

+ (NSString *)uuid;

+ (BOOL)setUUID;

@end
