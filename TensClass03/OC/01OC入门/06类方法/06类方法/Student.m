//
//  Student.m
//  06类方法
//
//  Created by qinglinfu on 15/12/22.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "Student.h"

@implementation Student

- (void)setName:(NSString *)name
{
    _name = name;
}

- (void)learn
{
    NSLog(@"%@ learning...",_name);

    //类内部调用直接的方法 使用关关键字 self
    [self method];
    
//    [self class_method]; 错误，实例方法中 self 代表实例对象，不能调用类方法
    
    [Student class_method]; //正确： 实例方法中可以使用类名调用类方法。
}


- (void)method
{
//    [self method];
    NSLog(@"实例方法！");
}


+ (void)class_method
{
//    [self method]; // 类方法中不能使用 self 调用实例方法
    [self readBook]; // 在类方法中 self 表示当前类，可以调用类方法。
    NSLog(@"类方法！");
}


+ (void)readBook
{
    // 类方法中不能访问实例变量。
//    NSLog(@" %@ reading...",_name);
    
    NSLog(@"reading...");
}

@end
