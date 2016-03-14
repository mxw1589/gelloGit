//
//  TNSNewsModel.m
//  TensNews
//
//  Created by Chen on 16/1/28.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "TNSNewsModel.h"

@implementation TNSNewsModel

- (NSString *)replay {
    return [NSString stringWithFormat:@"%@跟帖",self.replyCount];
}

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"url"]) {
        self.url = [NSURL URLWithString:value];
    }
    else {
        [super setValue:value forKey:key];
    }
}

@end
