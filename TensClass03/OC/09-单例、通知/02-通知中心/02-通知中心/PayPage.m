//
//  PayPage.m
//  02-通知中心
//
//  Created by qinglinfu on 16/1/5.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "PayPage.h"

@implementation PayPage

- (void)dealloc{
    
    // 移除所有的通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    // 移除指定名称的通知
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"登录成功" object:nil];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        // 监听名称为“登录成功”的通知，一旦收到通知就调用pay:方法。
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(pay:)
                                                     name:@"登录成功"
                                                   object:nil];
    }
    return self;
}

- (void)pay:(NSNotification *)notification
{
    // 接收到登录成功的消息后再支付
    
    NSString *obj = notification.object;
    NSDictionary *userInfo = notification.userInfo;
    NSLog(@"%@ 登录成功！",obj);
    NSLog(@"用户信息：%@",userInfo);
}


@end
