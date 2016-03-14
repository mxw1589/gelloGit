//
//  Student.h
//  04-类的关联关系
//
//  Created by qinglinfu on 15/12/25.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"

@interface Student : NSObject {
    
    NSString *_name;
    NSString *_sex;
    Book *_book; // 关联了Book类
}

- (void)setBook:(Book *)book;
- (Book *)book;


- (void)readBook;

@end
