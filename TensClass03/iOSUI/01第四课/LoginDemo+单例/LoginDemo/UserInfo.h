//
//  UserInfo.h
//  LoginDemo
//
//  Created by Chen on 16/1/18.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject

@property (copy, nonatomic) NSString *userName;
@property (copy, nonatomic) NSString *password;

+ (instancetype)shareInstance;

@end
