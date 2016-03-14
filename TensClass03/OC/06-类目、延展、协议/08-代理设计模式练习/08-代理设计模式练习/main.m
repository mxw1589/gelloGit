//
//  main.m
//  08-代理设计模式练习
//
//  Created by qinglinfu on 15/12/31.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hero.h"
#import "Player.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Player *player = [[Player alloc] init];
        
        Hero *hero = [[Hero alloc] initDelegate:player];
        
        [player playGame:hero];
        
        [[NSRunLoop currentRunLoop] run];
        
    }
    return 0;
}
