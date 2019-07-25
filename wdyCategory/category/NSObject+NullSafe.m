//
//  NSObject+NullSafe.m
//  BM
//
//  Created by txooo on 17/7/28.
//  Copyright © 2017年 领琾. All rights reserved.
//

#import "NSObject+NullSafe.h"
#import <objc/runtime.h>

@implementation NSObject (NullSafe)

+ (void)swizzleMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector {
    Method originalMethod = class_getInstanceMethod(self, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
    BOOL didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end

@implementation NSMutableDictionary (NullSafe)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("__NSDictionaryM") swizzleMethod:@selector(setObject:forKey:) withMethod:@selector(safe_setObject:forKey:)];
            [objc_getClass("__NSDictionaryM") swizzleMethod:@selector(length) withMethod:@selector(safe_length)];
            [objc_getClass("__NSDictionaryM") swizzleMethod:@selector(setObject:forKeyedSubscript:) withMethod:@selector(safe_setObject:forKeyedSubscript:)];
        }
    });
}

- (void)safe_setObject:(id)value forKey:(NSString *)key {
    if (value) {
        [self safe_setObject:value forKey:key];
    }else {
        NSLog(NSLocalizedString(@"插入对象为空", nil));
    }
}

- (void)safe_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key {
    if (!key) {
        NSLog(NSLocalizedString(@"插入key为空", nil));
        return;
    }
    if (!obj) {
        NSLog(NSLocalizedString(@"插入对象为空", nil));
        obj = [NSNull null];
    }
    [self safe_setObject:obj forKeyedSubscript:key];
}

- (NSUInteger)safe_length {
    return 0;
}

@end

@implementation NSDictionary (NullSafe)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("__NSDictionaryI") swizzleMethod:@selector(initWithObjects:forKeys:count:) withMethod:@selector(safe_initWithObjects:forKeys:count:)];
            [objc_getClass("__NSDictionaryI") swizzleMethod:@selector(dictionaryWithObjects:forKeys:count:) withMethod:@selector(safe_dictionaryWithObjects:forKeys:count:)];
            [objc_getClass("__NSDictionaryI") swizzleMethod:@selector(length) withMethod:@selector(safe_length)];
        }
    });
}

+ (instancetype)safe_dictionaryWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt {
    id safeObjects[cnt];
    id safeKeys[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        id key = keys[i];
        id obj = objects[i];
        if (!key) {
            continue;
        }
        if (!obj) {
            obj = [NSNull null];
        }
        safeKeys[j] = key;
        safeObjects[j] = obj;
        j++;
    }
    return [self safe_dictionaryWithObjects:safeObjects forKeys:safeKeys count:j];
}

- (instancetype)safe_initWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt {
    id safeObjects[cnt];
    id safeKeys[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        id key = keys[i];
        id obj = objects[i];
        if (!key) {
            continue;
        }
        if (!obj) {
            obj = [NSNull null];
        }
        safeKeys[j] = key;
        safeObjects[j] = obj;
        j++;
    }
    return [self safe_initWithObjects:safeObjects forKeys:safeKeys count:j];
}

- (NSUInteger)safe_length {
    return 0;
}

@end

@implementation NSMutableArray (NullSafe)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("__NSArrayM") swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(safe_objectAtIndex:)];
            [objc_getClass("__NSArrayM") swizzleMethod:@selector(insertObject:atIndex:) withMethod:@selector(safe_insertObject:atIndex:)];
            [objc_getClass("__NSArrayM") swizzleMethod:@selector(replaceObjectAtIndex:withObject:) withMethod:@selector(safe_replaceObjectAtIndex:withObject:)];
            [objc_getClass("__NSArrayM") swizzleMethod:@selector(addObjectsFromArray:) withMethod:@selector(safe_addObjectsFromArray:)];
            [objc_getClass("__NSArrayM") swizzleMethod:@selector(integerValue) withMethod:@selector(safe_integerValue)];
        }
    });
}

- (id)safe_objectAtIndex:(NSUInteger)index {
    if ([self count] > index) {
        return [self safe_objectAtIndex:index];
    }
    NSLog(NSLocalizedString(@"越界", nil));
    return nil;
}

- (void)safe_insertObject:(id)object atIndex:(NSUInteger)idx {
    if (object) {
        [self safe_insertObject:object atIndex:idx];
    }
}

