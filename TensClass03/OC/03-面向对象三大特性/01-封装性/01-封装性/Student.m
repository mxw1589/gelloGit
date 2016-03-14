//
//  Student.m
//  01-封装性
//
//  Created by qinglinfu on 15/12/25.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "Student.h"

// 在.m中定义私有方法，这些方法只能在内部使用
@interface Student (计算功能) // 延展
- (void)method_one;
- (void)method_two;
@end

@interface Student (其他功能)
- (void)method_three;
- (void)method_four;
@end


@implementation Student

- (void)learn
{
    NSLog(@"learning....");
    [self work];
}

- (void)work
{
    NSLog(@"working....");
}


- (void)method_one
{
    NSLog(@"私有方法一");
}

- (void)method_two
{
    NSLog(@"私有方法一");
}


- (void)method_three
{
    NSLog(@"私有方法三");
}

- (void)method_four
{
    NSLog(@"私有方法四");
}

@end
