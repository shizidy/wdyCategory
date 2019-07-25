//
//  UILabel+Additions.m
//  MK100
//
//  Created by txooo on 2019/5/10.
//  Copyright © 2019 txooo. All rights reserved.
//

#import "UILabel+Additions.h"

@implementation UILabel (Additions)

- (void)textAlignmentLeftAndRight {
    [self textAlignmentLeftAndRightWith:CGRectGetWidth(self.frame)];
}

- (void)textAlignmentLeftAndRightWith:(CGFloat)labelWidth {
    if(self.text==nil||self.text.length==0) {
        return;
    }
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(labelWidth,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:self.font} context:nil].size;
    NSInteger length = (self.text.length - 1);
    NSString *lastStr = [self.text substringWithRange:NSMakeRange(self.text.length - 1, 1)];
    if([lastStr isEqualToString:@":"]||[lastStr isEqualToString:@"："]) {
        length = (self.text.length - 2);
    }
    CGFloat margin = (labelWidth - size.width)/length;//计算间隙长度
    NSNumber *number = [NSNumber numberWithFloat:margin];
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:self.text];
    [attribute addAttribute:NSKernAttributeName value:number range:NSMakeRange(0, length)];
    self.attributedText = attribute;
}

- (CGRect)labelRectWithLabelSize:(CGSize)size labelFont:(UIFont *)font {
    CGRect rect = [self.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return rect;
}

@end
