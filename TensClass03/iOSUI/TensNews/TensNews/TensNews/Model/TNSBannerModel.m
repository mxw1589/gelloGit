//
//  TNSBannerModel.m
//  TensNews
//
//  Created by Chen on 16/1/28.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "TNSBannerModel.h"

@implementation TNSBannerModel

- (NSURL *)url {
    if (self.linkURLString.length <= 0) {
        return [[NSURL alloc] init];
    }
    return [NSURL URLWithString:self.linkURLString];
}

@end
