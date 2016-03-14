//
//  Player.h
//  04-KVO练习
//
//  Created by qinglinfu on 16/1/5.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Hero;

@interface Player : NSObject

@property(nonatomic, copy)NSString *name;
@property(nonatomic, strong)Hero *hero;

- (void)addRedValue;
- (void)addBlueValue;

- (void)playGame;

@end
