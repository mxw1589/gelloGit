//
//  main.m
//  03-手机号码验证
//
//  Created by qinglinfu on 15/12/30.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+isPhoneNumber.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSString *phontNum = @"18979514082";
        
        if ([phontNum isPhoneNumber]) {
            
            NSLog(@"是手机号码！");
            
        } else {
            
            NSLog(@"不是手机号码！");
        }
    }
    return 0;
}
