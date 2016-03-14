//
//  TestClass.m
//  08-Blokc循环引用(MRC)
//
//  Created by qinglinfu on 16/2/19.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "TestClass.h"

@implementation TestClass
{
    NSString *_name;
}

- (void)testMethod
{
    // self 持有block ,block又持有了self, 导致循环引用。
    self.block = ^{
        
        // self.strObj = @"只付出";
        // _name = @"江湖救急";
        
        [self method];
    };
    _block();
    
    /*
     循环引用出现情况：
        1、block中使用了实例变量
        2、block使用了当前对象的属性
        3、block使用了当前对象的实例方法
     */
    
    
//    // 解决循环引用: 只需要使用__block关键字修饰当前self对象，使block不再持有self就解决了。
    __block typeof(self)blockSelf = self;
    //__block TestClass *blockSelf = self;
    self.block = ^{
        
        blockSelf.strObj = @"只付出";
    };
    _block();
    
}

- (void)method
{
    NSLog(@"实例方法");
}


- (void)dealloc
{
    NSLog(@"对象销毁了");
    
    [super dealloc];
};

@end
