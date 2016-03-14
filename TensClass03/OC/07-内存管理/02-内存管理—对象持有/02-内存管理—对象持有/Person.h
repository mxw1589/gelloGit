//
//  Person.h
//  02-内存管理—对象持有
//
//  Created by qinglinfu on 15/12/31.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

@interface Person : NSObject {

    NSString *_name;
    int _age;
    
    Dog *_dog;
}

- (instancetype)initWithDog:(Dog *)dog;

- (void)setName:(NSString *)name;
- (NSString *)name;

- (void)setAge:(int)age;
- (int)age;

- (void)setDog:(Dog *)dog;
- (Dog *)dog;

@end
