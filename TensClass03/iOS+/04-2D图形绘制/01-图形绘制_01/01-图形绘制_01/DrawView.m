//
//  DrawView.m
//  01-图形绘制_01
//
//  Created by qinglinfu on 16/2/24.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView


// View中绘制图形的方法，绘图的操作在这里完成，当视图显示时就会进行绘制，不需要手动调用。
- (void)drawRect:(CGRect)rect {
    
    //[self drawLine];
    
    [self drawPath];
}

#pragma mark - 绘制线条
- (void)drawLine
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 直线
    // [path moveToPoint:CGPointMake(50, 50)]; // 移动到某个点
    // [path addLineToPoint:CGPointMake(270, 50)]; // 添加一条直线到某个点
    
    // 三角形
    [path moveToPoint:CGPointMake(50, 200)];
    [path addLineToPoint:CGPointMake(160, 80)];
    [path addLineToPoint:CGPointMake(270, 200)];
    //[path addLineToPoint:CGPointMake(50, 200)];
    
    // 闭合路径
    [path closePath];
    
    // 虚线
    [path moveToPoint:CGPointMake(50, 220)];
    [path addLineToPoint:CGPointMake(270, 220)];
    
    CGFloat dashValues[] = {20,5};
    // Dash:浮点类型的数组，虚线实线的宽度设置,count:数组元素个数，phase：设置开端线的起始位置
    [path setLineDash:dashValues count:2 phase:10];

    // 1、描边颜色
    [[UIColor redColor] setStroke];
    
    // 2、填充颜色
    [[UIColor whiteColor] setFill];
    
    // 3、线条的宽度
    path.lineWidth = 10;
    
    // 4、线头的样式：kCGLineCapButt，kCGLineCapRound，kCGLineCapSquare
    path.lineCapStyle = kCGLineCapSquare;
    
    // 5、线条链接点的样式
    path.lineJoinStyle = kCGLineJoinMiter;
    
    // 6、连接点内角和外角的距离
    path.miterLimit = 10;

    // 描边
    [path stroke];
    // 填充
//    [path fill];
}

#pragma mark - 绘制图形
- (void)drawPath
{
    // 1、矩形
    // UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 100, 200, 100)];
    
    // 2、圆角矩形
    // UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 100, 200, 100) cornerRadius:20];
    
    // 3、内切圆\椭圆
    // UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 100, 200, 200)];
    
    /* 4、画弧线
     Center: 圆心
     radius：半径
     startAngle： 起始角度
     endAngle： 结束角度
     clockwise： 是否顺时针
    */
    // UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.center radius:100 startAngle:0 endAngle: M_PI clockwise:YES];
    
    
    // 5、贝塞尔曲线(一个控制点)
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 200)];
    // [path addQuadCurveToPoint:CGPointMake(320, 200) controlPoint:CGPointMake(100, 0)];
    
    // 6、贝塞尔曲线(两个控制点)
    [path addCurveToPoint:CGPointMake(320, 200) controlPoint1:CGPointMake(80, 0) controlPoint2:CGPointMake(240, 300)];
    
    // 闭合路径
    [path closePath];
    
    // 移除所有的点
    // [path removeAllPoints];
    
    path.lineWidth = 5;
    [[UIColor redColor] setStroke];
    [[UIColor greenColor] setFill];
    [path stroke];
//    [path fill];
    
}

@end
