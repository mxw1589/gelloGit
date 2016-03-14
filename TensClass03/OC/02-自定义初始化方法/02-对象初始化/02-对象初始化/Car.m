//
//  Car.m
//  02-对象初始化
//
//  Created by qinglinfu on 15/12/23.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "Car.h"

@implementation Car

// 覆写（重写）init 方法，对对象的属性赋初始值

// instancetype: 是当前对象类型（id）
- (instancetype)init
{
    // 1、首先对父类进行初始化 super：代表父类
    self = [super init];
    
    // 2、父类初始化成功再对当前类进行初始化工作（给属性赋值）
    if (self) {
        _brand = @"特斯拉";
        _color = @"red";
        _price = 4000000;
    }
    // 3、返回初始化后的对象
    return self;
}


- (NSString *)brand
{
    return _brand;
}

- (NSString *)color
{
    return _color;
}

- (float)price
{
    return _price;
}


@end
