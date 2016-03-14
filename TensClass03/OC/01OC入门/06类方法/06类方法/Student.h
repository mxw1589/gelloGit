//
//  Student.h
//  06类方法
//
//  Created by qinglinfu on 15/12/22.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject {
    
    NSString *_name;
    NSString *_sex;
    int _age;
}

- (void)setName:(NSString *)name;

- (void)learn;

//- (void)method;

// 类方法，属于类本身，不属于具体的实例对象。使用 + 表示。调用的时候直接使用类名调用
+ (void)readBook;

@end
