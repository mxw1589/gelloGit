//
//  main.m
//  NSArray_Demo
//
//  Created by Kinglin_Fu on 15/12/27.
//  Copyright (c) 2015年 tens十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /*
         1、OC中的数组NSArray是一个对象类型，用于保存其他对象类型。也就是说NSArray中可以保存任意的对象类型，但是不能保存基本数据类型。如果要保存数据需要将基本数据保存为NSNumber或者NSString再保存。
         
         2、OC中并不是直接保存对象本身，而是保存对象的地址(引用)。
         
         */
        
        //-----------------------NSArray不可变数组-----------------------------
        // 1、》》》》》》》创建方式
        // 空数组
        NSArray *ary1 = [[NSArray alloc] init];
        
        // 包含多个元素
        NSArray *ary2 = [[NSArray alloc] initWithObjects:@"字符串",@"one",@100, nil];
        NSLog(@"ary2 = %@",ary2);
        
        // 从另外一个数组获取元素
        NSArray *ary3 = [[NSArray alloc] initWithArray:ary2];
        NSLog(@"ary3 = %@",ary3);
        
        // 类方法创建
        NSArray *ary4 = [NSArray arrayWithObjects:@"one",@"two",@1000, nil];
        
        // 数组不能保持基本数据类型的数据
//         NSArray *ary4 = [NSArray arrayWithObjects:@"one",@"two",1000, nil];
        
        Person *per = [[Person alloc] init];
        NSArray *ary5 = [NSArray arrayWithObject:per];
        NSLog(@"ary5 = %@",ary5);
        
        
        //2、》》》》》》》》》》 NSArray常用方法
        
        NSArray *ary6 = @[@"one",@"two",@"three"];
        
        NSString *str =  ary6[1]; // 根据下标取值
        NSLog(@"str = %@",str);
        
        // id 任意的对象类型
        // 1、objectAtIndex: 根据下标获取元素
        id obj = [ary6 objectAtIndex:0];
        NSLog(@"obj= %@",obj);
        
        // 2、indexOfObject： 获取指定元素所在的位置
        NSUInteger index = [ary6 indexOfObject:@"three"];
        NSLog(@"index = %ld",index);
        
        //3、计算数组元素的个数 count
        NSUInteger count = [ary6 count];
        NSLog(@"count = %ld",count);
        
        //4、获取第一个元素 firstObject
        id firObj = [ary6 firstObject];
        NSLog(@"firObj: %@",firObj);
        
        //5、获取最后一个元素lastObject
        id lastObj = [ary6 lastObject];
        NSLog(@"lastObj: %@",lastObj);
        
        //6、在数组末尾添加一个元素
        NSArray *ary6_ = [ary6 arrayByAddingObject:@"four"];
        NSLog(@"ary6_：%@",ary6_);
        
        // 7、在数组后添加一个数组中的所有元素
        NSArray *ary7 = [ary6 arrayByAddingObjectsFromArray:ary4];
        NSLog(@"ary7 = %@",ary7);
        
        //8、用一个指定字符串把数组的所有元素链接成一个字符串
        NSString *joinStr = [ary7 componentsJoinedByString:@"-->"];
        NSLog(@"joinStr = %@",joinStr);
        
        // 9、判断数组中是否有指定的对象 containsObject
        if ([ary6 containsObject:@"two"]) {
            NSLog(@"数组包含这个对象！");
        } else {
            NSLog(@"没有这个对象！");
        }
        
        
        //-----------------------数组的遍历----------------------
        NSArray *array = @[@1,@"two",@"three",@4];
        
        //1、根据下标遍历数组
        for (int i = 0; i < array.count; i++) {
            
            id obj = array[i];
            NSLog(@"%@",obj);
        }
        
        // 2、快速遍历：for-in：不用根据下标取值可直接获得保存的元素。
        for (id obj in array) {
            
            NSLog(@"--%@",obj);
        }
        
        //3、枚举遍历，把数组元素保存到枚举对象中
        NSEnumerator *enumer = [array objectEnumerator];
        id obj_;
        // nextObject 获取枚举对象中的下一个数据
        while (obj_ = [enumer nextObject]) {
            
            NSLog(@"++%@",obj_);
        }
        
        // 4、block遍历
        [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            NSLog(@"%ld:%@",idx,obj);
        }];
        
        
    }
    return 0;
}
