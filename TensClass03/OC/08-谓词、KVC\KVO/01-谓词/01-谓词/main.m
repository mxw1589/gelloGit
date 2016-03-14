//
//  main.m
//  01-谓词
//
//  Created by qinglinfu on 16/1/4.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSArray *names = @[@"张三",@"小士",@"小强",@"rese",@"JAKE"];
        NSArray *ages = @[@30,@40,@19,@20,@25];
        NSArray *scores = @[@85,@90,@75,@95,@65];
        
        NSMutableArray *students = [NSMutableArray arrayWithCapacity:5];
        
        for (int i = 0; i<5; i++) {
            
            Student *stu = [[Student alloc] init];
            stu.name =names[i];
            stu.age = [ages[i] intValue];
            stu.score = [scores[i] floatValue];
            
            [students addObject:stu];
            
        }
        
        // 谓词
        // 1、创建一个谓词（过滤的关键字）
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age > 20"];
        // 2、用谓词查询数组中符合条件的元素
        NSArray *stus = [students filteredArrayUsingPredicate:predicate];
        NSLog(@"年龄大于20岁：%@",stus);
        
        
        NSPredicate *predicate_01 = [NSPredicate predicateWithFormat:@"age > 20 && score > 80"];
        NSArray *stus_01 = [students filteredArrayUsingPredicate:predicate_01];
        NSLog(@"%@",stus_01);
        
        NSPredicate *predicate_02 = [NSPredicate predicateWithFormat:@"name == '张三'"];
        NSArray *stus_02 = [students filteredArrayUsingPredicate:predicate_02];
        NSLog(@"%@",stus_02);
        
        // IN{...} 包含在{}内的
        NSPredicate *predicate_03 = [NSPredicate predicateWithFormat:@"age IN {20,40,30}"];
        NSArray *stus_03 = [students filteredArrayUsingPredicate:predicate_03];
        NSLog(@"%@",stus_03);
        
        // BEGINSWITH 以什么开头 条件要 单引号‘’引起。
        NSPredicate *predicate_04 = [NSPredicate predicateWithFormat:@"name BEGINSWITH 'J'"];
        NSArray *stus_04 = [students filteredArrayUsingPredicate:predicate_04];
        NSLog(@"%@",stus_04);
        
        // ENDSWITH 以什么结尾. [c]表示忽略大小写
        NSPredicate *predicate_05 = [NSPredicate predicateWithFormat:@"name ENDSWITH[c] 'e'"];
        NSArray *stus_05 = [students filteredArrayUsingPredicate:predicate_05];
        NSLog(@"%@",stus_05);
        
        
        // CONTAINS 包含关键字
        NSPredicate *predicate_06 = [NSPredicate predicateWithFormat:@"name CONTAINS '小'"];
        NSArray *stus_06 = [students filteredArrayUsingPredicate:predicate_06];
        NSLog(@"06%@",stus_06);
        
        
        // LIKE : 关键字查询
        /*
         
         * : 表示任意个数的字符
         name LIKE '*e*'： 包含 e 
         name LIKE '小*'：  以 ‘小’开头
         name LIKE[c] '*e': 以 ‘e’ 结尾
         
         ？：表示一个站位符
         name LIKE '?e*' ： 第二个字符为 ‘e’
         
         */
        NSPredicate *predicate_07 = [NSPredicate predicateWithFormat:@"name LIKE '*e*'"];
        NSArray *stus_07 = [students filteredArrayUsingPredicate:predicate_07];
        NSLog(@"06%@",stus_07);
        
        
        NSPredicate *predicate_08 = [NSPredicate predicateWithFormat:@"name LIKE '小*'"];
        NSArray *stus_08 = [students filteredArrayUsingPredicate:predicate_08];
        NSLog(@"08%@",stus_08);

        
        NSPredicate *predicate_09 = [NSPredicate predicateWithFormat:@"name LIKE[c] '*e'"];
        NSArray *stus_09 = [students filteredArrayUsingPredicate:predicate_09];
        NSLog(@"09%@",stus_09);
        
        
        NSPredicate *predicate_10 = [NSPredicate predicateWithFormat:@"name LIKE '?e*'"];
        NSArray *stus_10 = [students filteredArrayUsingPredicate:predicate_10];
        NSLog(@"10%@",stus_10);
        
        
        // 可以接受格式符
        NSString *key = @"A";
        NSString *pStr = [NSString stringWithFormat:@"name LIKE '?%@*'",key];
        NSPredicate *predicate_11 = [NSPredicate predicateWithFormat:pStr];
        NSArray *stus_11 = [students filteredArrayUsingPredicate:predicate_11];
        NSLog(@"11%@",stus_11);
        
        
        // 可变数组的查询filterUsingPredicate: 将查询的结果放到原有数组中。
        NSPredicate *predicate_12 = [NSPredicate predicateWithFormat:@"name LIKE '*e*'"];
        [students filterUsingPredicate:predicate_12];
        NSLog(@"%@",students);
        
    }
    return 0;
}
