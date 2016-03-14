//
//  Car.m
//  03-自定义初始化方法
//
//  Created by qinglinfu on 15/12/23.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "Car.h"

@implementation Car

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _brand = @"audi";
        _color = @"blue";
        _price = 3000000;
    }
    return self;
}


- (instancetype)initBrand:(NSString *)brand
{
    self = [super init];
    if (self) {
        _brand = brand;
        _color = @"blue";
        _price = 3000000;
    }
    
    return self;
}


- (instancetype)initBrand:(NSString *)brand withColor:(NSString *)color withPrice:(float)price
{
    if (self = [super init]) {
        _brand = brand;
        _color = color;
        _price = price;
    }
    
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
