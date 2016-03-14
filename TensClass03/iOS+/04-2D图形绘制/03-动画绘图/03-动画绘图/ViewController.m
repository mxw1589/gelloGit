//
//  ViewController.m
//  03-动画绘图
//
//  Created by qinglinfu on 16/2/24.
//  Copyright © 2016年 十安科技. All rights reserved.
//


#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height


#import "ViewController.h"

@interface ViewController ()
{
    CAShapeLayer *sLayer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (CGPathRef)path
{
    
    // UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 300, 300)];
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 绘制坐标
    [path moveToPoint:CGPointMake(0,ScreenHeight / 2)];
    [path addLineToPoint:CGPointMake(ScreenWidth, ScreenHeight / 2)];
    [path moveToPoint:CGPointMake(ScreenWidth / 2, 0)];
    [path addLineToPoint:CGPointMake(ScreenWidth / 2, ScreenHeight)];
    
    // 绘制正弦函数图
    [path moveToPoint:CGPointMake(0,ScreenHeight / 2)];
    [path addQuadCurveToPoint:CGPointMake(ScreenWidth/2, ScreenHeight/2) controlPoint:CGPointMake(ScreenWidth/4, 0)];
    [path addQuadCurveToPoint:CGPointMake(ScreenWidth, ScreenHeight / 2) controlPoint:CGPointMake(ScreenWidth * 3 / 4.0, ScreenHeight)];
    
    
    return path.CGPath;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self animation];
}

- (void)animation
{
    [sLayer removeFromSuperlayer];
    // 绘制图形Layer:CAShapeLayer
    sLayer = [CAShapeLayer layer];
    sLayer.bounds = self.view.bounds;
    sLayer.path = [self path];
    sLayer.position = self.view.center;
    sLayer.strokeColor = [UIColor redColor].CGColor;
    sLayer.lineWidth = 5;
    sLayer.backgroundColor = [UIColor blackColor].CGColor;
    
    [self.view.layer addSublayer:sLayer];
    
    //给 strokeEnd 或者 strokeStart 属性添加动画实现动画绘制路径，取值范围[0~1].
    CABasicAnimation *animaton = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animaton.fromValue = @0;
    animaton.toValue = @1;
    animaton.duration = 5;
    
    [sLayer addAnimation:animaton forKey:nil];

}



@end
