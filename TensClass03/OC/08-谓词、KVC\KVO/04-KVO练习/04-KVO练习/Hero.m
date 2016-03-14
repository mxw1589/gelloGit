//
//  Hero.m
//  04-KVO练习
//
//  Created by qinglinfu on 16/1/5.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "Hero.h"

@implementation Hero

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _redValue = 400;
        _blueValue = 300;
        
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    }
    return self;
}


- (void)timerAction:(NSTimer *)timer
{
    // 英雄的血量和蓝量随着时间的减少
    self.redValue -= arc4random_uniform(80);
    self.blueValue -= arc4random_uniform(60);
    
    if (self.redValue <= 0) {
        NSLog(@"英雄死亡！");
        [timer invalidate];
    }
    
    if (self.blueValue < 0) {
        
        self.blueValue = 0;
    }

}



@end
