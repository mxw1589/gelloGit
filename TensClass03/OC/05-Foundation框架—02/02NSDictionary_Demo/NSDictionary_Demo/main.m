//
//  main.m
//  NSDictionary_Demo
//
//  Created by Kinglin_Fu on 15/7/27.
//  Copyright (c) 2015年 tens十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /*===================NSDictionary(不可变字典)的使用=======================*/
        /* 1、字典是一种键值一一对应(key -> value)的存储结构，一个键(key)对应一个值(value)，不可能存在一个键(key)对应两个值或者同一个值对应两个键。
        
           2、通过键去获取对应的值。
         
           3、键和值都是对象类型，不能使用基本数据类型。键一般是NSString类型。
        
        */
        
        //1、———————————————————————字典的创建—————————————————————————————
        
        // 前面的是值(value)，后面的是键(key)，一一对应
        // 方式一：
        NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:@"value",@"key",@"value1",@"key1", nil];
        NSLog(@"dic :%@",dic);
        
        // 方式二，类方法：
        NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"value",@"key",@"value1",@"key1", nil];
        
        // 字典的value可以说任何对象类型
        NSArray *array = @[@"q",@"w",@"e"];
        NSDictionary *dic2 = [[NSDictionary alloc] initWithObjectsAndKeys:array,@"key" ,nil];
        NSLog(@"dic2 :%@",dic2);
        
        NSDictionary *dic3 = [[NSDictionary alloc] initWithObjectsAndKeys:dic2,@"dicKey", nil];
        NSLog(@"dic3 :%@",dic3);
        
        // 方式三：跟方式一区分,这种只能是不可变字典
        NSDictionary *dic4 = @{@"key":@"vlaue",@"key1":@"value1"};
        NSLog(@"dic4 :%@",dic4);
        
        
        //2、—————————————————————————字典的常用方法——————————————————————————
        
        // count 字典元素的个数，键值一起为一个元素
        NSUInteger len =  [dic4 count];
        NSLog(@"len = %ld",len);
        
        //objectForKey :根据key取对应的值，如果没有不会报错，返回的是null
        id obj = [dic3 objectForKey:@"dicKey"];
        NSLog(@"obj:%@",obj);
        
        //allKeys 获取字典的所有key,返回的是数组
        NSArray *allKeys = [dic4 allKeys];
        NSLog(@"allKeys :%@",allKeys);
        
        //allValues 获取字典的所有Value,返回的是数组
        NSArray *allValues = [dic4 allValues];
        NSLog(@"allValues: %@",allValues);
        
        //allKeysForObject 获取相同value的所有key
        NSDictionary *dic5 = @{@"key":@"value",@"key1":@"value"};
        NSArray *allKey = [dic5 allKeysForObject:@"value"];
        NSLog(@"allKey :%@",allKey);
        
        
        /*=================NSMutableDictionary(可变字典)的使用=====================*/
        
        //1、———————————————————————————可变字典的创建—————————————————————————————
        
        // 两种方式：
        NSMutableDictionary *mDic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"abc",@"key",@"hhhh",@"key1", nil];
        
        NSMutableDictionary *mDic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"value",@"key",@"value1",@"key1", nil];
        
        //        NSMutableDictionary *mDic2 = @{@"key":@"value",@"key1":@"value1"}; 错误:不能这样创建可变字典
        NSLog(@"mDic1:%@",mDic1);
        
        
        //2、————————————————————————————可变字典的常用方法———————————————————————————
        
        //setObject:forKey 给字典添加元素，修改元素
        [mDic1 setObject:@"value2" forKey:@"key2"];
        NSLog(@"mDic1:%@",mDic1);
        // 修改key 对应的元素
        [mDic1 setObject:@"kkkkk" forKey:@"key2"];
        
        //removeObjectForKey 移除指定键的元素
        [mDic1 removeObjectForKey:@"key"];
        NSLog(@"mDic1:%@",mDic1);
        
        // removeAllObjects 移除字典所有的元素
        [mDic1 removeAllObjects];
        NSLog(@"mDic1:%@",mDic1);
        
        // removeObjectsForKeys 移除一组键对应的元素
        NSArray *keys = [mDic1 allKeys];
        [mDic1 removeObjectsForKeys:keys];
        NSLog(@"mDic1:%@",mDic1);
        
        //setDictionary 将新字典替换旧字典
        [mDic1 setDictionary:mDic];
        NSLog(@"mDic1 :%@",mDic);
        
        
        /*============================字典的遍历===================================*/
        
        NSMutableDictionary *mDic3 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"abc",@"key",@"etrtr",@"key1", nil];
        
        // 1、普通遍历
        NSArray *allkey = [mDic3 allKeys]; // 先获取所有的键，再遍历键根据键取值
        for (int i = 0; i < mDic3.count; i++) {
            
            NSString *key = [allkey objectAtIndex:i];
            NSString *value = [mDic3 objectForKey:key];
            NSLog(@"---%@",value);
        }
        
        // 2、快速遍历 obj 是字典的key
        for (id obj in mDic3) {
            
            NSString *value = [mDic3 objectForKey:obj];
            NSLog(@"==%@",value);
        }
        
        // 3、枚举遍历 keyEnumerator 拿到所有的key
        NSEnumerator *enume = [mDic3 keyEnumerator];
        id obj1;
        while (obj1 = [enume nextObject]) {
            
            NSString *value = [mDic3 objectForKey:obj1];
            NSLog(@"++%@",value);
        }
        
        // 4、block 遍历
        [mDic3 enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            
            NSLog(@">>%@",key);
            NSLog(@">>%@",obj);
        }];


    }
    return 0;
}
