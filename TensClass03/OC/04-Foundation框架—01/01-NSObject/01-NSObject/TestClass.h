//
//  TestClass.h
//  01-NSObject
//
//  Created by qinglinfu on 15/12/27.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestClass : NSObject


- (void)testMethod;

- (void)testMethodObject:(NSNumber *)obj;

- (void)testMethod:(NSString *)obj1 withObject:(NSString *)obj2;

@end
