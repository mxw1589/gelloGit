//
//  PayPage.h
//  03-KVO
//
//  Created by qinglinfu on 16/1/4.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface PayPage : NSObject

@property(nonatomic, strong)User *user;

- (void)pay;

@end
