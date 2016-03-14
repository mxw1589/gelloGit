//
//  TNSPictureModel.m
//  TensNews
//
//  Created by Chen on 16/1/30.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "TNSPictureModel.h"

@implementation TNSPictureModel


#pragma mark - Custom Accessors

- (NSInteger)picType {
    if (!_picType) {
        _picType = arc4random()%3+1;
    }
    return _picType;
}

- (NSString *)replynum {
    if (![_replynum hasSuffix:@"评论"]) {
        _replynum = [_replynum stringByAppendingString:@"评论"];
    }
    return _replynum;
}

- (NSString *)imgsum {
    if (![_imgsum hasSuffix:@"图"]) {
        _imgsum = [_imgsum stringByAppendingString:@"图"];
    }
    return _imgsum;
}

@end
