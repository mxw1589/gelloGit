//
//  User.m
//  03-KVO
//
//  Created by qinglinfu on 16/1/4.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "User.h"

@implementation User

- (void)login
{
    // 要使用KVC 或者 set 方法触发KVO
    [self setValue:@"tens" forKey:@"userName"];
    
    [self setValue:@"987654321" forKey:@"userPassWord"];
    
//    self.userName = @"tens";
    
    // 直接给属性赋值是不能触发KVO的
    //   _userName = @"tens";
    
}

- (void)logOut
{
    
}

@end
