//
//  main.m
//  01-内存管理
//
//  Created by qinglinfu on 15/12/31.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
//        int *p =  (int *)malloc(sizeof(int) * 100);
//        
//        free(p);
        
        // alloc 创建对象引用计数为 1
        Dog *dog = [[Dog alloc] init];
        NSLog(@"引用计数：%ld",[dog retainCount]) ; // retainCount 引用计数
        
        // retain 引用计数 +1
        [dog retain];
        NSLog(@"引用计数：%ld",[dog retainCount]) ;
        
        // release 引用计数 -1
        [dog release]; // 1
        NSLog(@"引用计数：%ld",[dog retainCount]) ;
        
        [dog release]; // 0 引用计数为0，对象将被销毁系统会自动调用dealloc()方法
        
        // 错误的操作：被销毁的对象不能再使用。
//        NSLog(@"引用计数：%ld",[dog retainCount]) ; // 错误
//        NSLog(@"引用计数：%ld",[dog retainCount]) ; // 错误
//        [dog play]; // 错误
        
        
        Dog *dog1 = [[Dog alloc] init];
        [dog1 retain];
        // autorelease 不是马上引用计数-1，而是用完后有由系统自动-1。
        [dog1 autorelease]; // 自动引用计数-1
        NSLog(@"%ld",[dog1 retainCount]);
        
    }
    return 0;
}
