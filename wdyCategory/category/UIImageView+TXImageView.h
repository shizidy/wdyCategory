//
//  UIImageView+MyImageView.h
//  Zhuan
//
//  Created by txooo on 16/3/18.
//  Copyright © 2016年 黄宜波. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+TXCornerImage.h"
@interface UIImageView (TXImageView)

- (void)loadImageUrlStr:(NSString *)urlStr placeHolderImageName:(NSString *)placeHolderStr radius:(CGFloat)radius;

@end
