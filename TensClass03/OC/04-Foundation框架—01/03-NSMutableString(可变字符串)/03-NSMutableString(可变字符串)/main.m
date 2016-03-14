//
//  main.m
//  03-NSMutableString(可变字符串)
//
//  Created by qinglinfu on 15/12/27.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        // 创建
        
        // 可变字符串不能这样定义
//        NSMutableString *mms = @"244242423456";
        
        NSMutableString *mStr = [[NSMutableString alloc] initWithFormat:@"123456789"];
        
        NSMutableString *ms = [[NSMutableString alloc] init];
        [ms appendString:@"12"];
        [ms setString:@"asdasfghdhdjh"];
        NSLog(@"%@",ms);
        
        // 创建指定大小的字符串
        NSMutableString *mStr1 = [[NSMutableString alloc] initWithCapacity:10];
//        NSMutableString *mStr1_ = [NSMutableString stringWithCapacity:10];
        [mStr1 appendString:@"12345"];
        
        [mStr1 setString:@"1234567890qewq"];
        NSLog(@"mstr1: %@",mStr1);
        
        
        // 1、insertString：atIndex： 在指定位置插入字符串
        [mStr insertString:@"字符串" atIndex:5];
        NSLog(@"%@",mStr);
        
        NSRange range = {8,2};
        // 2、deleteCharactersInRange 删除指定位置的字符串
        [mStr deleteCharactersInRange:range];
        NSLog(@"%@",mStr);
        
        // 3、appendString 拼接指定字符串
        [mStr appendString:@"拼接的字符串"];
        NSLog(@"%@",mStr);
        
        // 4、appendFormat 接收格式符号的拼接
        [mStr appendFormat:@"%d %f",100,32.33];
        NSLog(@"%@",mStr);
        
        //5、setString 设置字符串的内容
        [mStr setString:@"qwertyuiop"];
        NSLog(@"%@",mStr);


    }
    return 0;
}
