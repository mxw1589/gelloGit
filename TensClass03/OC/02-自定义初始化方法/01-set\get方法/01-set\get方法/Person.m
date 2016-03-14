//
//  Person.m
//  01-set\get方法
//
//  Created by qinglinfu on 15/12/23.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "Person.h"

@implementation Person

// set方法(设置器)
- (void)setName:(NSString *)name
{
//    self.name = @"jjjj";
    _name = name;
}

// get方法（访问器）
- (NSString *)name
{
//    self.name = @"qqqq";
    return _name;
}

- (void)setSex:(NSString *)sex
{
    _sex = sex;
}

- (NSString *)sex
{
    return _sex;
}

- (void)setAge:(int)age
{
    _age = age;
}

- (int)age
{
    return _age;
}

- (void)work
{
    NSLog(@"%@正在工作。。。",_name);
}


- (void)setValue:(int)value
{
    NSLog(@"==========");
}


- (void)setAge:(int)age setSex:(NSString *)sex
{
    _age = age;
    _sex = sex;
}


@end
