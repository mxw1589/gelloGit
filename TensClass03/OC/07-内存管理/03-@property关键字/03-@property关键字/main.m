//
//  main.m
//  03-@property关键字
//
//  Created by qinglinfu on 15/12/31.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Dog *dog = [[Dog alloc] init];
        Person *per = [[Person alloc] init];
        per.name = @"小强";
//        per.age = 20;  readonly 修饰没有set方法
        per.dog = dog;
        
        [per showInfo];
        
        
        
        
//        NSString *s = @"123456";
//        NSString *s1 = @"123456";
//        NSLog(@"s:%p, s1:%p",s,s1);
        
//        NSString *str = [[NSString alloc] initWithString:@"41244132"];
//        NSString *str1 = [str copy];
        
        NSMutableString *str = [[NSMutableString alloc] initWithString:@"123456"];
        // copy： 拷贝一个新的对象
        NSMutableString *str1 = [NSMutableString copy];
        
        NSLog(@"str:%p, str1:%p",str,str1);
        
        per.name = str;
        NSLog(@"str:%@, name:%@",str,per.name);
        
        [str insertString:@"插入的字符串" atIndex:2];
        NSLog(@"str:%@, name:%@",str,per.name);
        
        [dog release];
        [per release];
        
    }
    return 0;
}
