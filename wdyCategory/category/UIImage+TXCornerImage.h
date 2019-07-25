//
//  UIImage+CornerImage.h
//  Zhuan
//
//  Created by txooo on 16/3/18.
//  Copyright © 2016年 黄宜波. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TXCornerImage)

+ (UIImage *)createRoundedRectImage:(UIImage *)image size:(CGSize)size radius:(NSInteger)r;

+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)roundedImage:(UIImage *)image;

@end
