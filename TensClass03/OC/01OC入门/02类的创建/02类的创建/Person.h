//
//  Person.h
//  02类的创建
//
//  Created by qinglinfu on 15/12/22.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
    
    // 属性(实例变量)
    NSString *name;
    NSInteger age;
    CGFloat height;
    NSString *ID;
}

// 方法(行为、功能)
//void eat(int value);
- (void)eat:(int)value;
- (void)sleep;
- (void)think;

@end
