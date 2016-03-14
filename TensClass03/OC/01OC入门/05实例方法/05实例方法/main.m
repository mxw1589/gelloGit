//
//  main.m
//  05实例方法
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
        
        // 实例对象调用实例方法
        [stu inputScoreC:80.0 withOC:90];
        
//        stu.name = @"dfjhdf"; 不能这样访问实例变量
        
        stu->_name = @"张三"; // 可以使用->访问公开(@public)的实例变量。一般不会这样访问，破坏了封装性。
        
    
        [stu setName:@"张三" withAge:30 withSex:@"男"];
         [stu readBook:@"《乔布斯传》"];
        
        NSString *name = [stu name];
        NSLog(@"name：%@",name);
        
        
    }
    return 0;
}
