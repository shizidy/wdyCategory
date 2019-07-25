//
//  UILabel+Additions.h
//  MK100
//
//  Created by txooo on 2019/5/10.
//  Copyright © 2019 txooo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Additions)
//两端对齐
- (void)textAlignmentLeftAndRight;
//指定Label以最后的冒号对齐的width两端对齐
- (void)textAlignmentLeftAndRightWith:(CGFloat)labelWidth;
//计算label的rect
- (CGRect)labelRectWithLabelSize:(CGSize)size labelFont:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
