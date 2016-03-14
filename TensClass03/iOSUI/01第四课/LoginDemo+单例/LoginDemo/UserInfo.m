//
//  UserInfo.m
//  LoginDemo
//
//  Created by Chen on 16/1/18.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "UserInfo.h"

static UserInfo *userInfo;

@implementation UserInfo

+ (instancetype)shareInstance {
 
    if (!userInfo) {
        userInfo = [[self alloc] init];
    }
    return userInfo;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    if (!userInfo) {
        userInfo = [super allocWithZone:zone];
    }
    return userInfo;
}

- (id)copy {
    return userInfo;
}


@end
