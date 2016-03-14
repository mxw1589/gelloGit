//
//  main.m
//  06-NSTimer(定时器)
//
//  Created by qinglinfu on 15/12/30.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TimerClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        TimerClass *timer = [[TimerClass alloc] init];
        [timer runTimer];
        
        // NSRunLoop, 运行循环。让程序不结束。
        [[NSRunLoop currentRunLoop] run];
        
    }
    return 0;
}
