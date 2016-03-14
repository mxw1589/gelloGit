//
//  Max+CoreDataProperties.h
//  coreDataCeshi
//
//  Created by qinglinfu on 16/3/2.
//  Copyright © 2016年 tens03. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Max.h"

NS_ASSUME_NONNULL_BEGIN

@interface Max (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *maxid;
@property (nullable, nonatomic, retain) NSString *maxname;
@property (nullable, nonatomic, retain) NSSet<Min *> *min;

@end

@interface Max (CoreDataGeneratedAccessors)

- (void)addMinObject:(Min *)value;
- (void)removeMinObject:(Min *)value;

- (void)addMin:(NSSet<Min *> *)values;
- (void)removeMin:(NSSet<Min *> *)values;

@end

NS_ASSUME_NONNULL_END
