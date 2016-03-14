//
//  CoreDataManager.m
//  09-CoreData(自定义)
//
//  Created by qinglinfu on 16/3/1.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "CoreDataManager.h"

static CoreDataManager *manager = nil;

@implementation CoreDataManager

+ (instancetype)shareCoreDataManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [[self alloc] init];
    });
    
    return manager;
}

 + (instancetype)allocWithZone:(struct _NSZone *)zone
{
    if (manager == nil) {
        
        manager = [super allocWithZone:zone];
    }
    return manager;
}


#pragma mark - 创建 NSManagedObjectModel
- (NSManagedObjectModel *)managerObjectModel
{
    if (_managerObjectModel == nil) {
        
        _managerObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    }
    return _managerObjectModel;
}


#pragma mark - 创建文件保存的地址URL
- (NSURL *)databaseURL
{
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dataPath = [docPath stringByAppendingPathComponent:@"coredata.sqlite"];
    
    // 将 path文件路径转为 URL
    return  [NSURL fileURLWithPath:dataPath];
}

#pragma mark - 创建 NSPersistentStoreCoordinator
- (NSPersistentStoreCoordinator *)storeCoordinator
{
    if (_storeCoordinator == nil) {
        
        // 1、创建调度
        _storeCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managerObjectModel];
        // 2、给调度设置保存的格式和保存文件的路径，NSSQLiteStoreType 表示使用SQLite保存数据。
        NSError *error;
        [_storeCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[self databaseURL] options:nil error:&error];
    }
    
    return _storeCoordinator;
}

#pragma mark - 创建NSManagedObjectContext
- (NSManagedObjectContext *)managerObjectContext
{
    if (_managerObjectContext == nil) {
        
        // 1、创建管理上下文
        _managerObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        
        // 2、设置上下文的调度者
        _managerObjectContext.persistentStoreCoordinator = self.storeCoordinator;
    }
    
    return _managerObjectContext;
}

#pragma mark - 保存上下文
- (void)saveContext
{
    NSError *error;
    if ([self.managerObjectContext hasChanges] && ![self.managerObjectContext save:&error]) {
        
        NSLog(@"保存文件出错：%@",error);
    }
}



@end
