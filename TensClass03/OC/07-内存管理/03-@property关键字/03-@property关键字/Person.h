//
//  Person.h
//  03-@property关键字
//
//  Created by qinglinfu on 15/12/31.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

@interface Person : NSObject {
    
//    NSString *_name;
//    int _age;
//    Dog *_dog;
}

//@property 自动生成seter\geter 和带下划线的实例变量。

// readwrite 默认生成seter和geter
@property(nonatomic, copy,readwrite)NSString *name;
@property(nonatomic, assign,readonly)int age;
@property(nonatomic, retain)Dog *dog;

- (void)showInfo;

@end
