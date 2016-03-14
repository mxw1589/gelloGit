//
//  VeriryEmailClass.m
//  01-NSString方法扩展
//
//  Created by qinglinfu on 15/12/30.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "VeriryEmailClass.h"

@implementation VeriryEmailClass

+ (BOOL)veriryEmial:(NSString *)emial
{
    // 243241243@qq.com

    if ([emial containsString:@"@"] && [emial hasSuffix:@".com"]) {
        
        NSLog(@"合法邮箱");
        
        return YES;
    }
    else {
        
        NSLog(@"邮箱不合法！");
        
        return NO;
    }
    
}




@end
