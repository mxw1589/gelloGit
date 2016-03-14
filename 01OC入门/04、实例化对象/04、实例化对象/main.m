//
//  main.m
//  04、实例化对象
//
//  Created by qinglinfu on 15/12/22.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Car.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
    // 实例化：使用类（class）创建的实例对象
       Student *stu = [[Student alloc] init];
        // 调用方法
        [stu learnOC];
        
        // 实例化的过程：
        // 1、alloc:在堆区中开辟存储对象的空间
        // 2、init: 给创建的对象初始化（给属性赋初始值）
        // 3、实例化完成后返回对象的地址，使用一个引用(指针)去指向这个对象，通过引用去操作对象。
            // 例如：stu 就是一个引用
        NSLog(@"stu:%p",stu);
        
        
        // new 也可是创建对象
        Student *stu1 = [Student new];
        [stu1 learnOC];
        // new 和 alloc\init 区别：new是开辟空间并且初始化对象，OC一般不使用new。
        
        
        Car *car = [[Car alloc] init];
        [car speed];
        
//        [car learnOC]; 错误，对象只能调用自己的方法，不能调用别的对象的方法。
        
//        Car *car = [[Student alloc] init]; 错误
        
    }
    return 0;
}
