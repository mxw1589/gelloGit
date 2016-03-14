//
//  TensButton.m
//  04-block(事件处理)
//
//  Created by qinglinfu on 16/2/19.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "TensButton.h"

@implementation TensButton

- (void)buttonEvent:(UIControlEvents)event handler:(ButtonBlock)block
{
    _block = block; 
    [self addTarget:self action:@selector(action) forControlEvents:event];
}

- (void)action
{
    if (_block) {
        _block();
    }
}


@end
