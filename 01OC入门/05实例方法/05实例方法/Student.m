//
//  Student.m
//  05实例方法
//
//  Created by qinglinfu on 15/12/22.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "Student.h"

@implementation Student

// .m 文件：用于方法的实现
- (void)setName:(NSString *)name withAge:(int)age withSex:(NSString *)sex
{
    _name = name;
    _age = age;
    _sex = sex;
}

- (NSString *)name
{
    return _name;
}

- (void)readBook:(NSString *)bookName
{
    NSLog(@"%@正在读%@",_name,bookName);
}

- (void)inputScoreC:(float)c withOC:(float)oc
{
    NSLog(@"C成绩：%.2f,OC成绩:%.2f",c,oc);
}

@end
