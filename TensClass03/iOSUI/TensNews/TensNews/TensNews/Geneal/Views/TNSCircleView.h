//
//  TNSCircleView.h
//  TensNews
//
//  主要使用三张图片来呈现banner,以达到节省内存的目的
//
//  Created by Chen on 16/1/28.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TNSCircleView;

@protocol TNSCircleViewDelegate <NSObject>

/**
 *  点击当前图片的响应事件
 *
 *  @param circleView circleView对象
 *  @param index      当前页
 */
- (void)circleView:(TNSCircleView *)circleView didSelectedAtIndex:(NSInteger)index;

@end

@interface TNSCircleView : UIView

@property (strong, nonatomic) NSArray *banners;     // 数据列表

@property (weak, nonatomic) id<TNSCircleViewDelegate> delegate;     // circleView的委托对象

/**
 *  刷新视图
 */
- (void)refreshScrollView;

@end
