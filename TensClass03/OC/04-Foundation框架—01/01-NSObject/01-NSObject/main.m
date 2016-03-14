//
//  main.m
//  01-NSObject
//
//  Created by qinglinfu on 15/12/27.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestClass.h"
#import "SubClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        TestClass *testObj = [[TestClass alloc] init];
        
//        [testObj testMethod];
        
        //1、 performSelector 调用某个方法,没有参数， @selector：表示方法
        [testObj performSelector:@selector(testMethod)]; // 可以调用私有方法
        
        // 调用一个参数的方法，参数必须是一个对象类型（id）:任意的对象类型
        [testObj performSelector:@selector(testMethodObject:) withObject:@12];
        
        // 两个参数
        [testObj performSelector:@selector(testMethod:withObject:) withObject:@"hhh" withObject:@"string"];
        
        
        // 2、isKindOfClass：  判断一个实例对象是否是某个类或者它的父类
        SubClass *subObj = [[SubClass alloc] init];
        
        if ([subObj isKindOfClass:[SubClass class]]) {
            
            NSLog(@"subObj是SubClass类创建的");
        }
        
        if ([subObj isKindOfClass:[TestClass class]]) {
            
            NSLog(@"subObj是TestClass类的子类对象");
        }
        
        // 3、isMemberOfClass: 判断一个对象是否是某个类，不能判断父类
        if ([subObj isMemberOfClass:[SubClass class]]) {
            
            NSLog(@"------subObj是SubClass类--------");
        }
        
        if ([subObj isMemberOfClass:[TestClass class]]) {
            
            NSLog(@"=======subObj是TestClass类======");
        }
        
        
        // 4、respondsToSelector： 判断某个方法是否在.m中实现了
        if ([subObj respondsToSelector:@selector(testMethod)]) {
            NSLog(@"testMethod 实现了。。。");
        }
        
        // 5、superclass: 获取父类
        Class className =  [subObj superclass];
        
        NSLog(@"----------%@",className);
        
        
    }
    return 0;
}
