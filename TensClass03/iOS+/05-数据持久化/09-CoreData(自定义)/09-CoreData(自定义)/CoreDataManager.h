//
//  CoreDataManager.h
//  09-CoreData(自定义)
//
//  Created by qinglinfu on 16/3/1.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataManager : NSObject

@property (nonatomic, strong)NSManagedObjectContext *managerObjectContext;
@property (nonatomic, strong)NSManagedObjectModel *managerObjectModel;
@property (nonatomic, strong)NSPersistentStoreCoordinator *storeCoordinator;


+ (instancetype)shareCoreDataManager;

- (void)saveContext;

@end
