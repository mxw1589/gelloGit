//
//  TimerClass.m
//  06-NSTimer(定时器)
//
//  Created by qinglinfu on 15/12/30.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "TimerClass.h"

@implementation TimerClass

- (void)runTimer
{
    [NSTimer scheduledTimerWithTimeInterval:1    // 调用的时间间隔(秒)
                                     target:self // 调用者
                                   selector:@selector(timerMethod:) // 调用的方法
                                   userInfo:@"传递的数据"   // 传递的数据（id）
                                    repeats:YES]; // 是否重复

}

- (void)timerMethod:(NSTimer *)timer
{
    static int i = 10;
    
    // timer.userInfo： 获取定时器传入的数据
    NSString *userInfo = timer.userInfo;
    
    NSLog(@"%@ - %d",userInfo,i);
    if (i  == 0) {
        
        // invalidate 结束定时器
        [timer invalidate];
    }
    
    i--;
}

@end
