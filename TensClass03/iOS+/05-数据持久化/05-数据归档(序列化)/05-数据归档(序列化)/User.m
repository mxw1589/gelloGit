//
//  User.m
//  05-数据归档(序列化)
//
//  Created by qinglinfu on 16/2/27.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "User.h"

@implementation User

// 实现<NSCoding>协议，对数据编码
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_userName forKey:@"userName"];
    [aCoder encodeObject:_userPassword forKey:@"userPassword"];
    [aCoder encodeObject:@(_phoneNumber) forKey:@"phoneNumber"];
}


// 实现<NSCoding>协议,对数据解码
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
       
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
        self.userPassword = [aDecoder decodeObjectForKey:@"userPassword"];
        self.phoneNumber = [[aDecoder decodeObjectForKey:@"phoneNumber"] integerValue];
    }
    
    return self;
}
@end
