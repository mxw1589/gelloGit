//
//  Cat.m
//  02-继承
//
//  Created by qinglinfu on 15/12/25.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "Cat.h"

@implementation Cat

- (void)eat
{
    _categery = @"猫科";
    
    _varProtected = @"父类保护型的";
    
//    _varPrivate = @"私有"; 私有属性子类不能继承
    
    NSLog(@"猫吃鱼");
}


- (void)testMethod
{
//    [self sleep]; 子类中不能直接调用父类的私有方法
}

- (void)testMethod_two
{
    [self eat];
}

/*
 
 self 和 super 关键字：
    self: 表示当前类或者当前对象
    super: 表示父类对象或者父类
 
 1、使用super直接调用父类的方法。
 2、使用self,首先调用自己类中的方法，如果没有再调用父类中的方法。
 
 */

- (void)testMethod_super
{
    [super supMethod];
}

- (void)testMethod_self
{
    [self supMethod];
}

- (void)supMethod
{
    NSLog(@"子类的方法！");
}


@end
