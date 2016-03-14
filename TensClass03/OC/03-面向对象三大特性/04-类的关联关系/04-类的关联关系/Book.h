//
//  Book.h
//  04-类的关联关系
//
//  Created by qinglinfu on 15/12/25.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
//@class Student;

@interface Book : NSObject {
    
    NSString *_bookName;
    float _price;
    
//    Student *stu;
    
}

- (void)setBookName:(NSString *)bookName;
- (NSString *)bookName;

- (void)showInfo;

@end
