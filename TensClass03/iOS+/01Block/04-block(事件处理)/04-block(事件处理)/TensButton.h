//
//  TensButton.h
//  04-block(事件处理)
//
//  Created by qinglinfu on 16/2/19.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonBlock)(void);

@interface TensButton : UIButton

@property(nonatomic, copy)ButtonBlock block;

- (void)buttonEvent:(UIControlEvents)event handler:(ButtonBlock)block;

@end
