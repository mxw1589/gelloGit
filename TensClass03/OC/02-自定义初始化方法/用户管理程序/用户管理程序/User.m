//
//  User.m
//  用户管理程序
//
//  Created by qinglinfu on 15/12/25.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "User.h"

@implementation User


- (void)setUserName:(NSString *)userName
{
    _userName = userName;
}

- (NSString *)userName
{
    return _userName;
}

- (void)setPassword:(NSString *)password
{
    _password = password;
}

- (NSString *)password
{
    return _password;
}


// 注册用户
+ (User *)registUser
{
    NSLog(@"----------用户注册------------");
    User *user = [[User alloc] init];
    printf("用户名：");
    char userName[50];
    scanf("%s",userName);
    // 将char[] 转为 NSSring
    user.userName = [NSString stringWithFormat:@"%s",userName];
    
    printf("密码：");
    char password[20];
    scanf("%s",password);
    user.password = [NSString stringWithFormat:@"%s",password];
    
    return user;
}


//验证密码
- (void)verifyPassword
{
    NSLog(@"------------密码验证---------------");
    printf("请输入旧密码：");
    char oldPass[20];
    scanf("%s",oldPass);
    
    NSString *oldPassStr = [NSString stringWithFormat:@"%s",oldPass];
    
    // isEqualToString 比较两个字符串的内容是否相同
    if ([oldPassStr isEqualToString:_password]) {
        
        [self modifyPassword];
        
    }else { // 密码不正确重新输入验证
        static int count = 3;
        count--;
        NSLog(@"密码错误，还有%d次机会",count);
        if (count == 0 ) {
            
            NSLog(@"错误次数3次,24小时后再操作！");
            return;
        }
        
        [self verifyPassword];
    }
    
}

// 修改密码
- (void)modifyPassword
{
    printf("输入新密码：");
    char newPass[20];
    scanf("%s",newPass);
    NSString *newPassStr = [NSString stringWithFormat:@"%s",newPass];
    
    _password = newPassStr;
    
    [self showUserInfo];
}

// 显示信息
- (void)showUserInfo
{
    NSLog(@"用户信息：userName:%@， password:%@",_userName,_password);
}

@end
