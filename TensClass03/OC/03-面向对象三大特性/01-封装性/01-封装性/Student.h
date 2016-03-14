//
//  Student.h
//  01-封装性
//
//  Created by qinglinfu on 15/12/25.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject {
    
    NSString *_email; // 默认是保护型
    
    @public
    NSString *_name;
    
    @protected
    NSString *_sex;
    NSInteger ID;
    
    @private
    int _age;

}

//@public  错误。
// OC的方法没有权限修饰关键字。在.h中声明的方法都是公开的方法，外部可以使用。
- (void)learn;

- (void)work;

@end



