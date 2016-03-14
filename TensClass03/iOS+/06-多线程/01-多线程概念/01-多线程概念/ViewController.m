//
//  ViewController.m
//  01-多线程概念
//
//  Created by qinglinfu on 16/3/2.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    
    __weak IBOutlet UIImageView *imageViewThree;
    __weak IBOutlet UIImageView *imageViewTwo;
    __weak IBOutlet UIImageView *imageViewOne;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)buttonAction:(UIButton *)sender {
    
    // 1、直接在主线程中执行耗时的操作会阻碍UI的更新，导致UI卡顿无法处理触摸事件。
    
    // imageViewOne.image = [self downloadImageOne];
    // imageViewTwo.image = [self downloadImageTwo];
    // imageViewThree.image = [self downloadImageThree];
    
    // 2、在后台执行，会自动开辟一个新的线程执行任务，这样就不会阻碍UI的更新
    [self performSelectorInBackground:@selector(run_background) withObject:nil];
    
    
}

#pragma mark - 后台执行
- (void)run_background
{
   UIImage *imageOne = [self downloadImageOne];
    
    // 在主线程中进行UI更新
    [imageViewOne performSelectorOnMainThread:@selector(setImage:) withObject:imageOne waitUntilDone:NO];
    
    UIImage *imageTwo = [self downloadImageTwo];
     [imageViewTwo performSelectorOnMainThread:@selector(setImage:) withObject:imageTwo waitUntilDone:NO];
    
    UIImage *imageThree = [self downloadImageThree];
     [imageViewThree performSelectorOnMainThread:@selector(setImage:) withObject:imageThree waitUntilDone:NO];
}

#pragma mark - 图片数据下载
- (UIImage *)downloadImageOne
{
    NSLog(@"one :%@",[NSThread currentThread]);
    NSString *url = @"http://img.ivsky.com/img/tupian/pre/201507/01/yindian_meinv-001.jpg";
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    return  [UIImage imageWithData:imageData];
}

- (UIImage *)downloadImageTwo
{
    NSLog(@"two:%@",[NSThread currentThread]);
    NSString *url = @"http://img.ivsky.com/img/tupian/pre/201507/01/yindian_meinv-002.jpg";
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    return  [UIImage imageWithData:imageData];
}

- (UIImage *)downloadImageThree
{
    NSLog(@"three:%@",[NSThread currentThread]);
    NSString *url = @"http://img.ivsky.com/img/tupian/pre/201507/01/yindian_meinv.jpg";
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    return  [UIImage imageWithData:imageData];
}

@end
