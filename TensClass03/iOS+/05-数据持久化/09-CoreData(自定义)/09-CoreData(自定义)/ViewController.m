//
//  ViewController.m
//  09-CoreData(自定义)
//
//  Created by qinglinfu on 16/3/1.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import "CoreDataManager.h"
#import "Student+CoreDataProperties.h"
#import "MacBook+CoreDataProperties.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",NSHomeDirectory());
    
    [self insertDatas];
}


- (void)insertDatas
{
    NSManagedObjectContext *context = [CoreDataManager shareCoreDataManager].managerObjectContext;
    
    MacBook *mBook = [NSEntityDescription insertNewObjectForEntityForName:@"MacBook" inManagedObjectContext:context];
    mBook.mbID = @"mac100001";
    mBook.mbPrice = @15000;
    mBook.mbColor = @"银白色";
    
    Student *stu = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:context];
    
    stu.stuID = @"10001";
    stu.stuName = @"嘻嘻嘻";
    stu.stuAge = @30;
    stu.macBook = mBook;
    
    [[CoreDataManager shareCoreDataManager] saveContext];
    
}

@end
