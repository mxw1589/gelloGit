//
//  TNSPictureTableViewCell.m
//  TensNews
//
//  Created by Chen on 16/1/30.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "TNSPictureTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation TNSPictureTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(TNSPictureModel *)model {
    self.titleLabel.text = model.setname;
    self.detailLabel.text = model.desc;
    self.replyCountLabel.text = model.replynum;
    self.pictureCountLabel.text = model.imgsum;
    
    [self.newsImageView1 sd_setImageWithURL:[NSURL URLWithString:model.pics[0]]];
    
    if (model.picType >= 2) {
        [self.newsImageView2 sd_setImageWithURL:[NSURL URLWithString:model.pics[1]]];
    }
    
    if (model.picType == 3) {
        [self.newsImageView3 sd_setImageWithURL:[NSURL URLWithString:model.pics[2]]];
    }
}

@end
