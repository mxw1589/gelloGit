//
//  ViewController.m
//  01-沙盒目录
//
//  Created by qinglinfu on 16/2/26.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获取当前应用的沙盒目录的路径
    NSString *homePath = NSHomeDirectory();
//    NSLog(@"%@",homePath);
    
    // Documents 目录路径
    NSString *docPath = [homePath stringByAppendingPathComponent:@"Documents"];
//    NSLog(@"%@",docPath);
    
    NSLog(@"%@",[self documentsPath]);
}


// 获取 Documents 目录路径
- (NSString *)documentsPath
{
    /*
     NSSearchPathForDirectoriesInDomains() 获取沙盒目录中对应目录的路径
     参数一： 需要的目录的名称（枚举类型）
     参数二： 从哪个主目录中获取，NSUserDomainMask 就是当前沙盒目录
     参数三： 是否返回完成的路径
     
     */
     NSString *docPath =  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    return docPath;
}

// 获取 Library 目录路径
- (NSString *)libraryPath
{
    NSString *libPath =  [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    
    return libPath;
}

// 获取tmp 目录路径
- (NSString *)tmpPath
{
    NSString *tmpPath =  NSTemporaryDirectory();
    
    return tmpPath;
}

// 获取缓存文件目录路径
- (NSString *)cachesPath
{
    NSString *cachesPath =  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    
    return cachesPath;
}


@end
