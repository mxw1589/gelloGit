//
//  Book+CoreDataProperties.h
//  08-CoreData_Demo
//
//  Created by qinglinfu on 16/3/1.
//  Copyright © 2016年 十安科技. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Book.h"

NS_ASSUME_NONNULL_BEGIN

@interface Book (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *bookID;
@property (nullable, nonatomic, retain) NSNumber *bookPrice;
@property (nullable, nonatomic, retain) NSString *bookName;

@end

NS_ASSUME_NONNULL_END
