//
//  UserLogin.m
//  02-通知中心
//
//  Created by qinglinfu on 16/1/5.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "UserLogin.h"

@implementation UserLogin

- (void)login
{
    // 登录成功后发送一个消息
    
    NSString *userName = @"tens";
    
    // 1、使用 NSNotificationCenter（通知中心）发送一条消息（NSNotification),消息包含消息名称和object数据。
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"登录成功" object:userName];
    
    // 2、发送一个消息并且传递object和userInfo
    NSDictionary *userInfo = @{@"userName":@"tens",@"userPassword":@"123456789"};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"登录成功" object:userName userInfo:userInfo];
    
}

@end
