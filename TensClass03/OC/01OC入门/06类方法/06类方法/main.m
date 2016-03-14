//
//  main.m
//  06类方法
//
//  Created by qinglinfu on 15/12/22.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Student *stu = [[Student alloc] init];
        
        [stu setName:@"特特"];
        [stu learn];
        
//        [stu readBook]; 错误，实例变量不能调用类方法
        
        // 使用类名直接调用类方法
        [Student readBook];
    }
    return 0;
}
