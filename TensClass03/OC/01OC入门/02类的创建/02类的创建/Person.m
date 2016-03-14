//
//  Person.m
//  02类的创建
//
//  Created by qinglinfu on 15/12/22.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "Person.h"

@implementation Person

// 方法的实现
- (void)eat:(int)value
{
    NSLog(@"吃了%d",value);
}

- (void)sleep
{
    NSLog(@"睡觉!");
}

- (void)think
{
    NSLog(@"思考！");
}

@end
