//
//  Dog.m
//  05-循环引用
//
//  Created by qinglinfu on 15/12/31.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "Dog.h"
#import "Person.h"

@implementation Dog

-(void)dealloc
{
    NSLog(@"Dog对象销毁了！");
}
@end
