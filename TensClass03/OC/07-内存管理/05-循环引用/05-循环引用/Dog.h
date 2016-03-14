//
//  Dog.h
//  05-循环引用
//
//  Created by qinglinfu on 15/12/31.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Person.h"

@class Person; // 说明 Person是一个类

@interface Dog : NSObject

// weak：用于解决循环引用。
@property(nonatomic, weak)Person *person;

@end
