//
//  main.m
//  08-Blokc循环引用(MRC)
//
//  Created by qinglinfu on 16/2/19.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        TestClass *testObj = [[TestClass alloc] init];
        [testObj testMethod];
        
        [testObj release];
        
        
    }
    return 0;
}
