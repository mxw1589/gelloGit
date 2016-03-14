//
//  main.m
//  02-KVC
//
//  Created by qinglinfu on 16/1/4.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        /*
         
         KVC： 通过实例变量的名称直接给实例变量赋值。
            1、setValue: forKey:  设值
            2、valueForKey: 取值
            3、如果实例变量有set\get方法优先调用set\get方法，如果没有再通过实例变量赋值。
            4、setValue: forKeyPath: 键路径赋值
            5、valueForKeyPath: 键路径取值
            6、KVC 可以给私有@private属性赋值
         
            7、KCV简单计算：
                @count 求个数
                @sum   求和
                @max   求最大值
                @min   求最小值
                @avg   求平均值
         */
        
        
        Student *stu = [[Student alloc] init];
        
        // KVC 给实例变量赋值
        [stu setValue:@"qqqqqqq" forKey:@"name"];
        
        // valueForKey: 使用KVC取值
        NSString *name =  [stu valueForKey:@"name"];
        NSLog(@"name:%@",name);
        
        // KVC 给基本数据类型赋值
        [stu setValue:@20 forKey:@"age"];
        int age = [[stu valueForKey:@"age"] intValue];
        NSLog(@"age:%d",age);
        
        
        
        Book *book = [[Book alloc] init];
        [stu setValue:book forKey:@"book"];
        [book setValue:@45.5 forKey:@"price"];
        
        // 使用KVC 通过键路径赋值
        [stu setValue:@"《硅谷传奇》" forKeyPath:@"book.bookName"];
        NSString *bookName = [stu valueForKeyPath:@"book.bookName"];
        
        NSLog(@"bookName：%@, price:%.2f",bookName,book.price);
        
        
//-----------------------------KVC计算----------------------------------
        Book *book1 = [[Book alloc] init];
        [book1 setValue:@30 forKey:@"price"];
        
        Book *book2 = [[Book alloc] init];
        [book2 setValue:@50 forKey:@"price"];
        
        NSArray *books = [NSArray arrayWithObjects:book,book1,book2, nil];
        [stu setValue:books forKey:@"books"];
        
    
        // 1、@count 求个数
        float booksCount = [[stu valueForKeyPath:@"books.@count"] floatValue];
        NSLog(@"个数：%.2f",booksCount);
        
        // 2、@sum 求和
        float priceSum = [[stu valueForKeyPath:@"books.@sum.price"] floatValue];
        NSLog(@"%.2f",priceSum);
        
        // 3、@max 求最大值
        float priceMax = [[stu valueForKeyPath:@"books.@max.price"] floatValue];
        NSLog(@"%.2f",priceMax);
        
        // 4、@min 求最小值
        float priceMin = [[stu valueForKeyPath:@"books.@min.price"] floatValue];
        NSLog(@"%.2f",priceMin);
        
        // 5、@avg 求平均值
        float priceAvg = [[stu valueForKeyPath:@"books.@avg.price"] floatValue];
        NSLog(@"%.2f",priceAvg);
        
    }
    return 0;
}
