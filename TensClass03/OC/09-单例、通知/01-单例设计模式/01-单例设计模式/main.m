//
//  main.m
//  01-单例设计模式
//
//  Created by qinglinfu on 16/1/5.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginPage.h"
#import "PayPage.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        LoginPage *login = [[LoginPage alloc] init];
        [login userLogin];
        
        PayPage *payPage = [[PayPage alloc] init];
        [payPage pay];
        
        
    }
    return 0;
}
