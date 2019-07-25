//
//  NSObject+NullSafe.h
//  BM
//
//  Created by txooo on 17/7/28.
//  Copyright © 2017年 领琾. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (NullSafe)

+ (void)swizzleMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector;
    
@end
