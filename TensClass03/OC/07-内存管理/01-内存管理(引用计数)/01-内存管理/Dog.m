//
//  Dog.m
//  01-内存管理
//
//  Created by qinglinfu on 15/12/31.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "Dog.h"

@implementation Dog

- (void)play
{
    NSLog(@"狗玩耍！");
}

// 对象的引用计数为 0 时会自动调用这个方法。
- (void)dealloc
{
    NSLog(@"对象销毁！");
    
    [super dealloc];
}

@end
