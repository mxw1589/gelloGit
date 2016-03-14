//
//  ViewController.m
//  02-NSThread_demo
//
//  Created by qinglinfu on 16/3/2.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSThread *_threadC;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageViewOne;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewTwo;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewThree;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (IBAction)buttonAction:(UIButton *)sender {
    
    //  方式一：创建线程手动设置线程启动
    
    // 创建一个线程，并且去调用一个方法
     NSThread *threadA = [[NSThread alloc] initWithTarget:self selector:@selector(run_thread_A) object:nil];
    // 设置线程的名称
    threadA.name = @"线程A";
    // 启动线程，必须启动才能执行
    [threadA start];
    
    // 阻塞线程(让线程等待多时秒后再执行)
     [NSThread sleepForTimeInterval:3];
    
    // 阻塞到指定的日期
    // [NSThread sleepUntilDate:[[NSDate date] dateByAddingTimeInterval:1000]];
    
    NSThread *threadB = [[NSThread alloc] initWithTarget:self selector:@selector(run_thread_B) object:nil];
    threadB.name = @"线程B";
    [threadB start];
    
    
    _threadC = [[NSThread alloc] initWithTarget:self selector:@selector(run_thread_C) object:nil];
    _threadC.name = @"线程C";
    [_threadC start];

    
    // 方式二：创建线程并且自动执行
    // [NSThread detachNewThreadSelector:@selector(run_thread_A) toTarget:self withObject:nil];
    //[NSThread detachNewThreadSelector:@selector(run_thread_B) toTarget:self withObject:nil];
    // [NSThread detachNewThreadSelector:@selector(run_thread_C) toTarget:self withObject:nil];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 取消线程
    [_threadC cancel];
}

- (void)run_thread_A
{
    UIImage *image = [self downloadImagOne];
    [_imageViewOne performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:NO];
}
- (void)run_thread_B
{
    UIImage *image = [self downloadImagTwo];
    [_imageViewTwo performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:NO];
}
- (void)run_thread_C
{
    UIImage *image = [self downloadImagThree];
    [_imageViewThree performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:NO];
}


#pragma mark - 图片数据下载
- (UIImage *)downloadImagOne
{
    // 获取当前所在的线程
    NSLog(@"one:%@",[NSThread currentThread]);
    NSString *imageUrl = @"http://img.ivsky.com/img/tupian/pre/201507/01/yindian_meinv-001.jpg";
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
    return [UIImage imageWithData:imageData];
}

- (UIImage *)downloadImagTwo
{
    NSLog(@"two:%@",[NSThread currentThread]);
    NSString *imageUrl = @"http://img.ivsky.com/img/tupian/pre/201507/01/yindian_meinv-002.jpg";
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
    return [UIImage imageWithData:imageData];
}

- (UIImage *)downloadImagThree
{
    NSLog(@"three:%@",[NSThread currentThread]);
    NSString *imageUrl = @"http://img.ivsky.com/img/tupian/pre/201507/01/yindian_meinv.jpg";
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
    return [UIImage imageWithData:imageData];
}




@end
