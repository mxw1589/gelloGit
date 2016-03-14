//
//  ViewController.m
//  03-清除缓存文件
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
    
    NSLog(@"%@",NSHomeDirectory());
    
    NSLog(@"缓存文件大小：%.2f M", [self cachesCount]);

}

- (CGFloat)cachesCount
{
    NSFileManager *manager = [NSFileManager defaultManager];
    
    // 1、获取缓存文件目录
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    // 2、获取指定路径下所有的子文件和子目录
    NSArray *subPaths = [manager subpathsAtPath:cachesPath];
    
    CGFloat allFileSize = 0;
    
    for (NSString *subPath in subPaths) {
        
        NSString *subPathStr = [cachesPath stringByAppendingPathComponent:subPath];
        
        // 3、获取指定目录下文件的属性
        NSDictionary *subFileAttributes = [manager attributesOfItemAtPath:subPathStr error:nil];
        
       //  NSLog(@"%@",subFileAttributes);
        
        // 4、从属性中获取文件的字节大小进行累加
        allFileSize += [subFileAttributes[NSFileSize] floatValue];
        
        NSLog(@"%.2f",allFileSize);
        
        // 5、删除所有的缓存文件
        [manager removeItemAtPath:subPathStr error:nil];
    }
    
    // NSLog(@"%@",subPaths);
    
    return allFileSize / 1024 / 1024;
}


@end
