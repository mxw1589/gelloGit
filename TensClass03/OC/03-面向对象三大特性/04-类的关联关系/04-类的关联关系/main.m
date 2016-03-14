//
//  main.m
//  04-类的关联关系
//
//  Created by qinglinfu on 15/12/25.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Book.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Student *stu = [[Student alloc] init];
        Book *book = [[Book alloc] init];
        stu.book = book;
        [stu readBook];
        
        stu.book.bookName = @"《OC编程》";
    }
    return 0;
}
