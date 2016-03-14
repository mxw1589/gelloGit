//
//  TNSPictureModel.h
//  TensNews
//
//  Created by Chen on 16/1/30.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "TNSBaseModel.h"

@interface TNSPictureModel : TNSBaseModel

@property (copy, nonatomic) NSString *setname;
@property (copy, nonatomic) NSString *desc;
@property (copy, nonatomic) NSString *replynum;
@property (copy, nonatomic) NSString *imgsum;
@property (copy, nonatomic) NSArray *pics;
@property (assign, nonatomic) NSInteger picType;

@end
