//
//  ViewController.m
//  NSOperationQueue
//
//  Created by qinglinfu on 16/3/4.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSBlockOperation *_operation;
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
    
    if (!sender.selected) {
        // [self blockOperation];
        // [self operationQueue];
        
        [self operationPriority];

    } else {
        
        // 取消任务
        [_operation cancel];
    }
    
    sender.selected = !sender.selected;
 }


#pragma mark - NSInvocationOperation
- (void)invocationOPeration
{
    NSInvocationOperation *operation_1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadImagOne) object:nil];
    // 启动操作
    [operation_1 start];
    
    NSInvocationOperation *operation_2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadImagTwo) object:nil];
    [operation_2 start];
    
    NSInvocationOperation *operation_3 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadImagThree) object:nil];
    [operation_3 start];
}

#pragma mark - NSBlockOperation
- (void)blockOperation
{
    // NSBlockOperation 会在主线程中处理任务，如果使用addExecutionBlock添加了其他操作，那么这些添加的操作会被放到其他的线程中执行。至少会有一个任务在主线程中执行，只有主线程有执行任务在开辟新的线程。
    
    _operation = [[NSBlockOperation alloc] init];
//    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
//       
//        self.imageViewOne.image = [self downloadImagOne];
//    }];
    
    __weak typeof(self)weakSelf = self;
    
//    for (int i = 0; i < 100; i++) {
    
        [_operation addExecutionBlock:^{
            
            weakSelf.imageViewOne.image = [weakSelf downloadImagOne];
        }];
        
        [_operation addExecutionBlock:^{
            
            weakSelf.imageViewTwo.image = [weakSelf downloadImagTwo];
        }];
        
        [_operation addExecutionBlock:^{
            
            weakSelf.imageViewThree.image = [weakSelf downloadImagThree];
        }];
//    }
    
    [_operation start];
}


#pragma mark - NSOperationQueue
- (void)operationQueue
{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 设置最大的并发数（同时执行的任务数, 如果设为 1 就表示是一个串行的队列
    queue.maxConcurrentOperationCount = 3;
    
    // 1、队列添加操作方式一：

    NSInvocationOperation *operation_1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadImagOne) object:nil];
    
    NSInvocationOperation *operation_2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadImagTwo) object:nil];
    
    NSInvocationOperation *operation_3 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadImagThree) object:nil];

    
    // 添加依赖，后面的线程必须等到前面的完成才能执行
    [operation_2 addDependency:operation_1];
    [operation_3 addDependency:operation_2];
    
     // 将操作逐个添加到队列中,操作添加到队列后自动执行不需要start启动。
    [queue addOperation:operation_1];
    [queue addOperation:operation_2];
    [queue addOperation:operation_3];
    
    // 将多个操作添加到队列中，并且设置是否等待。等待取决于最大并发数
    //[queue addOperations:@[operation_3,operation_2,operation_1] waitUntilFinished:NO];
    
/*
    // 2、队列添加操作方式二：
    [queue addOperationWithBlock:^{
       
        UIImage *image = [self downloadImagOne];
        
        // 回到主队列中进行UI更新
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
          
            self.imageViewOne.image = image;
        }];
        
    }];
    
    [queue addOperationWithBlock:^{
       
        UIImage *image = [self downloadImagTwo];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
           
            self.imageViewTwo.image = image;
            
        }];
    }];
    
    [queue addOperationWithBlock:^{
        
        UIImage *image = [self downloadImagThree];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
           
            self.imageViewThree.image = image;
        }];
    }];
*/
}

#pragma mark - 任务的优先级
- (void)operationPriority
{
    /* NSOperationQueuePriority 操作的优先级：
     
        NSOperationQueuePriorityVeryLow = -8L,
        NSOperationQueuePriorityLow = -4L,
        NSOperationQueuePriorityNormal = 0,
        NSOperationQueuePriorityHigh = 4,
        NSOperationQueuePriorityVeryHigh = 8 
     */
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = 1;
    
    NSInvocationOperation *operation_1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadImagOne) object:nil];
    // 设置操作的优先级，在最大并发数为 1 的前提下，优先级高的最先执行。
   operation_1.queuePriority = NSOperationQueuePriorityLow;
    
    NSInvocationOperation *operation_2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadImagTwo) object:nil];
    operation_2.queuePriority = NSOperationQueuePriorityNormal;
    
    NSInvocationOperation *operation_3 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadImagThree) object:nil];
    operation_3.queuePriority = NSOperationQueuePriorityHigh;
    
    [queue addOperations:@[operation_1, operation_2, operation_3] waitUntilFinished:NO];
    
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
