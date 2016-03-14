//
//  Person.m
//  02-内存管理—对象持有
//
//  Created by qinglinfu on 15/12/31.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _dog = [[Dog alloc] init];

    }
    return self;
}


- (instancetype)initWithDog:(Dog *)dog
{
    self = [super init];
    if (self) {
        
        _dog = [dog retain];
    }
    
    return self;
}


- (void)setName:(NSString *)name
{
    if (_name != name) {
        
        [_name release];
         _name = [name copy]; // NSString 使用copy
    }
}

- (NSString *)name
{
    return _name;
}


- (void)setAge:(int)age
{
    _age = age; // 基本数据类型不需要内存管理
}

- (int)age
{
    return _age;
}


- (void)setDog:(Dog *)dog
{
//    _dog = dog;
    
    if (_dog != dog) { // 1、先判断是否是新的对象
    
        [_dog release]; // 2、首先对原来对象进行引用计数 -1;
        
        _dog = [dog retain]; // 3、再持有新的对象，对新的对象retain。
    }
}


- (Dog *)dog
{
    return _dog;
}

- (void)dealloc
{
    NSLog(@"Person对象销毁了！");
    
    [_dog release]; // 全局的对象，需要在dealloc中释放。
    [super dealloc];
}


@end
