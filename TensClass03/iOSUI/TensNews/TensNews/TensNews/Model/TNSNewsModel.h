//
//  TNSNewsModel.h
//  TensNews
//
//  Created by Chen on 16/1/28.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "TNSBaseModel.h"

@interface TNSNewsModel : TNSBaseModel

@property (copy, nonatomic) NSString *imgsrc;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *digest;
@property (copy, nonatomic) NSNumber *replyCount;
@property (copy, nonatomic) NSString *replay;
@property (copy, nonatomic) NSURL *url;

@end
