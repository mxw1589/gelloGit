//
//  ViewController.m
//  05-线程安全
//
//  Created by qinglinfu on 16/3/4.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import "UserInfo.h"

@interface ViewController ()
{
    int _ticketValue;
    NSThread *_threadOne;
    NSThread *_threadTwo;
    NSThread *_threadThree;
    
    NSThread *_threadA;
    NSThread *_threadB;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _ticketValue = 10;
    
    _threadOne = [[NSThread alloc] initWithTarget:self selector:@selector(buyTicket) object:nil];
    _threadOne.name = @"顾客A";
    
    _threadTwo = [[NSThread alloc] initWithTarget:self selector:@selector(buyTicket) object:nil];
    _threadTwo.name = @"顾客B";
    
    _threadThree = [[NSThread alloc] initWithTarget:self selector:@selector(buyTicket) object:nil];
    _threadThree.name = @"顾客C";
    
    
    _threadA = [[NSThread alloc] initWithTarget:self selector:@selector(writeUserInfo) object:nil];
    _threadA.name = @"线程A";
    
    _threadB = [[NSThread alloc] initWithTarget:self selector:@selector(readUserInfo) object:nil];
    _threadB.name = @"线程B";
    
}

- (void)writeUserInfo
{
    [UserInfo shareUserInfo].userEmail = @"453252@qq.com";
    NSLog(@"A%@",[UserInfo shareUserInfo]);

}

- (void)readUserInfo
{
    NSString *userEmail = [UserInfo shareUserInfo].userEmail;
    NSLog(@"B%@",[UserInfo shareUserInfo]);
}


- (void)buyTicket
{
    
    while (_ticketValue > 0) {
        
        // 同步锁，在锁里面的代码同时只允许一个线程执行，其他线程必须等待执行完才能执行。
        @synchronized(self) {
            
            if (_ticketValue == 0) {
                
                [NSThread exit];
            }
            _ticketValue--;
            
            [NSThread sleepForTimeInterval:1];
            
            NSLog(@"%@买了一张票， 还剩 %d 张",[NSThread currentThread].name, _ticketValue);
        }
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // [_threadOne start];
    // [_threadTwo start];
    // [_threadThree start];
    
    [_threadA start];
    [_threadB start];
}


@end
