//
//  Player.m
//  08-代理设计模式练习
//
//  Created by qinglinfu on 15/12/31.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "Player.h"

@implementation Player

- (void)addRedValue
{
    // 给Hero加血
    _hero.redValue += 50;
}

- (void)addBlueValue
{
    // 给Hero加蓝
    _hero.blueValue += 30;
}


-(void)dealloc
{
    NSLog(@"Player对象销毁了！");
}

@end


