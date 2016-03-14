//
//  Player.h
//  Player1
//
//  Created by Kinglin_Fu on 15/7/24.
//  Copyright (c) 2015年 zjq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHero.h"

@interface Player : NSObject
{
    NSString *_name;
    SHero *_hero;
}

- (void)playGame;

@end
