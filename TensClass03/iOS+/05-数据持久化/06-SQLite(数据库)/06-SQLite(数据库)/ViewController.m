//
//  ViewController.m
//  06-SQLite(数据库)
//
//  Created by qinglinfu on 16/2/27.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>
#import "User.h"


@interface ViewController ()
{
     // 1、创建数据库结构体(相当于面向对象中的一个数据库对象)。
     sqlite3 *_sqlDB;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1、导入<sqlite3.h>,导入 libsqlite3.dylib 库
    // 2、创建\打开数据库
    [self createDatabase];
    
}

#pragma mark - 创建\打开数据库
- (void)createDatabase
{
    // 2、创建数据库保存的路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dirPath = [docPath stringByAppendingPathComponent:@"data"];
    NSFileManager *manager = [NSFileManager defaultManager];
    [manager createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:nil];
    
    NSString *dbPath = [docPath stringByAppendingPathComponent:@"data/data.sqlite"];
    
    NSLog(@"%@",dbPath);
    // 3、创建或者打开数据库
    
    int result = sqlite3_open([dbPath UTF8String], &_sqlDB);
    if (result == SQLITE_OK) {
        
        NSLog(@"数据库创建、打开成功！");
        
        // 打开成功再创建表格
        [self createTable];
        
        // [self insertDataToTable];
        
        // [self addColumn];
        
        // [self updateValues];
        
        // [self deleteData];
        
        [self selectDatas];
        
    } else {
        
        // 关闭数据库，释放资源
        sqlite3_close(_sqlDB);
        NSLog(@"数据库创建、打开失败！");
    }
}

#pragma mark - 创建数据库表
- (void)createTable
{
    // SQLite学习网站：http://www.runoob.com/sqlite/sqlite-tutorial.html

    // 创建表格的SQL语句
    NSString *sql = @"CREATE TABLE IF NOT EXISTS User('userID' TEXT PRIMARY KEY,'userName' TEXT,'userPassword' TEXT)";
    
    char *erro;
    // 执行SQL语句
    int result = sqlite3_exec(_sqlDB, [sql UTF8String], NULL, NULL, &erro);
    
    if (result == SQLITE_OK) {
        
        NSLog(@"数据库表创建成功！");
    } else {
        
        NSLog(@"数据库表创建失败！%s",erro);
    }
}

#pragma mark - 添加数据到表
- (void)insertDataToTable
{
    NSString *userID = @"10005";
    NSString *userName = @"王伟";
    NSString *userPassword = @"898789353jjjjjr";
    NSInteger userAge = 25;
    
    // 1、创建插入数据的SQL语句
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO User('userID','userName','userPassword','userAGE') VALUES('%@','%@','%@',%ld)",userID,userName,userPassword,userAge];
    
    // 2、执行SQL语句
    char *error;
    int result = sqlite3_exec(_sqlDB, [sql UTF8String], NULL, NULL,&error);
    if (result == SQLITE_OK) {
        
        NSLog(@"添加数据成功！");
    } else {
        
        NSLog(@"添加数据失败！");
    }
}

#pragma mark - 添加一列(字段)
- (void)addColumn
{
    NSString *columnName = @"userAGE";
    NSString *columnType = @"INTEGER";
    NSString *sql = [NSString stringWithFormat:@"ALTER TABLE User ADD COLUMN %@ %@",columnName,columnType];
    
    char *error;
    int result = sqlite3_exec(_sqlDB, [sql UTF8String], NULL, NULL, &error);
    if (result == SQLITE_OK) {
        
        NSLog(@"添加字段成功！");
    } else {
        
        NSLog(@"添加字段失败！");
    }
}

#pragma mark - 修改数据
- (void)updateValues
{
    NSInteger ageValue = 25;
    NSString *userID = @"10001";
    NSString *sql = [NSString stringWithFormat:@"UPDATE User SET userAGE = %ld WHERE userID = '%@' ",ageValue, userID];
    
    char *error;
    int result = sqlite3_exec(_sqlDB, [sql UTF8String], NULL, NULL, &error);
    
    if (result == SQLITE_OK) {
        
        NSLog(@"修改数据成功！");
    } else {
        
        NSLog(@"修改数据失败！%s",error);
    }
    
}

#pragma mark - 删除指定的数据
- (void)deleteData
{
    NSString *whereStr = @"userAGE < 25";
    
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM User WHERE %@",whereStr];
    
    char *error;
    int result = sqlite3_exec(_sqlDB, [sql UTF8String], NULL, NULL, &error);
    if (result == SQLITE_OK) {
        
        NSLog(@"删除数据成功！");
    } else {
        
        NSLog(@"删除数据失败！%s",error);
    }
}


#pragma mark - 查询数据
- (void)selectDatas
{
    NSMutableArray *users = [NSMutableArray array];
    
    // 1、创建SQL语句处理结构体
    sqlite3_stmt *_stmt;
    
    // 2、创建查询语句
    
    // > 查询表中的所有数据
    // NSString *sql = [NSString stringWithFormat:@"SELECT *FROM User];
    // > 条件查询
    // NSString *sql = [NSString stringWithFormat:@"SELECT *FROM User WHERE userAGE >= 20]
    // > 查询3条：LIMIT 条数
    // NSString *sql = [NSString stringWithFormat:@"SELECT *FROM User LIMIT 3]
    // > 关键字查询 LIKE % 表示任意个字符
    NSString *sql = [NSString stringWithFormat:@"SELECT *FROM User WHERE userName LIKE '%%小%%'"];
    
    // 3、预处理SQL语句(编译SQL语句)，-1 执行整个SQL语句
    int result = sqlite3_prepare_v2(_sqlDB, [sql UTF8String], -1, &_stmt, NULL);
    if (result == SQLITE_OK) {
        
        // 4、执行查询语句，因为查询结果会有多条所以需要使用循环语句执行，== SQLITE_ROW 表示还有下一行
        while (sqlite3_step(_stmt) == SQLITE_ROW) {
            
            //5、获取查询结果中指定列的数据，数字表示列号，从0开始。而且使用对应数据类型的函数
            char *userID = (char *)sqlite3_column_text(_stmt, 0);
            char *userName = (char *)sqlite3_column_text(_stmt,1);
            char *userPassword = (char *)sqlite3_column_text(_stmt, 2);
            int userAge = sqlite3_column_int(_stmt, 3);
            
            NSString *uID = [NSString stringWithUTF8String:userID];
            NSString *uName = [NSString stringWithUTF8String:userName];
            NSString *uPassword = [NSString stringWithUTF8String:userPassword];
            
            // 将查询的数据保存到model中
            User *user = [[User alloc] init];
            user.userID = uID;
            user.userName = uName;
            user.userPassword = uPassword;
            user.userAge = userAge;
            
            [users addObject:user];
            
            NSLog(@"%@ %@, %@, %d",uID,uName,uPassword,userAge);

        }
    }
    
    // 6、使用完后销毁sqlite3_stmt，释放资源
    sqlite3_finalize(_stmt);
    
    // 7、使用完后关闭数据库
    sqlite3_close(_sqlDB);
    
}


@end
