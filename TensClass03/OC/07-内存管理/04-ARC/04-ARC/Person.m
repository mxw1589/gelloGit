//
//  Person.m
//  04-ARC
//
//  Created by qinglinfu on 15/12/31.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "Person.h"

@implementation Person

// ARC 覆写set方法
- (void)setName:(NSString *)name
{
    _name = [name copy];
}

- (void)setBooks:(NSArray *)books
{
    _books = books;
}

- (void)setAge:(int)age
{
    _age = age;
}


- (void)dealloc
{
    NSLog(@"Person对象销毁了！");
//    [super dealloc]; ARC 下不用写
}

@end
