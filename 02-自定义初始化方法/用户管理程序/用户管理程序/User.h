//
//  User.h
//  用户管理程序
//
//  Created by qinglinfu on 15/12/25.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject {
    
    NSString *_userName;
    NSString *_password;
}

- (void)setUserName:(NSString *)userName;
- (NSString *)userName;

- (void)setPassword:(NSString *)password;
- (NSString *)password;


// 注册用户
+ (User *)registUser;

//验证密码
- (void)verifyPassword;

// 修改密码
- (void)modifyPassword;

// 显示信息
- (void)showUserInfo;

@end
