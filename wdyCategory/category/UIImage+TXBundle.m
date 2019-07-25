//
//  UIImage+TXBundle.m
//  TXUtils
//
//  Created by txooo on 2019/6/28.
//

#import "UIImage+TXBundle.h"

@implementation UIImage (TXBundle)

+ (instancetype)tx_imageNamed:(NSString *)imageName bundle:(NSString *)bundleName {
    NSString *mainBundlePath = [NSBundle mainBundle].bundlePath;
    NSString *bundlePath = [NSString stringWithFormat:@"%@/%@.bundle", mainBundlePath, bundleName];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    if (bundle == nil) {
        bundlePath = [NSString stringWithFormat:@"%@/Frameworks/%@.framework/%@.bundle", mainBundlePath, bundleName, bundleName];
        bundle = [NSBundle bundleWithPath:bundlePath];
    }
    return [UIImage imageNamed:[NSString stringWithFormat:@"%@/%@", [bundle resourcePath], imageName]];
}

@end
