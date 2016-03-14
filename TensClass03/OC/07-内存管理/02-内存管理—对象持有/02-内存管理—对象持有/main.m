//
//  main.m
//  02-内存管理—对象持有
//
//  Created by qinglinfu on 15/12/31.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Person *per = [[Person alloc] init];
        
        Dog *dog = [[Dog alloc] init];
        per.dog = dog;
        
        Dog *dog1 = [[Dog alloc] init];
        per.dog = dog1;
        
        [per release];
        [dog release];
    }
    return 0;
}
