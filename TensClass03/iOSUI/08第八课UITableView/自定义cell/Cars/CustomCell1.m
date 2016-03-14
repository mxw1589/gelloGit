//
//  CustomCell.m
//  Cars
//
//  Created by Chen on 16/1/23.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "CustomCell1.h"

@implementation CustomCell1

/**
 *  从xib创建该类的时候调用这方法
 */
- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubView];
    }
    return self;
}

- (void)setupSubView {
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, 260, 60)];
    self.label.backgroundColor = [UIColor blackColor];
    self.label.textColor = [UIColor whiteColor];
    
    [self.contentView addSubview:self.label];
    
    self.icon = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 50, 50)];
    [self.contentView addSubview:self.icon];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
