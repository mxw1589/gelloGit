//
//  TNSPictureDetailModel.m
//  TensNews
//
//  Created by Chen on 16/2/1.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "TNSPictureDetailModel.h"

@implementation TNSPictureDetailModel

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"photos"]) {
        NSArray *array = value;
        _photos = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            TNSPhotoModel *model = [[TNSPhotoModel alloc] initWithDictionary:dict];
            [_photos addObject:model];
        }
    }
    else {
        [super setValue:value forKey:key];
    }
}

@end

@implementation TNSPhotoModel


@end