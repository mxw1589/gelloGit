//
//  Firend.m
//  07-代理设计模式
//
//  Created by qinglinfu on 15/12/30.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "Firend.h"

@implementation Firend

- (float)findHouse
{
    NSLog(@"朋友找房子！");
    
    // arc4random_uniform(1500) 随机产生1500以内的正整数。
    float price = (float)arc4random_uniform(1500);
    
    return price;
}

@end
