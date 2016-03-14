
//
//  Person.m
//  03-@property关键字
//
//  Created by qinglinfu on 15/12/31.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "Person.h"

@implementation Person


- (void)showInfo
{
    NSLog(@"name:%@, age:%d, dog:%@",_name,_age,_dog);
    
    NSPredicate
}

//- (void)setDog:(Dog *)dog
//{
//    if (_dog != dog) {
//        
//        [_dog release];
//        
//        _dog = [dog retain];
//    }
//}

//- (Dog *)dog
//{
//    return _dog;
//}

@end
