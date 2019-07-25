//
//  NSBundle+TXAddition.m
//  TXUtils
//
//  Created by txooo on 2019/6/19.
//

#import "NSBundle+TXUtilsAddition.h"

@implementation NSBundle (TXUtilsAddition)

+ (NSBundle *)txUtils_bundle {
    static NSBundle *txUtilsBundle = nil;
    if (txUtilsBundle == nil) {
        // 这里不使用mainBundle是为了适配pod 1.x和0.x
        txUtilsBundle = [NSBundle bundleForClass:NSClassFromString(@"TXAlertView")];
        txUtilsBundle = [NSBundle bundleWithPath:[txUtilsBundle pathForResource:@"TXUtils" ofType:@"bundle"]];
    }
    return txUtilsBundle;
}

@end
