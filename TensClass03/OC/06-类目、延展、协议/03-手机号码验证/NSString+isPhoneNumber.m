//
//  NSString+isPhoneNumber.m
//  03-手机号码验证
//
//  Created by qinglinfu on 15/12/30.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "NSString+isPhoneNumber.h"

@implementation NSString (isPhoneNumber)

- (BOOL)isPhoneNumber
{
    /*
     1、11位
     2、纯数字
     3、1开头
     4、第二位：3、4、5、7、8
     */
    
    // 1342423563454
    if (self.length == 11) {  // 1、判断11位
        
        for (int i = 0; i < self.length; i++) {
            
            // characterAtIndex: 获取字符串中对应位置的字符
            char c = [self characterAtIndex:i];
            
            // 0~9 ASCII码值 48 ~ 57
            if (c < 48 && c > 57) { // 2、判断纯数字
                
                return NO;
            }
        }
        
        // 3、1开头
        if (![self hasPrefix:@"1"]) {
            return NO;
        }
        
        // 4、第二位：3、4、5、7、8
        char c = [self characterAtIndex:1];
        if (c != '3' && c != '4' &&  c != '5' && c != '7' && c != '8') {
            
            return NO;
        }
        
        return YES;
    }
    
    return NO;
}




@end
