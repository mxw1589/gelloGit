//
//  Person.h
//  05-循环引用
//
//  Created by qinglinfu on 15/12/31.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

@interface Person : NSObject

@property(nonatomic, strong)Dog *dog;

@end
