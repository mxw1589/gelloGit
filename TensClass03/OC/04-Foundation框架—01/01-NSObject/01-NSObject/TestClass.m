//
//  TestClass.m
//  01-NSObject
//
//  Created by qinglinfu on 15/12/27.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "TestClass.h"

@implementation TestClass

- (void)testMethod
{
    NSLog(@"测试方法！");
}

- (void)testMethodObject:(NSString *)obj
{
    NSLog(@"-----%@",obj);
}

- (void)testMethod:(NSString *)obj1 withObject:(NSString *)obj2
{
    NSLog(@"obj1:%@ obj2:%@",obj1, obj2);
}

@end
