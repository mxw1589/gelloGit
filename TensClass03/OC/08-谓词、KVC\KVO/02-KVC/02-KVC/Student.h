//
//  Student.h
//  02-KVC
//
//  Created by qinglinfu on 16/1/4.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"

@interface Student : NSObject {
    
    @private
    NSString *_name;
    int _age;
    
    Book *_book;
    
    NSArray *_books;
    
}

- (void)setName:(NSString *)name;
- (NSString *)name;

- (int)age;

@end
