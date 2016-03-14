//
//  Person.m
//  07-代理设计模式
//
//  Created by qinglinfu on 15/12/30.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [NSTimer scheduledTimerWithTimeInterval:1
                                         target:self
                                       selector:@selector(toFindHouse:)
                                       userInfo:nil
                                        repeats:YES];
    }
    return self;
}


- (void)setDelegate:(id<FindHouseDelegate>)delegate
{
    _delegate = delegate;
}

- (id<FindHouseDelegate>)delegate
{
    return _delegate;
}


- (void)toFindHouse:(NSTimer *)timer
{
    // 怎么找房
    float price = [self.delegate findHouse];
    if (price <= 1000) {
        
        NSLog(@"房租：%.2f 可以了，不用找了！",price);
        [timer invalidate];
        
        return;
    }
    
    NSLog(@"房租：%.2f,太贵了再找",price);
    
}

@end