- (void)safe_replaceObjectAtIndex:(NSUInteger)idx withObject:(id)object {
    if ([self count] > idx && object) {
        [self safe_replaceObjectAtIndex:idx withObject:object];
    }
}

- (void)safe_addObjectsFromArray:(NSArray *)array {
    if ([array isKindOfClass:[NSArray class]]) {
        [self safe_addObjectsFromArray:array];
    }
}

- (NSInteger)safe_integerValue {
    return 0;
}

@end

@implementation NSArray (NullSafe)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("__NSArrayI") swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(safe_objectAtIndex:)];
            [objc_getClass("__NSArrayI") swizzleMethod:@selector(integerValue) withMethod:@selector(safe_integerValue)];
        }
    });
}

- (id)safe_objectAtIndex:(NSUInteger)index {
    if ([self count] > index) {
        return [self safe_objectAtIndex:index];
    }
    NSLog(NSLocalizedString(@"越界", nil));
    return nil;
}

- (NSInteger)safe_integerValue {
    return 0;
}

@end

@implementation NSMutableString (NullSafe)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("__NSCFString") swizzleMethod:@selector(replaceCharactersInRange:withString:) withMethod:@selector(safe_replaceCharactersInRange:withString:)];
            [objc_getClass("__NSCFString") swizzleMethod:@selector(objectForKeyedSubscript:) withMethod:@selector(safe_objectForKeyedSubscript:)];
        }
    });
}

- (void)safe_replaceCharactersInRange:(NSRange)range withString:(NSString *)aString {
    if ((range.location + range.length) > self.length) {
        NSLog(NSLocalizedString(@"error: Range or index out of bounds! 错误:越界", nil));
    }else {
        [self safe_replaceCharactersInRange:range withString:aString];
    }
}

- (id)safe_objectForKeyedSubscript:(NSString *)key {
    return nil;
}

@end

@implementation NSMutableAttributedString (NullSafe)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("NSConcreteMutableAttributedString") swizzleMethod:@selector(replaceCharactersInRange:withString:) withMethod:@selector(safe_replaceCharactersInRange:withString:)];
        }
    });
}

- (void)safe_replaceCharactersInRange:(NSRange)range withString:(NSString *)aString {
    if ((range.location + range.length) > self.length) {
        NSLog(@"error: Range or index out of bounds");
    }else {
        [self safe_replaceCharactersInRange:range withString:aString];
    }
}

@end

@implementation NSNull (NullSafe)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("NSNull") swizzleMethod:@selector(length) withMethod:@selector(safe_length)];
            [objc_getClass("NSNull") swizzleMethod:@selector(methodSignatureForSelector:) withMethod:@selector(safe_methodSignatureForSelector:)];
            [objc_getClass("NSNull") swizzleMethod:@selector(forwardInvocation:) withMethod:@selector(safe_forwardInvocation:)];
        }
    });
}

- (NSMethodSignature *)safe_methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *sig = [self safe_methodSignatureForSelector:aSelector];
    if (sig) {
        return sig;
    }
    return [NSMethodSignature signatureWithObjCTypes:@encode(void)];
}

- (void)safe_forwardInvocation:(NSInvocation *)anInvocation {
    NSUInteger returnLength = [[anInvocation methodSignature] methodReturnLength];
    if (!returnLength) {
        // nothing to do
        return;
    }
    
    // set return value to all zero bits
    char buffer[returnLength];
    memset(buffer, 0, returnLength);
    
    [anInvocation setReturnValue:buffer];
}

- (NSInteger)safe_length {
    return 0;
}

@end

@implementation NSString (NullSafe)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("__NSCFConstantString") swizzleMethod:@selector(substringToIndex:) withMethod:@selector(safe_substringToIndex:)];
            [objc_getClass("__NSCFConstantString") swizzleMethod:@selector(objectForKeyedSubscript:) withMethod:@selector(safe_objectForKeyedSubscript:)];
        }
    });
}

- (NSString *)safe_substringToIndex:(NSUInteger)to {
    if (to > self.length) {
        return nil;
    }
    
    return [self safe_substringToIndex:to];
}

- (id)safe_objectForKeyedSubscript:(NSString *)key {
    return nil;
}

@end

@implementation NSNumber (NullSafe)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("__NSCFNumber") swizzleMethod:@selector(length) withMethod:@selector(safe_length)];
        }
    });
}

- (NSInteger)safe_length {
    NSString *string = [NSString stringWithFormat:@"%@",self];
    return string.length;
}

@end
