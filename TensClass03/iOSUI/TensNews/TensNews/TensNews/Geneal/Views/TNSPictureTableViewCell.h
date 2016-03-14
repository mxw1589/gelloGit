//
//  TNSPictureTableViewCell.h
//  TensNews
//
//  Created by Chen on 16/1/30.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TNSPictureModel.h"

@interface TNSPictureTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *newsImageView1;
@property (weak, nonatomic) IBOutlet UIImageView *newsImageView2;
@property (weak, nonatomic) IBOutlet UIImageView *newsImageView3;
@property (weak, nonatomic) IBOutlet UILabel     *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel     *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel     *replyCountLabel;
@property (weak, nonatomic) IBOutlet UILabel     *pictureCountLabel;

@property (assign, nonatomic) TNSPictureModel *model;

@end
