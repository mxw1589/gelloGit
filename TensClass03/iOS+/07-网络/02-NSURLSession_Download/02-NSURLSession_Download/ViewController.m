//
//  ViewController.m
//  02-NSURLSession_Download
//
//  Created by qinglinfu on 16/3/5.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import "TSProgressView.h"

@interface ViewController ()<NSURLSessionDownloadDelegate>

@property (weak, nonatomic) IBOutlet TSProgressView *progressView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)downloadButtonAction:(UIButton *)sender {
    
    // [self sessionDownloadTask_Block];
    
    [self sessionDownloadTask_Delegate];
    
    NSLog(@"%@",NSHomeDirectory());
}

#pragma mark - NSURLSessionDownloadTask_Block
- (void)sessionDownloadTask_Block
{
    NSURL *url = [NSURL URLWithString:@"http://tsmusic24.tc.qq.com/105569954.mp3"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    // 创建请求并且设置缓存机制和请求超时时间
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:20];
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (!error) {
            
            // 1、创建保存下载文件的本地 URL
            NSURL *documentsURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
            NSURL *dataURL = [documentsURL URLByAppendingPathComponent:[response suggestedFilename]];
            // 2、将下载的数据从临时 location 移动到指定保存的 URL 中
            NSError *_error;
           [[NSFileManager defaultManager] moveItemAtURL:location toURL:dataURL error:&_error];
            if (!_error) {
                
                NSLog(@"保存成功！");
            } else {
                NSLog(@"保存失败！");
            }
            
            NSLog(@"下载完成：%@",location);
        } else {
            
            NSLog(@"下载失败：%@",error);
        }
        
    }];
    
    [downloadTask resume];

}

#pragma mark - NSURLSessionDownloadTask_Delegate
- (void)sessionDownloadTask_Delegate
{
    NSURL *url = [NSURL URLWithString:@"http://tsmusic24.tc.qq.com/105580915.mp3"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:20];
    
    
    NSURLSessionConfiguration *configuratoin = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    // 采用代理的方式处理下载结果
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuratoin delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    // 采用代理处理结果使用方式
    NSURLSessionDownloadTask *downloadTask =  [session downloadTaskWithRequest:request];
    
    [downloadTask resume];
}


#pragma mark - <NSURLSessionDownloadDelegate>

// 监听下载的进度，时时调用，做进度条的更新
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    /*
     bytesWritten: 当前下载的字节数
     totalBytesWritten： 已经下载的字节数
     totalBytesExpectedToWrite： 文件的总字节数
     */
    
    self.progressView.progress = (float)totalBytesWritten / totalBytesExpectedToWrite;
    
    
    NSLog(@"%lld, %lld, %lld",bytesWritten,totalBytesWritten,totalBytesExpectedToWrite);
}

// 下载完成，做数据的保存工作
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    // 1、创建保存下载文件的本地 URL
    NSURL *documentsURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    NSURL *dataURL = [documentsURL URLByAppendingPathComponent:downloadTask.response.suggestedFilename];
    // 2、将下载的数据从临时 location 移动到指定保存的 URL 中
    NSError *_error;
    [[NSFileManager defaultManager] moveItemAtURL:location toURL:dataURL error:&_error];
    if (!_error) {
        
        NSLog(@"保存成功！");
    } else {
        NSLog(@"保存失败！");
    }
}


@end
