//
//  NSDate+Extension.m
//  01-NSURLSession
//
//  Created by qinglinfu on 16/2/29.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

+ (NSString *)currentDateFormate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 20160229195059
    formatter.dateFormat = @"yyyyMMddHHmmss";
    
    return [formatter stringFromDate:[NSDate date]];
}

@end
