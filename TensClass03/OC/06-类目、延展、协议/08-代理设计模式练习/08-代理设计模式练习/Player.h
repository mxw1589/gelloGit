//
//  Player.h
//  08-代理设计模式练习
//
//  Created by qinglinfu on 15/12/31.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hero.h"

@interface Player : NSObject<HeroDelegate> {
    
    NSString *_name;
    
    Hero *_hero;
}

- (void)playGame:(Hero *)hero;

@end
