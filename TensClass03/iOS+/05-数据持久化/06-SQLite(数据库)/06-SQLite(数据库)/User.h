//
//  User.h
//  06-SQLite(数据库)
//
//  Created by qinglinfu on 16/2/29.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *userPassword;
@property (nonatomic, assign) NSInteger userAge;

@end
