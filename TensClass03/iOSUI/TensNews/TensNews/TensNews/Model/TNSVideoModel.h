//
//  TNSVideoModel.h
//  TensNews
//
//  Created by Chen on 16/2/16.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "TNSBaseModel.h"

@interface TNSVideoModel : TNSBaseModel

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSURL *cover;
@property (copy, nonatomic) NSString *mp4_url;

@end
