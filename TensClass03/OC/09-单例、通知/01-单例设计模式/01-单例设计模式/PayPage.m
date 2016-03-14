//
//  PayPage.m
//  01-单例设计模式
//
//  Created by qinglinfu on 16/1/5.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "PayPage.h"
#import "User.h"

@implementation PayPage

- (void)pay
{
    User *user = [User shareUser];
    NSLog(@"userName:%@, userID:%@",user.userName,user.userID);
}

@end
