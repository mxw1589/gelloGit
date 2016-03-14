//
//  ViewController.m
//  02-AFNetworking使用
//
//  Created by qinglinfu on 16/3/2.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#define APPID @"16246"
#define SIGN @"37ee6f6ee41d474abdf9f89dd29a58dc"

#import "ViewController.h"
#import <AFNetworking.h>
#import "NSDate+Extension.h"
#import "DrawDownLoadView.h"
#import "DetailViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet DrawDownLoadView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self detectionNet];
    
    NSLog(@"%@",NSHomeDirectory());
    
}

#pragma mark - 网络检测
- (void)detectionNet
{
    // 1、监测网络
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    // 2、网络改变后的回调
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WiFi网络!");
                
                // [self request_GET];
                
                // [self request_POST];
                
                // [self request_download];
                
                [self request_upload];
                
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"WWAN网络！");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"无网络服务！");
                break;
            default:
                NSLog(@"未知网络！");
                break;
        }
    }];
}

#pragma mark - GET请求
- (void)request_GET
{
    
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    
    NSString *area = @"";
    NSString *areaid = @"101270101";
    NSString *month = @"201602";
    NSString *appid = APPID;
    NSString *timestamp = [NSDate currentDateFormate];
    NSString *sign = SIGN;
    
    // 参数以字典的形式传入
    NSMutableDictionary *paramets = [NSMutableDictionary dictionary];
    [paramets setObject:area forKey:@"area"];
    [paramets setObject:areaid forKey:@"areaid"];
    [paramets setObject:month forKey:@"month"];
    [paramets setObject:appid forKey:@"showapi_appid"];
    [paramets setObject:timestamp forKey:@"showapi_timestamp"];
    [paramets setObject:sign forKey:@"showapi_sign"];

    NSString *baseURL = @"https://route.showapi.com/9-7";
    [mamager GET:baseURL parameters:paramets progress:^(NSProgress * _Nonnull downloadProgress) {
        
        NSLog(@"---%lld",downloadProgress.totalUnitCount);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"完成：%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"数据获取失败 %@",error);
        
    }];
}

#pragma mark - POST请求
- (void)request_POST
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *area = @"";
    NSString *areaid = @"101270101";
    NSString *month = @"201602";
    NSString *appid = APPID;
    NSString *timestamp = [NSDate currentDateFormate];
    NSString *sign = SIGN;
    
    NSMutableDictionary *paramets = [NSMutableDictionary dictionary];
    [paramets setObject:area forKey:@"area"];
    [paramets setObject:areaid forKey:@"areaid"];
    [paramets setObject:month forKey:@"month"];
    [paramets setObject:appid forKey:@"showapi_appid"];
    [paramets setObject:timestamp forKey:@"showapi_timestamp"];
    [paramets setObject:sign forKey:@"showapi_sign"];
    
    NSString *baseURL = @"https://route.showapi.com/9-7";
    [manager POST:baseURL parameters:paramets progress:^(NSProgress * _Nonnull uploadProgress) {
        
        NSLog(@"%@",uploadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"数据加载成功: %@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"数据获取失败：%@",error);
    }];
}


#pragma mark - 下载数据
- (void)request_download
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *downloadURL = @"https://github.com/AFNetworking/AFNetworking/archive/master.zip";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:downloadURL]];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        NSLog(@"%lld",downloadProgress.completedUnitCount);
        dispatch_async(dispatch_get_main_queue(), ^{
           
            CGFloat completedUnitCount = downloadProgress.completedUnitCount;
            self.progressView.progress = completedUnitCount / downloadProgress.totalUnitCount;
        });
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        NSLog(@"%@",response.suggestedFilename);
        
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        NSLog(@"下载完成：%@",filePath);
        
    }];
    
    [downloadTask resume];
}

#pragma mark - 上传数据
- (void)request_upload
{
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    // 设置响应返回的数据类型为二进制类型
    mamager.responseSerializer = [AFHTTPResponseSerializer serializer];
    

    NSString *uploadURL = @"http://www.mftp.info";
    
    [mamager POST:uploadURL parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSData *imageData = UIImageJPEGRepresentation([UIImage imageNamed:@"photo.jpg"], 1);
        [formData appendPartWithFileData:imageData name:@"photoImage" fileName:@"photo" mimeType:@"image/jpge"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        // 下载进度
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            CGFloat completedUnitCount =  uploadProgress.completedUnitCount;
            self.progressView.progress = completedUnitCount / uploadProgress.totalUnitCount;
        });
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 数据下载完成
        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        detailVC.htmlString = result;
        [self presentViewController:detailVC animated:YES completion:nil];
        
        NSLog(@"上传完成%@",result);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"上传失败：%@",error.userInfo);
    }];
    
}

@end
