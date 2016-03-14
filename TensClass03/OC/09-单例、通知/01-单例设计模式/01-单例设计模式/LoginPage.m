//
//  LoginPage.m
//  01-单例设计模式
//
//  Created by qinglinfu on 16/1/5.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "LoginPage.h"
#import "User.h"

@implementation LoginPage

- (void)userLogin
{
//    User *user = [[User alloc] init];
//    user.userName = @"qqqq";
//    user.userID = @"2345678";
    
    
//    User *user1 = [[User alloc] init];
//    user1.userName = @"qqqq";
//    user1.userID = @"2345678";
    
    User *user = [User shareUser];
    user.userName = @"tens";
    user.userID = @"12345678";
    NSLog(@"%@",user);
    
    User *user1 = [User shareUser];
    NSLog(@"%@",user1);
    
    
    User *user2 = [[User alloc] init];
    NSLog(@"%@",user2);
    
    User *user3 = [user2 copy];
    NSLog(@"%@",user3);
}

@end



