//
//  Person.h
//  04-ARC
//
//  Created by qinglinfu on 15/12/31.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic, copy)NSString *name;
@property(nonatomic, assign)int age;
@property(nonatomic, strong)NSArray *books;


@end
