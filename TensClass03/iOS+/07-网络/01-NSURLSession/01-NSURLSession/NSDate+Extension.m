//
//  NSDate+Extension.m
//  01-NSURLSession
//
//  Created by qinglinfu on 16/3/5.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

+ (NSString *)currentDateFormat
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMddHHmmss";
    
    return [formatter stringFromDate:[NSDate date]];
}


@end
