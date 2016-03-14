//
//  main.m
//  05-协议
//
//  Created by qinglinfu on 15/12/30.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Student *stu = [[Student alloc] init];
        
        // 调用协议方法
        [stu doHomeWork];
        [stu goHome];
        [stu eat];
        
        [stu exercitation];
        
        Person *per = [[Person alloc] init];
        [per doHomeWork];
        [per goHome];
        [per eat];
        
    }
    return 0;
}
