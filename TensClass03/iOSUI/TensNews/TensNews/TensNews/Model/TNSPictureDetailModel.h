//
//  TNSPictureDetailModel.h
//  TensNews
//
//  Created by Chen on 16/2/1.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "TNSBaseModel.h"

@interface TNSPictureDetailModel : TNSBaseModel

@property (copy, nonatomic) NSString *setname;
@property (copy, nonatomic) NSMutableArray *photos;

@end

@interface TNSPhotoModel : TNSBaseModel

@property (copy, nonatomic) NSString *imgurl;
@property (copy, nonatomic) NSString *note;

@end
