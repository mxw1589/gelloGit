//
//  User.h
//  01-单例设计模式
//
//  Created by qinglinfu on 16/1/5.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject <NSCopying>

@property(nonatomic, copy)NSString *userName;
@property(nonatomic, copy)NSString *userID;

+ (User *)shareUser;

@end
