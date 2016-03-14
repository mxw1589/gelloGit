//
//  UserInfo.h
//  05-线程安全
//
//  Created by qinglinfu on 16/3/4.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject

@property (nonatomic, copy)NSString *userEmail;
@property (nonatomic, assign) NSInteger userPhoneNumber;

+ (instancetype)shareUserInfo;

@end
