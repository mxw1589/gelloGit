//
//  TNSScaleScrollView.h
//  TensNews
//  用来放大缩小图片
//  Created by Chen on 16/2/1.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TNSScaleScrollView : UIScrollView <UIScrollViewDelegate>

@property (strong, nonatomic) UIImageView *imageView;       // 图片视图对象

@end
