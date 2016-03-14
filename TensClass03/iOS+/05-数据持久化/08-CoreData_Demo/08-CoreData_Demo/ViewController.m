//
//  ViewController.m
//  08-CoreData_Demo
//
//  Created by qinglinfu on 16/3/1.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "User+CoreDataProperties.h"
#import "Book+CoreDataProperties.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // [self insertDatas];
    
    // [self updateDatas];
    // [self selectDatas];
    
    [self deleteDatas];
    
}

#pragma mark - 添加数据
- (void)insertDatas
{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    // 1、添加一个对象到实体中，这个数据会被映射到对应的数据库表中
    Book *book = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:appDelegate.managedObjectContext];
    book.bookID = @"10003";
    book.bookName = @"《Swift编程》";
    book.bookPrice = @60;
    
    
    User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:appDelegate.managedObjectContext];
    user.userID = @"10003";
    user.userName = @"小小";
    user.userAge = @20;
    user.userEmail = @"45455454@163.com";
    user.book = book;
    
    // 2、保存上下文，所有的添加、更新、删除操作完后必须要保存上下文才能改动成功！
    [appDelegate saveContext];
}

#pragma mark - 查询数据
- (void)selectDatas
{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    // 1、创建一个取值请求，需要指点具体的Entity名称
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"User"];
    
    // 使用谓词：NSPredicate， 设置查询的条件
    request.predicate =  [NSPredicate predicateWithFormat:@"userAge < 30"];
    
    // 设置结果的排序,按照 userAge 进行升序排列 (可以不设置排序)
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"userAge" ascending:YES];
    request.sortDescriptors = @[sort];
    
    // 2、NSManagedObjectContext 执行这个请求，返回查询的结果
    NSError *error;
    NSArray *userArray = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    for (User *user in userArray) {
        
         NSLog(@"%@ %@ %@ %@",user.userID,user.userName,user.userAge,user.userEmail);
    }
}

#pragma mark - 更新数据
- (void)updateDatas
{
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    // 1、查询要修改的数据
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Book"];
    request.predicate = [NSPredicate predicateWithFormat:@"bookName == '《iOS开发》'"];
    
    NSError *error;
    NSArray *books = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    if (!error) {
        
        for (Book *book in books) {
            
            // 2、修改更新数据
            book.bookPrice = @80;
            [appDelegate.managedObjectContext updatedObjects];
        }
        
        // 3、修改完后保存上下文
        [appDelegate saveContext];
    }
}

#pragma mark - 更新数据
- (void)deleteDatas
{
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    // 1、查询要删除的数据
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Book"];
    request.predicate = [NSPredicate predicateWithFormat:@"bookName == '《Swift编程》'"];
    
    NSError *error;
    NSArray *books = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    if (!error) {
        
        for (Book *book in books) {
        
            NSLog(@"%@",book);
            
            // 2、删除数据
            [appDelegate.managedObjectContext deleteObject:book];
        }
        
        // 3、删除完后保存上下文
        [appDelegate saveContext];
        
        
    }
}




@end
