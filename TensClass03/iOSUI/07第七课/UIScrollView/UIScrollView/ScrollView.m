//
//  ScrollView.m
//  UIScrollView
//
//  Created by Chen on 16/1/20.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "ScrollView.h"

@implementation ScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

int i=0;
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    NSLog(@"contentoffset %@", NSStringFromCGPoint(self.contentOffset));
    
//    if (i == 0) {
//        [self setContentOffset:CGPointMake(0, self.contentSize.height-568) animated:YES];
//        i++;
//    }
//    else {
//        [self scrollRectToVisible:CGRectMake(320, 0, 320, 568) animated:YES];
//
//    }
}


@end
