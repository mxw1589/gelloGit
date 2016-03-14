//
//  Person.h
//  01-set\get方法
//
//  Created by qinglinfu on 15/12/23.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
    
    NSString *_name;
    NSString *_sex;
    int _age;
}

// set方法(设置器)，定义的时候必须使用set开头
- (void)setName:(NSString *)name;
// get方法（访问器, 省略get 直接写属性名称。
- (NSString *)name;

- (void)setSex:(NSString *)sex;
- (NSString *)sex;

- (void)setAge:(int)age;
- (int)age;


// 这个不是set 方法
- (void)setAge:(int)age setSex:(NSString *)sex;


- (void)work;
- (void)setValue:(int)value;

@end
