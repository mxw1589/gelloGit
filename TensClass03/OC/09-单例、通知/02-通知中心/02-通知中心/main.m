//
//  main.m
//  02-通知中心
//
//  Created by qinglinfu on 16/1/5.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserLogin.h"
#import "PayPage.h"
#import "UIPage.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        UserLogin *userLogin = [[UserLogin alloc] init];
        PayPage *payPage = [[PayPage alloc] init];
    
        UIPage *page = [[UIPage alloc] init];
        
        [userLogin login];
        
    }
    return 0;
}
