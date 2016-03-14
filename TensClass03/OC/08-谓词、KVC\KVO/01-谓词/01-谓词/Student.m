//
//  Student.m
//  01-谓词
//
//  Created by qinglinfu on 16/1/4.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "Student.h"

@implementation Student

- (NSString *)description
{
    return  [NSString stringWithFormat:@"name:%@, age:%d, score:%.2f",_name,_age,_score];
}

@end
