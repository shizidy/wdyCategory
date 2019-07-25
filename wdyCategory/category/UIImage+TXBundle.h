//
//  UIImage+TXBundle.h
//  TXUtils
//
//  Created by txooo on 2019/6/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (TXBundle)

+ (instancetype)tx_imageNamed:(NSString *)imageName bundle:(NSString *)bundleName;

@end

NS_ASSUME_NONNULL_END
