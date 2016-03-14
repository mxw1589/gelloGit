//
//  Book.m
//  04-类的关联关系
//
//  Created by qinglinfu on 15/12/25.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "Book.h"

@implementation Book

- (void)setBookName:(NSString *)bookName
{
    _bookName = bookName;
}

- (NSString *)bookName
{
    return _bookName;
}

- (void)showInfo
{
    NSLog(@"显示书的内容");
}

@end
