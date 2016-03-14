//
//  User.m
//  01-单例设计模式
//
//  Created by qinglinfu on 16/1/5.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "User.h"

@implementation User

static User *user = nil; // 定义静态的变量，保证对象在程序生命周期中不被销毁。
+ (User *)shareUser
{
    // 创建一个实例对象,当为nil时再创建否则返回原来创建的，从而保证始终是同一个实例对象。
    if (!user) {
        user = [[self alloc] init];
    }
    return user;
}


// 覆写 allocWithZone: 避免使用alloc创建新的实例对象
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    if (!user) {
        user = [super allocWithZone:zone];
    }
    return user;
}

// 覆写 copyWithZone：避免使用copy复制出新的实例对象
- (id)copyWithZone:(NSZone *)zone
{
    return user;
}


@end



