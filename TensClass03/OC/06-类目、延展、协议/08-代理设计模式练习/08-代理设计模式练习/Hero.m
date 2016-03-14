//
//  Hero.m
//  08-代理设计模式练习
//
//  Created by qinglinfu on 15/12/31.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "Hero.h"

@implementation Hero
- (instancetype)initDelegate:(id<HeroDelegate>)delegate
{
    self = [super init];
    if (self) {
        
        _delegate = delegate;
        _redValue = 400; // 设置初始值
        _blueValue = 300;
        
        [NSTimer scheduledTimerWithTimeInterval:1
                                         target:self
                                       selector:@selector(timerAction:)
                                       userInfo:nil
                                        repeats:YES];
    }
    return self;
}

- (void)setRedValue:(NSInteger)redValue
{
    _redValue = redValue;
}

- (NSInteger)redValue
{
    return _redValue;
}

- (void)setBlueValue:(NSInteger)blueValue
{
    _blueValue = blueValue;
}

- (NSInteger)blueValue
{
    return _blueValue;
}


- (void)timerAction:(NSTimer *)timer
{
    // 英雄redValue和BlueValue 的减少
    _redValue -= arc4random_uniform(80);
    _blueValue -= arc4random_uniform(60);
     NSLog(@"redValue:%ld, blueValue:%ld",_redValue,_blueValue);
   
    
    if (_redValue <= 0) {
        
        NSLog(@"英雄死亡！");
        [timer invalidate];
        return;
    }
    if (_blueValue < 0) {
        
        _blueValue = 0;
    }
    
    
    if (_redValue < 50) {
        
        NSLog(@"给英雄加血！");
        [_delegate addRedValue];
    }
    
    if (_blueValue < 80) {
        
        NSLog(@"给英雄加蓝！");
        [_delegate addBlueValue];
    }
    
    NSLog(@"redValue:%ld, blueValue:%ld",_redValue,_blueValue);

}


@end
