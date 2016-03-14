//
//  main.m
//  04-ARC
//
//  Created by qinglinfu on 15/12/31.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Person *per = [[Person alloc] init];
        
        // __strong: 强引用，持有对象。默认的引用是强引用
        __strong Person *per1 = [[Person alloc] init];
        
         NSLog(@"per1:%@",per1);
        per = per1;
        
        
        // __weak弱引用，所指向的对象会被relese掉。
        __weak Person *per2 = [[Person alloc] init];
        
        NSLog(@"per2:%@",per2);
        
        
    }
    return 0;
}
