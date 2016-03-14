//
//  main.m
//  07-代理设计模式
//
//  Created by qinglinfu on 15/12/30.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Agency.h"
#import "Firend.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Agency *agency = [[Agency alloc] init];
        
        Person *per = [[Person alloc] init];
        per.delegate = agency; // Agency 作为 Person 代理对象
        
//        Firend *firend = [[Firend alloc] init];
//        per.delegate = firend; // Person 代理对象变成了 Firend
        
//        [per toFindHouse];
        
        
        [[NSRunLoop currentRunLoop] run];
        
    }
    return 0;
}
