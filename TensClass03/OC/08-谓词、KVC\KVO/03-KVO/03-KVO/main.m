//
//  main.m
//  03-KVO
//
//  Created by qinglinfu on 16/1/4.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "PayPage.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        User *user = [[User alloc] init];
        user.userName = @"user";
        user.userPassWord = @"234567";
        
        PayPage *payPage = [[PayPage alloc] init];
        payPage.user = user;
        [payPage pay];
        
        [user login];
    
    }
    return 0;
}
