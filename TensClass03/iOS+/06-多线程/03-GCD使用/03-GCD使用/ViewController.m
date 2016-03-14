//
//  ViewController.m
//  03-GCD使用
//
//  Created by qinglinfu on 16/3/2.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageViewOne;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewTwo;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewThree;

@end

/*
    1、在主队列中同步执行会一直卡住，所以不能在主队列中同步执行。
    2、在主队列中异步执行，任务会在主线程中顺序执行，因为主队列是一个串行队列。
    3、在全局队列中同步执行，任务会在主线程中顺序执行，和串行队列一样。
    4、在全局队列中异步执行，任务会在不同的线程中并发(同时)执行，因为全局队列是一个并行队列。
    5、在自定义的串行队列中同步执行,任务会在主线程中顺序执行。
    6、在自定义的串行队列中异步执行, 会创建一个新的线程在这个线程中顺序执行。
    7、自定义的并行队列执行跟全局队列执行一样。
    
    8、不管在串行还是并行队列中，只要是同步执行都是顺序执行。
 
    9、创建一个队列组(dispatch_group_t)，将任务放到队列组中执行，通过队列组可以让不同线程执行的任务最终同时处理执行的结果。

 
 */


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}
- (IBAction)buttonAction:(UIButton *)sender {
    
    // [self run_globalQueue];
    
    // [self run_creatQueue];
    
    // [self queue_group];
    
    // [self run_after];
    
    [self run_once];

}

#pragma mark - 在主队列中执行任务
- (void)run_mainQueue
{
    // 在主队列中同步执行，这样会一直等待不会做任何的操作。也就是不能再主队列中同步执行任务
    //    dispatch_sync(dispatch_get_main_queue(), ^{
    //
    //        self.imageViewOne.image = [self downloadImagOne];
    //    });
    
    
    // 在主队列中进行异步操作，不会阻碍UI更新。主队列是一个串行队列
    dispatch_async(dispatch_get_main_queue(), ^{
        
        self.imageViewOne.image = [self downloadImagOne];
        self.imageViewTwo.image = [self downloadImagTwo];
        self.imageViewThree.image = [self downloadImagThree];
    });
}

#pragma mark - 在全局队列中执行任务
- (void)run_globalQueue
{
    // 1、获取全局队列，是一个并行队列
    /*
     队列的执行优先级
     DISPATCH_QUEUE_PRIORITY_HIGH 2
     DISPATCH_QUEUE_PRIORITY_DEFAULT 0
     DISPATCH_QUEUE_PRIORITY_LOW (-2)
     DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN
     */
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    
    // 2、在全局队列中同步执行，并行队列中同步执行会导致并行队列无法并发执行，和串行队列一样了。
   
    dispatch_sync(globalQueue, ^{
        
         self.imageViewOne.image = [self downloadImagOne];
    });
    
    dispatch_sync(globalQueue, ^{
       
        self.imageViewTwo.image = [self downloadImagTwo];
    });
    
    dispatch_sync(globalQueue, ^{
        
        self.imageViewThree.image = [self downloadImagThree];
    });
   
    
    /*
    // 3、在全局的并行队列中进行异步的操作，会把每个任务放到不同的线程中并发执行
    dispatch_async(globalQueue, ^{
       
        UIImage *image = [self downloadImagOne];
        
        // 在主队列中进行UI更新
        dispatch_async(dispatch_get_main_queue(), ^{
           
            self.imageViewOne.image = image;
        });
    });
    
    dispatch_async(globalQueue, ^{

        UIImage *image = [self downloadImagTwo];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.imageViewTwo.image = image;
        });
        
    });
    
    dispatch_async(globalQueue, ^{
        
        UIImage *image = [self downloadImagThree];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.imageViewThree.image = image;
        });
    });
    */
}

#pragma mark - 自定义队列
- (void)run_creatQueue

{
    /* 
        1、自定义一个串行队列： DISPATCH_QUEUE_SERIAL 表示串行或者NULL
        2、在自定义的串行队列中异步执行，会创建一个新的线程在这个线程中顺序执行。
    */
    dispatch_queue_t serial_queue = dispatch_queue_create("串行队列", DISPATCH_QUEUE_SERIAL);
    
    /* 
        1、自定义并行队列：DISPATCH_QUEUE_CONCURRENT
        2、在自定义并行队列中异步执行，会把每一个任务放到不同的线程中并发执行
     */
    dispatch_queue_t con_queue = dispatch_queue_create("并行队列", DISPATCH_QUEUE_CONCURRENT);
    
    
    /*
    // 自定义串行队列中同步执行,会在主线程中执行会阻碍UI更新
    dispatch_sync(serial_queue, ^{
        
        UIImage *image = [self downloadImagOne];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.imageViewOne.image = image;
        });
    });
  */
    
    dispatch_async(serial_queue, ^{
       
        UIImage *image = [self downloadImagOne];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.imageViewOne.image = image;
        });
    });
    
    dispatch_async(serial_queue, ^{
        
        UIImage *image = [self downloadImagTwo];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.imageViewTwo.image = image;
        });
        
    });
    
    dispatch_async(serial_queue, ^{
        
        UIImage *image = [self downloadImagThree];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.imageViewThree.image = image;
        });
    });

}

#pragma mark - 队列组
- (void)queue_group
{
    // 1、创建一个队列组，将任务放到队列组中执行，通过队列中可以让不同线程执行的任务最终同时处理执行的结果。
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    __block UIImage *imageOne;
    __block UIImage *imageTwo;
    __block UIImage *imageThree;
    
    dispatch_group_async(group, queue, ^{
       
        imageOne = [self downloadImagOne];
    });
    
    dispatch_group_async(group, queue, ^{
        
        imageTwo = [self downloadImagTwo];
    });
    
    dispatch_group_async(group, queue, ^{
        
        imageThree = [self downloadImagThree];
    });
    
    // 当队里组中的所有任务执行完后会通知dispatch_group_notify（）这个函数执行
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
       
        self.imageViewOne.image = imageOne;
        self.imageViewTwo.image = imageTwo;
        self.imageViewThree.image = imageThree;
    });
}

#pragma mark - 延迟执行
- (void)run_after
{
    // OC 中延迟执行的方法
    // [self performSelector:<#(nonnull SEL)#> withObject:<#(nullable id)#> afterDelay:<#(NSTimeInterval)#>]
    
    // 延迟五秒执行，更阻塞区别
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
        self.imageViewOne.image = [self downloadImagThree];
    });
    
    self.imageViewTwo.image = [self downloadImagTwo];
}

#pragma mark - 一次执行
- (void)run_once
{
    // 只执行一次，是线程安全的，多用于单例的创建。
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        self.imageViewOne.image = [self downloadImagOne];
    });
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
