//
//  TestClass.m
//  04-延展
//
//  Created by qinglinfu on 15/12/30.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "TestClass.h"

// 使用延展定义私有方法
@interface TestClass (私有方法)
- (void)method_3;
- (void)method_4;
@end

// 使用延展对方法进行归类
@interface TestClass (计算功能的方法)
- (void)method_5;
- (void)method_6;
@end

@interface TestClass (显示视图方法)
- (void)method_7;
- (void)method_8;
@end


@implementation TestClass

- (void)method_1
{
    NSLog(@"公开方法1");
}

- (void)method_2
{
    NSLog(@"公开方法02");
}

- (void)method_3
{
    NSLog(@"私有方法3！");
}

- (void)method_4
{
    NSLog(@"私有方法4！");
}

- (void)method_5
{
    NSLog(@"私有方法5！");
}

- (void)method_6
{
    NSLog(@"私有方法6！");
}

- (void)method_7
{
    NSLog(@"私有方法7！");
}

- (void)method_8
{
    NSLog(@"私有方法8！");
}



@end
