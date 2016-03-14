//
//  Person.h
//  07-代理设计模式
//
//  Created by qinglinfu on 15/12/30.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FindHouseDelegate <NSObject>

- (float)findHouse;

@end

@interface Person : NSObject {
    
    NSString *_name;
    
    // 实现了协议的代理对象
    id<FindHouseDelegate>_delegate;
}

// 代理对象的set\get 方法
- (void)setDelegate:(id<FindHouseDelegate>)delegate;
- (id<FindHouseDelegate>)delegate;


//- (void)toFindHouse;

@end
