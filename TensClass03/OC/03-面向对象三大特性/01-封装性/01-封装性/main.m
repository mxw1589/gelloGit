//
//  main.m
//  01-封装性
//
//  Created by qinglinfu on 15/12/25.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Student *stu = [[Student alloc] init];
        
        stu->_name = @"哈哈"; // _name 公开型@public 的外部可以访问
        
//        stu->_sex = @"男"; 错误，_sex 是保护型@protected 的外部不能访问
        
//        stu->_age; 错误，_age是私有型@private 外部不能访问
        
        
        [stu learn];
//        [stu method_one]; 外部不能调用私有方法
        
    }
    return 0;
}
