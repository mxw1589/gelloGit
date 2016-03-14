//
//  UIView+Addition.m
//  TensMusic
//
//  Created by Chen on 16/1/15.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "UIView+Addition.h"

@implementation UIView (Addition)

- (CGFloat)bottom {
    return CGRectGetMaxY(self.frame);
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - CGRectGetHeight(frame);
    self.frame = frame;
}

@end
