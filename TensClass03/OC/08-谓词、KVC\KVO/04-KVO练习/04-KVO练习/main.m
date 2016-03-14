//
//  main.m
//  04-KVO练习
//
//  Created by qinglinfu on 16/1/5.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hero.h"
#import "Player.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Hero *hero = [[Hero alloc] init];
        Player *player = [[Player alloc] init];
        
        player.hero = hero;
        
        [player playGame];
        
        
        [[NSRunLoop currentRunLoop] run];
        
    }
    return 0;
}
