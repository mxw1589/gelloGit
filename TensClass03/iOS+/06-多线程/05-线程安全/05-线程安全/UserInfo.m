//
//  UserInfo.m
//  05-线程安全
//
//  Created by qinglinfu on 16/3/4.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

static UserInfo *info = nil;
+ (instancetype)shareUserInfo
{
    // 单例的线程安全 方式一：使用 synchronized 同步锁
/*
    @synchronized(self) {
        if (!info) {
            
            NSLog(@"%@",[NSThread currentThread]);
            info = [[self alloc] init];
        }
    }
*/
    // 方式二： 使用GCD 的单一执行
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSLog(@"%@",[NSThread currentThread]);
        info = [[self alloc] init];
    });
    
    return info;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    /*
    @synchronized(self) {
        if (!info) {
            
            NSLog(@"%@",[NSThread currentThread]);
            info = [super allocWithZone:zone];
        }
    }
   */
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSLog(@"%@",[NSThread currentThread]);
        info = [super allocWithZone:zone];
    });
    
    return info;
}


@end
