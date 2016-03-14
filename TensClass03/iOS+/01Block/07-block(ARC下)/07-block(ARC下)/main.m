//
//  main.m
//  07-block(ARC下)
//
//  Created by qinglinfu on 16/2/19.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        // <__NSGlobalBlock__: 0x100004260>
        void(^aBlock)() = ^{
          
            NSLog(@"---------");
        };
        NSLog(@"%@",aBlock);
        
        //<__NSMallocBlock__: 0x100107280>
        // ARC下使用block时不需要手动copy,只要block使用了局部变量，那么block就会被自动拷贝到堆区中。
        int value = 100;
        void(^bBlock)() = ^{
          
            NSLog(@"value = %d",value);
        };
        NSLog(@"%@",bBlock);
        
    }
    return 0;
}
