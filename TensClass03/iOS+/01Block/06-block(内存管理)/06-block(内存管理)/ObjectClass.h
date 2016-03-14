//
//  ObjectClass.h
//  06-block(内存管理)
//
//  Created by qinglinfu on 16/2/19.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TestClass;
@interface ObjectClass : NSObject

@property(retain, nonatomic) TestClass *tObj;

- (void)testMethod;
@end
