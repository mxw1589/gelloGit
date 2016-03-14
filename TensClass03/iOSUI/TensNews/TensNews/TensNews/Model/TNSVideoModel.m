//
//  TNSVideoModel.m
//  TensNews
//
//  Created by Chen on 16/2/16.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "TNSVideoModel.h"

@implementation TNSVideoModel

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"cover"]) {
        self.cover = [NSURL URLWithString:value];
    }
    else {
        [super setValue:value forKey:key];
    }
}

@end
