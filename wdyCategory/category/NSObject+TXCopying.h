//
//  NSObject+TXCopying.h
//  MK100
//
//  Created by txooo on 2019/1/4.
//  Copyright © 2019 txooo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 NSCopying method
 * Based on MJExtension
 
 Example:
    - (id)copyWithZone:(NSZone *)zone {
        return [self tx_modelCopy];
    }
 Or
    TXCopyingImplementation
 
 */

@interface NSObject (TXCopying)

- (id)tx_modelCopy;

@end

/**
 NSCopying 宏定义实现
 */
#define TXCopyingImplementation \
- (id)copyWithZone:(NSZone *)zone { \
    return [self tx_modelCopy]; \
} \

NS_ASSUME_NONNULL_END
