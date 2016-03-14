
//
//  Person.m
//  05-循环引用
//
//  Created by qinglinfu on 15/12/31.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)dealloc
{
    NSLog(@"Person对象销毁了！");
}

@end
