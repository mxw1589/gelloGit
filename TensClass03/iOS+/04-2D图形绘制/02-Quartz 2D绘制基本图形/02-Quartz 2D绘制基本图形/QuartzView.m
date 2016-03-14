//
//  QuartzView.m
//  02-Quartz 2D绘制基本图形
//
//  Created by qinglinfu on 16/2/24.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "QuartzView.h"

@implementation QuartzView


- (void)drawRect:(CGRect)rect {
    
//    [self drawLine];
    
    [self drawGraph];
}

#pragma mark - 线条绘制
- (void)drawLine
{
    // 1、获取绘图上下文，(获取当前绘图的画布)
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 将画笔移动到某个点
    CGContextMoveToPoint(ctx, 50, 50);
    
    // 添加一条线到一个点
    CGContextAddLineToPoint(ctx, 270, 50);
    
    // 设置描边的颜色
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    
    CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
    
    // 使用RGB设置颜色
    CGContextSetRGBFillColor(ctx, 0.3, 0.2, 0.3, 1);
    
    // 设置线条的宽度
    CGContextSetLineWidth(ctx, 5);
    
    // 设置线头的样式
    CGContextSetLineCap(ctx, kCGLineCapButt);
    
    // 两条线连接点的样式
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    
    // 设置是否抗锯齿
    CGContextSetShouldAntialias(ctx, YES);
    
    // 设置虚线
    //CGFloat dashValues[] = {10,5};
    //CGContextSetLineDash(ctx, 0, dashValues, 2);
    
    CGContextAddLineToPoint(ctx, 50, 200);
    
    // 闭合路径
    CGContextClosePath(ctx);
    
    // 描边
    // CGContextStrokePath(ctx);
    // 填充
    // CGContextFillPath(ctx);
    
    // 绘制路径：kCGPathFill(填充)，kCGPathStroke(描边),kCGPathFillStroke(填充并且描边)
    CGContextDrawPath(ctx, kCGPathFillStroke);
}

#pragma mark - 画图形
- (void)drawGraph
{
    CGContextRef ctx =  UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 5);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor lightGrayColor].CGColor);
    
    
    // 1、矩形
    CGContextAddRect(ctx, CGRectMake(50,50, 220, 220));
    
    // 2、内切圆
    CGContextAddEllipseInRect(ctx, CGRectMake(50, 50, 220, 220));
    
    CGContextDrawPath(ctx, kCGPathFillStroke);

    // 临时保存当前绘图上下文（入栈）
    CGContextSaveGState(ctx);
    
    // 3、画弧线
    CGContextAddArc(ctx, 160, 350, 100,0, M_PI_4, NO);
    CGContextAddLineToPoint(ctx, 160, 350);
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor orangeColor].CGColor);
    CGContextSetLineWidth(ctx, 1);
    CGContextClosePath(ctx);
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
//    CGContextAddArcToPoint(<#CGContextRef  _Nullable c#>, <#CGFloat x1#>, <#CGFloat y1#>, <#CGFloat x2#>, <#CGFloat y2#>, <#CGFloat radius#>)
    
    // 恢复原来绘图上下文(出栈)
    CGContextRestoreGState(ctx);
    
    // 上下文出栈后使用的是原来的设置
    
    
    // 4、贝塞尔曲线
    CGContextMoveToPoint(ctx, 100, 500);
    // 一个控制点
    // CGContextAddQuadCurveToPoint(ctx, 160, 568, 300, 500);
    
    // 两个控制点
    CGContextAddCurveToPoint(ctx, 150, 568, 240, 300, 300, 500);
    
    CGContextDrawPath(ctx, kCGPathStroke);
    
    // 5、文字的绘制
    NSString *text = @"绘制的文字";
    NSDictionary *attributes = @{NSForegroundColorAttributeName : [UIColor redColor],NSFontAttributeName : [UIFont systemFontOfSize:20] };
    [text drawInRect:CGRectMake(50, 20, 200, 30) withAttributes:attributes];
    
    // 6、绘制图片
    CGRect imageRect = CGRectMake(10, 300, 200, 200);
    UIImage *image = [UIImage imageNamed:@"photo.jpg"];
    
    // 设置当前坐标系统
    //CGContextTranslateCTM(ctx, 0, self.bounds.size.height);
    //CGContextScaleCTM(ctx, 1, -1);
    // 绘制方式一，直接绘制是倒置的，要设置当前坐标系统
    CGContextDrawImage(ctx, imageRect, image.CGImage);
    
    // 绘制方式二
    [image drawInRect:imageRect];
}


@end
