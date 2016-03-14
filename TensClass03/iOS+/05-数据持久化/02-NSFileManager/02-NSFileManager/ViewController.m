//
//  ViewController.m
//  02-NSFileManager
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
   
    // [self createDirectory];
    
    // [self createFile];
    
    // [self writeDataToFile];
    
    [self deleteFile];
    
}

- (NSString *)documentsPath
{
     NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    return docPath;
}

#pragma mark - 创建目录
- (void)createDirectory
{
    // NSFileManager: 用于文件的管理，创建目录、创建文件、删除文件...
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *dirPath = [[self documentsPath] stringByAppendingPathComponent:@"Datas"];
    
    NSLog(@"%@",dirPath);
    NSError *error;
    // 在指定的文件中创建目录
    BOOL isSuccess = [manager createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&error];
    if (isSuccess) {
        
        NSLog(@"目录创建成功！");
    } else {
        NSLog(@"目录创建失败！");
    }
}

#pragma mark - 创建文件并写入数据
- (void)createFile
{
    NSFileManager *manager = [NSFileManager defaultManager];
    
    NSString *filePath = [[self documentsPath] stringByAppendingPathComponent:@"Datas/text"];
    
    NSData *data = [@"保存的文件" dataUsingEncoding:NSUTF8StringEncoding];
    // 在指定的目录中创建文件
    BOOL isSuccess = [manager createFileAtPath:filePath contents:data attributes:nil];
    if (isSuccess) {
        
        NSLog(@"文件创建成功！");
    } else {
        NSLog(@"文件创建失败！");
    }
}

#pragma mark - 将数据写入文件
- (void)writeDataToFile
{
    NSString *filePath = [[self documentsPath] stringByAppendingPathComponent:@"Datas/file.plist"];
    NSLog(@"%@",filePath);
    
    NSString *text = @"这是本地保存的信息";
    NSError *error;
    // 将NSStirng类型数据写入指定的路径，只需要提供写入的路径不需要提前创建好目录或者文件。
     BOOL isSuccess_str = [text writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    // 将NSDictionary 数据写入指定的路径
    NSDictionary *userInfo = @{@"fileName":@"用户信息",@"createDate":[NSDate date]};
    BOOL isSuccess_dic = [userInfo writeToFile:filePath atomically:YES];
    
    
    // 将NSArray 数据写入
    NSArray *users = @[@"张三",@"摄氏度",@"小强"];
    BOOL isSuccess_array = [users writeToFile:filePath atomically:YES];
    
    if (isSuccess_array) {
        
        NSLog(@"数据写入成功！");
        
    } else {
        NSLog(@"数据写入失败！%@",error);
    }
}

#pragma mark - 删除文件\目录
- (void)deleteFile
{
    NSFileManager *manager = [NSFileManager defaultManager];
    
    NSString *filePath = [[self documentsPath] stringByAppendingPathComponent:@"Datas/file.plist"];
    
    NSError *error;
    // 删除指定路径的目录或者文件
    BOOL isSuccess = [manager removeItemAtPath:filePath error:&error];
    
    if (isSuccess) {
        
        NSLog(@"文件删除成功！");
        
    } else {
        NSLog(@"文件删除失败！%@",error);
    }
}



@end
