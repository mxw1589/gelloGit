//
//  Disk.m
//  homeWork1
//
//  Created by guoqiang on 15-7-23.
//  Copyright (c) 2015年 tens十安科技. All rights reserved.
//

#import "Disk.h"

@implementation Disk

-(void)setCapacity:(int)capacity
{
    _capacity = capacity;
}
-(int)capacity
{
    return _capacity;
}


-(void)read
{
    NSLog(@"读取数据");
}
-(void)preserve
{
    NSLog(@"保存数据");
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%d",_capacity];
}

@end
