//
//  main.m
//  用户管理程序
//
//  Created by qinglinfu on 15/12/25.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        User *user = [User registUser];
        
        [user verifyPassword];
    
    
    }
    return 0;
}
