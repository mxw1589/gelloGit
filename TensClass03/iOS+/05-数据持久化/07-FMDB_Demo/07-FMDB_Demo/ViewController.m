//
//  ViewController.m
//  07-FMDB_Demo
//
//  Created by qinglinfu on 16/2/29.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import "FMDB.h"

@interface ViewController ()
{
    FMDatabase *_fmDB;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // CocoaPods学习网站 http://blog.csdn.net/lizhongfu2013/article/details/26384029
    
    // 1、github 下载 FMDB 第三方框架放到项目中
    
    // 2、添加SQLite 依赖库 libsqlite3.dylib
    
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *databasePath = [docPath stringByAppendingPathComponent:@"fmdata.sqlite"];
    
    NSLog(@"%@",databasePath);
    
    // 3、创建 FMDatabase, 提供数据库保存的地址
    _fmDB = [FMDatabase databaseWithPath:databasePath];
    
    // 4、打开数据库
    BOOL isOpen = [_fmDB open];
    
    if (!isOpen) return; // 打开失败
    
    
    // 创建表
    NSString *sql_createTable = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS User (U_ID TEXT PRIMARY KEY,U_NAME TEXT, U_AGE INTEGER)"];
    
    // 插入数据
    NSString *sql_insert = [NSString stringWithFormat:@"INSERT INTO User(U_ID,U_NAME,U_AGE) VALUES(?,?,?)"];
    
    // 更新数据、删除数据 等非查询操作都使用 executeUpdate： 完成
    
    // [self updateDatabase:sql_insert];
    
    // 查询数据
    
    NSString *sql_select = @"SELECT *FROM User WHERE U_NAME == ?";
    // [self selectDatas:sql_select];
    
    [self queue];
    
    // 关闭数据库,释放资源
    [_fmDB close];

}


- (void)updateDatabase:(NSString *)sql
{
    // 方式一：直接添加sql语句和数据
    // BOOL result = [_fmDB executeUpdate:sql,@"10001",@"许晴",@35];
    
    // 方式二：将数据保存到数组中
    NSArray *valus = @[@"10002",@"哈韩",@30];
    BOOL result = [_fmDB executeUpdate:sql withArgumentsInArray:valus];
    
    if (result) {
        NSLog(@"操作成功！");
    } else {
        
        NSLog(@"操作失败！");
    }
}

- (void)selectDatas:(NSString *)sql
{
    FMResultSet *resultSet = [_fmDB executeQuery:sql,@"许晴"];
    
    while ([resultSet next]) {
        
        NSString *uID = [resultSet stringForColumn:@"U_ID"];
        NSString *uName = [resultSet stringForColumnIndex:1];
        NSInteger uAge = [resultSet intForColumn:@"U_AGE"];
        
        NSLog(@"%@ %@, %ld",uID,uName,uAge);
    }
}


#pragma mark - 线程安全的
- (void)queue
{
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *databasePath = [docPath stringByAppendingPathComponent:@"fmdata.sqlite"];
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:databasePath];
    
    [queue inDatabase:^(FMDatabase *db) {
        
        [db executeQuery:@"....."];
        [db executeUpdate:@"...."];
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
