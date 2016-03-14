//
//  ObjectClass.m
//  06-block(内存管理)
//
//  Created by qinglinfu on 16/2/19.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ObjectClass.h"
#import "TestClass.h"

TestClass *globalObj = nil;

@implementation ObjectClass
{
    TestClass *_testObj;
}


- (void)testMethod
{
    // 局部对象
    TestClass *testObj = [[TestClass alloc] init];
    NSLog(@"testObj引用计数：%ld",[testObj retainCount]);
    
    // 全局对象
    globalObj = [[TestClass alloc] init];
    NSLog(@"globalObj引用计数：%ld",[globalObj retainCount]);
    
    // 实例对象
    _testObj = [[TestClass alloc] init];
    NSLog(@"_testObj引用计数：%ld",[_testObj retainCount]);
    
    NSLog(@"self引用计数：%ld",[self retainCount]);
    
    // 在block中使用这些对象
    void (^objBlock)() = ^{
        
        NSLog(@"%@",testObj);
        NSLog(@"%@",globalObj);
        NSLog(@"%@",_testObj);
        NSLog(@"%@",self.tObj);
    };
    
    void(^cpobjBlock)() = Block_copy(objBlock);
    cpobjBlock();
    
    // 堆区中的block使用了局部的对象后，会持有这个对象(引用计数+1)。
    NSLog(@"testObj引用计数：%ld",[testObj retainCount]);
//    NSLog(@"self引用计数：%ld",[self retainCount]);

    
    NSLog(@"globalObj引用计数：%ld",[globalObj retainCount]);
//    NSLog(@"self引用计数：%ld",[self retainCount]);

    
    NSLog(@"_testObj引用计数：%ld",[_testObj retainCount]);
    NSLog(@"self引用计数：%ld",[self retainCount]);
    
    
    /* blcok内存管理：
     
     1、如果堆区的block使用了局部的对象，会对这个局部对象进行引用计数+1
     2、如果堆区中的block使用了 全局的对象、实例对象变量、对象类型的属性，block不会对这些变量引用计数 +1,而是会对这些对象所在的对对象(self)引用计数 +1 (持有当前对象self)。
     */
}

@end
