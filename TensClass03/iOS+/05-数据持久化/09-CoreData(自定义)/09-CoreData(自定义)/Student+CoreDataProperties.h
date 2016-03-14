//
//  Student+CoreDataProperties.h
//  09-CoreData(自定义)
//
//  Created by qinglinfu on 16/3/1.
//  Copyright © 2016年 十安科技. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *stuID;
@property (nullable, nonatomic, retain) NSString *stuName;
@property (nullable, nonatomic, retain) NSNumber *stuAge;
@property (nullable, nonatomic, retain) NSDate *addDate;
@property (nullable, nonatomic, retain) MacBook *macBook;

@end

NS_ASSUME_NONNULL_END
