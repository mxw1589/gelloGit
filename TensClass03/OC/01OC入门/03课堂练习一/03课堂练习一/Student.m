//
//  Student.m
//  03课堂练习一
//
//  Created by qinglinfu on 15/12/22.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "Student.h"

@implementation Student

- (void)learnOC
{
//    NSString *name;
    NSLog(@"学习OC");
}

- (NSString *)read:(NSString *)bookName
{
    NSLog(@"正在读%@",bookName); // %@ 对象类型的格式符
    
    return @"reading...";
}

@end
