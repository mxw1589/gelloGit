//
//  main.m
//  NSNumber_Demo
//
//  Created by Kinglin_Fu on 15/7/25.
//  Copyright (c) 2015年 tens十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...

        //------------------NSNumber---------------------
        // NSNumber 用于将基本数据类型保存为对象类型。
        
        //基本数据类型转为NSNumber
        // 快捷创建方式
        NSNumber *num = @100;
        NSNumber *num1 = @54.435435;
        NSNumber *num2 = @YES;
         NSLog(@"num = %@",num);
        
        //实例方法
        NSNumber *num3 = [[NSNumber alloc] initWithDouble:23.34];
         NSLog(@"num3 = %@",num3);
        
        //类方法创建
        NSNumber *num4 = [NSNumber numberWithBool:YES];
        NSLog(@"num4 = %@",num4);
        
        
        // NSNumber 转为基本数据类型
        int v = [num intValue];
        int v1 = [num doubleValue];
        NSInteger v2 = [num integerValue];
        
        
        //--------------------------NSValue-----------------------
        // NSNumber 不能用于结构体的数据保存. NSValue 可以将结构体保存为对象类型
        
        
        // 1、把结构体类型转为NSValue对象类型
        NSRange range = {10,20};
        // 把结构体类型的NSRange转为NSValue对象类型
        NSValue *value_range = [NSValue valueWithRange:range];
        NSLog(@"%ld,%ld",range.length,range.location);
        NSLog(@"%@",value_range);
        
        NSPoint point = {100,200};
        //NSPoint 转为 NSValue
        NSValue *value_point = [NSValue valueWithPoint:point];
        
        NSSize size = {100,234};
        // NSSize 转为 NSValue
        NSValue *value_size = [NSValue valueWithSize:size];
        
        
        // 2、把NSValue转为对应的结构体类型
        NSRange range_ = [value_range rangeValue];
        NSPoint point_ = [value_point pointValue];
        NSSize size_ = [value_size sizeValue];
        
        
        // 3、把自定义的结构体类型转为NSValue对象类型
        struct Student
        {
            char *name;
            int age;
            long stuID;
        }stu;
        
        stu.name = "加快建立可";
        stu.age = 19;
        stu.stuID = 32153453;
        
        
        //01、把结构体类型编码为 对应的 char * 类型
        char *StuType = @encode(struct Student);
        
        //02、将结构体变量 stu 封装为 NSValue
        NSValue *value_stu = [NSValue value:&stu withObjCType:StuType];
        NSLog(@"stu = %@",value_stu);
        
        struct Student stu_;
        //03、将 NSValue 解封为对应的结构体类型
        [value_stu getValue:&stu_];
        
        // 对字符串数据转码UTF8
        NSString *name = [NSString stringWithUTF8String:stu_.name];
        NSLog(@"naem:%@, age:%d,stuID:%ld",name,stu_.age,stu_.stuID);
        
    }
    return 0;
}
