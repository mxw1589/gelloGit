//
//  TNSBannerModel.h
//  TensNews
//
//  Created by Chen on 16/1/28.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "TNSBaseModel.h"

@interface TNSBannerModel : TNSBaseModel

@property (copy, nonatomic) NSString *linkURLString;
@property (copy, nonatomic) NSString *imageURLString;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSURL   *url;

@end
