//
//  main.m
//  06-block(内存管理)
//
//  Created by qinglinfu on 16/2/19.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestClass.h"
#import "ObjectClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
    
        // <__NSGlobalBlock__: 0x100004260> 全局区block
        void (^aBlock)() = ^{
            
            NSLog(@"这是一个block");
        };
        
        NSLog(@"%@",aBlock);
        
        // <__NSStackBlock__: 0x7fff5fbff730> 栈区的block
        int a = 100;
        void(^bBlock)() = ^{
            
            NSLog(@"a = %d",a);
        };
        NSLog(@"%@",bBlock);
        
        
        // <__NSMallocBlock__: 0x1004012d0> 堆区 block
        int b = 100;
        void(^cBlock)() = ^{
            
            NSLog(@"b = %d",b);
        };
        
        // 对block进行copy操作，是将block从栈区拷贝到堆区中。堆区中的block需要管理内存
        // void(^copyBlock)() = [cBlock copy];
        void(^copyBlock)() = Block_copy(cBlock);
        
        NSLog(@"%@",copyBlock);
        
        // 释放block
        // [copyBlock release];
        
        Block_release(copyBlock);
        
        
//---------------------------block对对象的持有-------------------------
        
        ObjectClass *obj = [[ObjectClass alloc] init];
        
        [obj testMethod];
        
              
    }
    return 0;
}
