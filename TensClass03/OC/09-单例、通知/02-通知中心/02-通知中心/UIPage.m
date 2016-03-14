//
//  UIPage.m
//  02-通知中心
//
//  Created by qinglinfu on 16/1/5.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "UIPage.h"

@implementation UIPage

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(action:) name:@"登录成功" object:nil];
    }
    return self;
}

- (void)action:(NSNotification *)notification
{
    NSLog(@"UIPage收到消息！");
}

@end
