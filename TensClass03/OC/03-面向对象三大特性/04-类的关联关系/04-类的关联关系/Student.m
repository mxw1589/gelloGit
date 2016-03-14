//
//  Student.m
//  04-类的关联关系
//
//  Created by qinglinfu on 15/12/25.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "Student.h"

@implementation Student

- (void)setBook:(Book *)book
{
    _book = book;
}

- (Book *)book
{
    return _book;
}


- (void)readBook
{
    // 在student 中调用哪个书的方法
    [_book showInfo];
}


@end
