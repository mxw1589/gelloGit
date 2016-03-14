//
//  TestClass.m
//  09-block循环引用(ARC)
//
//  Created by qinglinfu on 16/2/19.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "TestClass.h"

@implementation TestClass

- (void)testMethod
{
    // 循环引用
    self.block = ^{
        
      self.strObj = @"还可结婚后";
    };
    
    _block();
    
    
    // 解决循环引用，ARC下解决循环引用只需要将self用__weak关键字修饰就行。
    __weak typeof(self)weakSelf = self;
    self.block = ^{
        
        weakSelf.strObj = @"还可结婚后";
    };
    
    _block();
}

@end
