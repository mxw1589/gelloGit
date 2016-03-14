//
//  ViewController.m
//  03-NSURLSession_Upload
//
//  Created by qinglinfu on 16/3/7.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import "DrawDownLoadView.h"

@interface ViewController ()<NSURLSessionDataDelegate>
@property (weak, nonatomic) IBOutlet DrawDownLoadView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // http://www.mftp.info

}

- (IBAction)uploadButtonAction:(UIButton *)sender {
    
    // [self sessionUploadTask_Block];
    
    [self sessionUploadTask_Delegate];
}


#pragma mark - NSURLSessionUploadTask_Block
- (void)sessionUploadTask_Block
{
    // 1、创建URL
    NSURL *uploadURL = [NSURL URLWithString:@"http://www.mftp.info"];
    
    // 2、创建请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:uploadURL cachePolicy:0 timeoutInterval:20];
    request.HTTPMethod = @"POST";
    
    // 设置请求头，指明上传的数据类型是jpg格式的图片
    [request addValue:@"image/jpeg" forHTTPHeaderField:@"Conten-Type"];
    // 设置请求头，指明接收返回的数据格式为 html
    [request addValue:@"text/html" forHTTPHeaderField:@"Accept"];
    
    
    // 3、创建Session
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    // 4、创建upload任务（保存为NSData格式上传）
    
    // 将图片数据保存为 NSData 类型数据，指定为jpg格式，后面的数字表示压缩率。
    NSData *imageData = UIImageJPEGRepresentation([UIImage imageNamed:@"photo.jpg"], 1);
    
    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request fromData: imageData completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (!error) {
            
            NSString *dataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            NSLog(@"%@",dataString);
        } else {
            
            NSLog(@"%@",error);
        }
        
    }];
    
    // 开始任务
    [uploadTask resume];
}


#pragma mark - NSURLSessionUploadTask_Delegate
- (void)sessionUploadTask_Delegate
{
    // 1、创建URL
    NSURL *uploadURL = [NSURL URLWithString:@"http://www.mftp.info"];
    
    // 2、创建请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:uploadURL cachePolicy:0 timeoutInterval:20];
    request.HTTPMethod = @"POST";
    
    // 设置请求头，指明上传的数据类型是jpg格式的图片
    [request addValue:@"image/jpeg" forHTTPHeaderField:@"Conten-Type"];
    // 设置请求头，指明接收返回的数据格式为 html
    [request addValue:@"text/html" forHTTPHeaderField:@"Accept"];
    
    
    // 3、创建Session
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    
    // 4、创建上传任务，从本地文件路径上传
    
    // 文件所在本地的URL
    NSURL *fileURL = [NSURL fileURLWithPath:@"/Users/qinglinfu/Desktop/图形绘制图素材/photo.jpg"];
    
    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request fromFile:fileURL];
    
    [uploadTask resume];
}


#pragma mark - <NSURLSessionDataDelegate>

// 上传的进度监听
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend
{
    
    self.progressView.progress = (float)totalBytesSent / totalBytesExpectedToSend;
    
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    NSString *dataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"上传成功：%@",dataString);
}


@end
