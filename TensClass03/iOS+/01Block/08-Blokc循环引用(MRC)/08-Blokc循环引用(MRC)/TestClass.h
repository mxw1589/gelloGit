//
//  TestClass.h
//  08-Blokc循环引用(MRC)
//
//  Created by qinglinfu on 16/2/19.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TestBlock)();

@interface TestClass : NSObject

@property (nonatomic, copy)NSString *strObj;

@property (nonatomic, copy)TestBlock block;


- (void)testMethod;

@end
