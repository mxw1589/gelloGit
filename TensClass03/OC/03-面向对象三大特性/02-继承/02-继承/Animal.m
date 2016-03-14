//
//  Animal.m
//  02-继承
//
//  Created by qinglinfu on 15/12/25.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "Animal.h"

@implementation Animal

- (void)eat
{
    NSLog(@"动物吃食物！");
}

- (void)sleep
{
    NSLog(@"动物睡觉！");
}

- (void)supMethod
{
    NSLog(@"父类的方法！");
}

@end
