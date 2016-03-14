//
//  Car.m
//  03课堂练习一
//
//  Created by qinglinfu on 15/12/22.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "Car.h"

@implementation Car

- (void)run
{
    NSLog(@"汽车启动！");
}

- (float)speed:(float)value
{
    NSLog(@"加速 %.2f",value);
    
    return value + 200;
}

@end
