//
//  main.m
//  01-set\get方法
//
//  Created by qinglinfu on 15/12/23.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Person *per = [[Person alloc] init];
        
        // 调用set方法
        [per setName:@"qqq"];
        [per setSex:@"女"];
        [per setAge:20];
        
        // 调用get方法
        NSString *name = [per name];
        NSString *sex = [per sex];
        int age = [per age];
        
        NSLog(@"name:%@, sex:%@, age：%d",name,sex,age);

        [per work];
        
    
        //点语法调用 set \ get 方法
        per.name = @"wwwwwwww";
        per.sex = @"男";
        per.age = 30;
//
        NSString *name_ = per.name;
        NSString *sex_ = per.sex;
        int age_ = per.age;
        
//        per.work; 错误, 只有set\get方法可以使用点语法调用。普通方法用[]调用。
        
        NSLog(@"name:%@, sex:%@, age：%d",name_,sex_,age_);
    
        per.value = 341432;
    
    }
    return 0;
}
