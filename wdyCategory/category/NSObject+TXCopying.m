//
//  NSObject+TXCopying.m
//  MK100
//
//  Created by txooo on 2019/1/4.
//  Copyright © 2019 txooo. All rights reserved.
//

#import "NSObject+TXCopying.h"
#import <MJExtension/MJExtension.h>

@implementation NSObject (TXCopying)

- (id)tx_modelCopy {
    if (self == (id)kCFNull) {
        return self;
    }
    Class class = self.class;
    id object = [class new];
    
    [class mj_enumerateProperties:^(MJProperty *property, BOOL *stop) {
        id value = [self valueForKey:property.name];
        [property setValue:value forObject:object];
    }];
    
    return object;
}

@end
