//
//  User+CoreDataProperties.h
//  08-CoreData_Demo
//
//  Created by qinglinfu on 16/3/1.
//  Copyright © 2016年 十安科技. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *userID;
@property (nullable, nonatomic, retain) NSString *userName;
@property (nullable, nonatomic, retain) NSNumber *userAge;
@property (nullable, nonatomic, retain) NSString *userEmail;
@property (nullable, nonatomic, retain) Book *book;

@end

NS_ASSUME_NONNULL_END
