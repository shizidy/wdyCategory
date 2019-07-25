//
//  NSData+GZip.h
//  MK100
//
//  Created by txooo on 2019/3/18.
//  Copyright © 2019 txooo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (GZip)

- (NSData *)gzippedDataWithCompressionLevel:(float)level;
- (NSData *)gzippedData;
- (NSData *)ungzippedData;
- (BOOL)isGzippedData;

@end

NS_ASSUME_NONNULL_END
