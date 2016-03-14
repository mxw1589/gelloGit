//
//  User.h
//  05-数据归档(序列化)
//
//  Created by qinglinfu on 16/2/27.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject <NSCoding>

@property(nonatomic, copy) NSString *userName;
@property(nonatomic, copy) NSString *userPassword;
@property(nonatomic, assign) NSInteger phoneNumber;

@end
