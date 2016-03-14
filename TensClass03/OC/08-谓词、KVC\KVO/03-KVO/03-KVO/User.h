//
//  User.h
//  03-KVO
//
//  Created by qinglinfu on 16/1/4.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property(nonatomic, copy)NSString *userName;
@property(nonatomic, copy)NSString *userPassWord;

- (void)login;

- (void)logOut;

@end
