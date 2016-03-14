//
//  ViewController.m
//  04-NSURLSession_(后台下载)
//
//  Created by qinglinfu on 16/3/7.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import "DrawDownLoadView.h"
#import "AppDelegate.h"

@interface ViewController ()<NSURLSessionDownloadDelegate>

@end

@implementation ViewController
{
    NSURLSessionDownloadTask *_downloadTask;
    __weak IBOutlet DrawDownLoadView *progressView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self sessionDownload_background];
    
}
- (IBAction)buttonAction:(UIButton *)sender {
    
    if (sender.tag == 0) {
        
        [_downloadTask resume];
    } else {
        
        [_downloadTask suspend];
    }
    
}

- (void)sessionDownload_background
{
    NSString *url = @"http://tsmusic24.tc.qq.com/105580915.mp3";
    
    // 使用后台模式
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"com.tens.background"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    _downloadTask = [session downloadTaskWithURL:[NSURL URLWithString:url]];
}


#pragma mark - <NSURLSessionDownloadDelegate>
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    NSLog(@"%lld, %lld, %lld",bytesWritten, totalBytesWritten,totalBytesExpectedToWrite);
    
    progressView.progress = (float)totalBytesWritten / totalBytesExpectedToWrite;
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    NSLog(@"下载完成！");
    
    
    NSURL *docURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    
    NSString *fileName = [NSString stringWithFormat:@"%d_%@",arc4random_uniform(1000),downloadTask.response.suggestedFilename];
    NSURL *fileURL = [docURL URLByAppendingPathComponent:fileName];
    
    NSError *error;
    [[NSFileManager defaultManager] moveItemAtURL:location toURL:fileURL error:&error];
    
    if (!error) {
        NSLog(@"下载保存成功");
    } else {
        
        NSLog(@"下载保存出错：%@",error);
    }
}

// 后台下载完成后调用
- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session
{
    progressView.progress = 1.0;
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    if (appDelegate.backgroundCompletionHandler) {
        void (^completionHandler)() = appDelegate.backgroundCompletionHandler;
        appDelegate.backgroundCompletionHandler = nil;
        
        // 回调后台任务的完成block
        completionHandler();
    }

    NSLog(@"+++后台下载完成！");
}



@end
