//
//  NSString+Category.m
//  02-类目
//
//  Created by qinglinfu on 15/12/30.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)

- (BOOL)veriryEmial
{
    // 243241243@qq.com
    
    if ([self containsString:@"@"] && [self hasSuffix:@".com"]) {
        
        NSLog(@"合法邮箱");
        
        return YES;
    }
    else {
        
        NSLog(@"邮箱不合法！");
        
        return NO;
    }
    
}

- (BOOL)isPhoneNumber
{
    return YES;
}


- (instancetype)init
{
    NSLog(@"-------");
    
    return nil;
}



@end
