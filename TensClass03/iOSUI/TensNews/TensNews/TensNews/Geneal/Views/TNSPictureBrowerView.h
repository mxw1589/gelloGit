//
//  TNSPictureBrowerView.h
//  TensNews
//
//  Created by Chen on 16/2/1.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TNSPictureDetailModel;

@class TNSPictureBrowerView;

@protocol TNSPictureBrowerViewDelegate <NSObject>

/**
 *  点击当前图片的响应事件
 *
 *  @param circleView circleView对象
 *  @param index      当前页
 */
- (void)pictureBrowerView:(TNSPictureBrowerView *)pictureBrowerView didSelectedAtIndex:(NSInteger)index;

@end

@interface TNSPictureBrowerView : UIView

@property (strong, nonatomic) TNSPictureDetailModel *model;     // 图片详细数据
@property (strong, nonatomic) UIView *alphaView;                // 标题及详细信息的容器view

@property (weak, nonatomic) id<TNSPictureBrowerViewDelegate> delegate;      // pictureBrower 的委托对象

/**
 *  刷新视图
 */
- (void)refreshScrollView;

@end
