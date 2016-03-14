//
//  ViewController.m
//  05-NSURLSession_(断点续传)
//
//  Created by qinglinfu on 16/3/7.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import "DrawDownLoadView.h"

NSString * const TSResumeData = @"resumeData";
NSString * const TSCountOfBytesExpectedToReceive = @"countOfBytesExpectedToReceive";
NSString * const TSCountOfBytesReceived = @"countOfBytesReceived";


@interface ViewController ()<NSURLSessionDownloadDelegate>

@property (nonatomic, strong)NSURLSession *session;

@property (nonatomic, strong)NSURLSessionDownloadTask *downloadTask;
@property (weak, nonatomic) IBOutlet DrawDownLoadView *progressView;

@property (weak, nonatomic) NSData *resumeData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",NSHomeDirectory());
    
    [self readResumeDataInfo];
}

// 读取本地保存的未下载完成的数据
- (void)readResumeDataInfo
{
    self.resumeData = [[NSUserDefaults standardUserDefaults] objectForKey:TSResumeData];
    CGFloat resumeSize = [[[NSUserDefaults standardUserDefaults] objectForKey:TSCountOfBytesReceived] doubleValue];
    
    CGFloat totalSize = [[[NSUserDefaults standardUserDefaults] objectForKey:TSCountOfBytesExpectedToReceive] doubleValue];
    if(totalSize == 0) totalSize = 1;
    
    self.progressView.progress = resumeSize / totalSize;
    
}


- (IBAction)buttonAction:(UIButton *)sender {
    
    
    if (sender.tag == 0) {
        
        if (!self.resumeData) {
            [self.downloadTask resume];
            
        } else{
            
            // 恢复下载，从之前取消的进度开始下载
            NSURLSessionDownloadTask *resumeTask = [self.session downloadTaskWithResumeData:self.resumeData];
            [resumeTask resume];
        }
    
        
    } else {
        
        // 取消下载时，本地保存下载的进度和数据
        [self.downloadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
           
            self.resumeData = resumeData;
            
            NSLog(@"%lld",self.downloadTask.countOfBytesExpectedToReceive);
            NSLog(@"%lld", self.downloadTask.countOfBytesReceived);
            
            self.progressView.progress = (float)_downloadTask.countOfBytesReceived / _downloadTask.countOfBytesExpectedToReceive;

            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:resumeData forKey:TSResumeData];
            [defaults setObject:@(_downloadTask.countOfBytesExpectedToReceive) forKey:TSCountOfBytesExpectedToReceive];
            [defaults setObject:@(_downloadTask.countOfBytesReceived) forKey:TSCountOfBytesReceived];
            [defaults synchronize];
            
            
            NSLog(@"取消下载");
        }];
    }
}

- (NSURLSession *)session
{
    if (!_session) {
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    }
    
    return _session;
}

- (NSURLSessionDownloadTask *)downloadTask
{
    if (!_downloadTask) {
        
        NSURL *downloadURL = [NSURL URLWithString:@"http://tsmusic24.tc.qq.com/105580915.mp3"];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:downloadURL cachePolicy:0 timeoutInterval:20];
        _downloadTask = [self.session downloadTaskWithRequest:request];
    }
    
    return _downloadTask;
}


#pragma mark - <NSURLSessionDownloadDelegate>

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    
    self.progressView.progress = (float)totalBytesWritten / totalBytesExpectedToWrite;
}

// 恢复下载时调用，会提供下载数据的进度和总大小
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes
{
    NSLog(@"%lld, %lld", fileOffset, expectedTotalBytes);
}


- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    // 保存到本地。。
    NSLog(@"下载完成");
}

@end
