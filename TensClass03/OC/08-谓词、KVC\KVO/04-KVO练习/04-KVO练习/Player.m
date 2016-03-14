//
//  Player.m
//  04-KVO练习
//
//  Created by qinglinfu on 16/1/5.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "Player.h"
#import "Hero.h"

@implementation Player


- (void)dealloc
{
    [_hero removeObserver:self forKeyPath:@"redValue"];
    [_hero removeObserver:self forKeyPath:@"blueValue"];
}

- (void)playGame
{
    [self.hero addObserver:self
                forKeyPath:@"redValue"
                   options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                   context:NULL];
    
    [self.hero addObserver:self
                forKeyPath:@"blueValue"
                   options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                   context:NULL];
    
    
}



- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context
{
    if ([keyPath isEqualToString:@"redValue"]) {
        
        NSInteger newRedValue = [change[@"new"] integerValue];
        NSLog(@"当前血量：%ld",newRedValue);
        
        if (newRedValue < 50) {
        
            [self addRedValue];
        }
    
        
    } else if([keyPath isEqualToString:@"blueValue"]) {
        
        NSInteger blueValue = [change[@"new"] integerValue];
        NSLog(@"当前蓝量：%ld",blueValue);
        
        if (blueValue < 40) {
            
            [self addBlueValue];
        }
    }
    
}


- (void)addRedValue
{
    NSLog(@"给英雄加血！");
    self.hero.redValue += 50;
}

- (void)addBlueValue
{
    self.hero.blueValue += 40;
}

@end
