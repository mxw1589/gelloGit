//
//  Player.m
//  Player1
//
//  Created by Kinglin_Fu on 15/7/24.
//  Copyright (c) 2015年 zjq. All rights reserved.
//

#import "Player.h"
#import "Hero.h"
#import "Hero1.h"
#import "Hero2.h"

@implementation Player

- (void)playGame
{
    [self chooseHero];

}

- (void)chooseHero
{
    int number;
    NSLog(@"请输入一个数字 1 ~3 ,选择一个英雄：");
    scanf("%d%*c", &number); // %*c 清除IO缓存区的输入字符
    
    if (number == 1)
    {
        _hero = [[Hero alloc] initWithName:@"疾风剑豪" withRed:400 withBlue:200];
    }
    else if(number == 2)
    {
        _hero = [[Hero1 alloc] initWithName:@"放逐之刃" withRed:300 withBlue:150];
    }
    else if(number == 3)
    {
        _hero = [[Hero2 alloc] initWithName:@"EZ" withRed:350 withBlue:250];
    }
    else
    {
        NSLog(@"没有这个英雄！");
    }
    
    
    [self handld:_hero];

}

- (void)handld:(SHero *)hero
{
    char b;
    NSLog(@"请选择Q,W,E,R中得其中一个技能");
    scanf("%c", &b);
    
    if (b == 'q' || b == 'Q')
    {
        [hero Qskill];
    }
    else if(b == 'w' || b == 'W')
    {
        [hero Wskill];
    }
    else if(b == 'e' || b == 'E')
    {
        [hero Eskill];
    }
    else if(b == 'r' || b == 'R')
    {
        [hero Rskill];
    }
    else
    {
        NSLog(@"没有这个技能！");
    }
}



@end
