//
//  MacBook+CoreDataProperties.h
//  09-CoreData(自定义)
//
//  Created by qinglinfu on 16/3/1.
//  Copyright © 2016年 十安科技. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "MacBook.h"

NS_ASSUME_NONNULL_BEGIN

@interface MacBook (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *mbID;
@property (nullable, nonatomic, retain) NSNumber *mbPrice;
@property (nullable, nonatomic, retain) NSString *mbColor;

@end

NS_ASSUME_NONNULL_END
