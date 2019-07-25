//
//  NSObject+TXSelector.h
//  TXToolbox
//
//  Created by txooo on 17/5/15.
//  Copyright © 2017年 领琾. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (TXSelector)
- (id)performSelector:(SEL)selector withObjects:(NSArray *)objects;
@end
