//
//  ViewController.m
//  01-NSURLSession
//
//  Created by qinglinfu on 16/3/5.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#define APPID @"16246"
#define SIGN @"37ee6f6ee41d474abdf9f89dd29a58dc"

#import "ViewController.h"
#import "NSDate+Extension.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *songImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // NSURLSession:
    // NSURLSessionTask -> NSURLSessionDataTask -> NSURLSessionUploadTask ->NSURLSessionDownloadTask
    
    // https://route.showapi.com/213-4?showapi_appid=16246&showapi_timestamp=20160305104444&topid=5&showapi_sign=272ca972707b681d698dc8f3125f9ee3
    
    // [self sessionDataTask_GET];
    
    [self sessionDataTask_POST];
    
    NSLog(@"%@",NSHomeDirectory());
   
}

#pragma mark - NSURLSessionDataTask GET请求
- (void)sessionDataTask_GET
{
    // 1、创建访问的URL地址
    NSString *appid = APPID;
    NSString *timestamp = [NSDate currentDateFormat];
    NSString *topid = @"5";
    NSString *sign = SIGN;
    
    // GET 请求参数直接使用 & 拼接到URL后面
    NSString *urlStr = [NSString stringWithFormat:@"https://route.showapi.com/213-4?showapi_appid=%@&showapi_timestamp=%@&topid=%@&showapi_sign=%@",appid,timestamp,topid,sign];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    // 2、创建 request 请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 3、使用 NSURLSession 创建请求任务，任务类型为NSURLSessionDataTask
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (!error) {
        
         // JSON 数据解析
          id jsonData =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            NSLog(@"%@",jsonData);
        } else {
            
            NSLog(@"请求出错 ：%@",error);
        }
        
    }];
    
    // 4、发送请求
    [dataTask resume];
}

#pragma mark - NSURLSessionDataTask POST请求
- (void)sessionDataTask_POST
{
    // 请求的 URL 不包含参数
    NSString *baseURL = @"https://route.showapi.com/213-4";
    NSURL *url = [NSURL URLWithString:baseURL];
    
    // 1、创建一个可变的请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // 2、设置请求方式为 POST
    request.HTTPMethod = @"POST";
    
    // 3、设置请求体,POST请求的参数数据要使用HTTPBody（请求体）的方式发送，还要指明请求方式(HTTPMethod)为POST.
    NSString *appid = APPID;
    NSString *timestamp = [NSDate currentDateFormat];
    NSString *topid = @"5";
    NSString *sign = SIGN;
    NSString *bodyString = [NSString stringWithFormat:@"showapi_appid=%@&showapi_timestamp=%@&topid=%@&showapi_sign=%@",appid,timestamp,topid,sign];
    NSData *httpBody = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
    
    request.HTTPBody = httpBody;
    
    // 4、创建 NSURLSession
    
    NSURLSession *session = [NSURLSession sharedSession];    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        if (!error) {
            
            id JSONData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            NSLog(@"%@",JSONData);
        }
    }];
    
    // 5、发送请求
    [dataTask resume];
}

#pragma mark - NSURLSessionConfiguration 请求模式
- (void)sessionConfiguration
{
    NSURL *url = [NSURL URLWithString:@"http://i.gtimg.cn/music/photo/mid_album_300/w/e/000HpYWj2yGvwe.jpg"];
    
    /* 创建请求模式
        1、defaultSessionConfiguration 默认模式，会有缓存、cookie
        2、ephemeralSessionConfiguration 不会缓存，无痕浏览
        3、backgroundSessionConfigurationWithIdentifier 后台任务模式
    */
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    /* 设置缓存机制：requestCachePolicy
        
        NSURLRequestUseProtocolCachePolicy = 0, 默认机制，有缓存先加载缓存，没有进行网络获取。但是会判断缓存的有效性，缓存过期不会加载。
     
        NSURLRequestReloadIgnoringLocalCacheData = 1, 不加载缓存，总是请求网络
        NSURLRequestReloadIgnoringCacheData = NSURLRequestReloadIgnoringLocalCacheData,
     
        NSURLRequestReturnCacheDataElseLoad = 2, 有缓存先加载缓存，没有进行网络获取。不会判断缓存的有效性
        NSURLRequestReturnCacheDataDontLoad = 3, 只使用缓存，没有也不进行网络请求
     */
    configuration.requestCachePolicy = NSURLRequestUseProtocolCachePolicy;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        UIImage *image = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            self.songImageView.image = image;
        });
        
    }];
    
    [dataTask resume];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    // [self sessionConfiguration];
}


@end
