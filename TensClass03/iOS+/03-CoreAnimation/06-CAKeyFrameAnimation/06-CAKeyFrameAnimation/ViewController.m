//
//  ViewController.m
//  06-CAKeyFrameAnimation
//
//  Created by qinglinfu on 16/2/23.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

#import "ViewController.h"

@interface ViewController ()
{
    CALayer *aniLayer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *bgLayer = [CALayer layer];
    
    bgLayer.bounds = self.view.bounds;
    bgLayer.position = self.view.center;
    bgLayer.backgroundColor = [UIColor blackColor].CGColor;
    bgLayer.delegate = self;
    [bgLayer setNeedsDisplay];
    [self.view.layer addSublayer:bgLayer];
    
    
    aniLayer = [CALayer layer];
    aniLayer.bounds = CGRectMake(0, 0, 100, 100);
    aniLayer.position = CGPointMake(ScreenWidth / 2, 50);
    aniLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"lanqiu"].CGImage);
    [self.view.layer addSublayer:aniLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    // [aniLayer addAnimation:[self keyframeAnimationForValues] forKey:nil];
    
    [aniLayer addAnimation:[self keyFrameAnimationForPath] forKey:nil];
}


- (CAKeyframeAnimation *)keyframeAnimationForValues
{
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.duration = 5;
    keyAnimation.removedOnCompletion = NO;
    keyAnimation.fillMode = kCAFillModeForwards;
    keyAnimation.repeatCount = HUGE_VALF;
    
    NSValue *pointBegain = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth / 2,50)];
    NSValue *pointOne = [NSValue valueWithCGPoint:CGPointMake(50,ScreenHeight / 2 )];
    NSValue *pointTwo = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth / 2, ScreenHeight - 50)];
    NSValue *pointThree = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth - 50, ScreenHeight / 2)];
    NSValue *pointFour = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth / 2,50)];
    
    // 1、设置关键帧的值
    NSArray *values = @[pointBegain,pointOne, pointTwo, pointThree,pointFour];
    keyAnimation.values = values;
    
    // 2、设置每个关键帧的对应时间点，决定每一帧的动画时间
    keyAnimation.keyTimes = @[@0,@.1,@.4,@.8,@1];
    
    /* 3、关键帧的差值计算
     
     kCAAnimationLinear 线性的，两个关键帧之间进行差值计算
     kCAAnimationDiscrete 离散的，不进行差值计算
     kCAAnimationPaced 匀速 设置keyTimes不起作用，差值计算
     kCAAnimationCubic 两个关键帧过度是圆滑的,差值计算
     kCAAnimationCubicPaced 匀速圆滑过度，设置keyTimes不起作用
    */
    keyAnimation.calculationMode = kCAAnimationLinear;
    
    return keyAnimation;
}


- (CAKeyframeAnimation *)keyFrameAnimationForPath
{
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyFrameAnimation.duration = 5;
    keyFrameAnimation.removedOnCompletion = NO;
    keyFrameAnimation.fillMode = kCAFillModeForwards;
    keyFrameAnimation.repeatCount = HUGE_VALF;
    
    // 设置动画的运动轨迹
    keyFrameAnimation.path = [self path].CGPath;
    
    return keyFrameAnimation;
}

- (UIBezierPath *)path
{
    // 矩形
    // UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 200, 300, 300)];
    
    // 圆形
    // UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 200, 300, 300)];
    
    // 贝塞尔曲线
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 移动到哪个点
    [path moveToPoint:CGPointMake(0, ScreenHeight / 2)];
    
    CGPoint pointOne = CGPointMake(ScreenWidth/ 2, ScreenHeight / 2);
    CGPoint controlPointOne = CGPointMake(ScreenWidth / 4, ScreenHeight / 4);
    CGPoint pointTwo = CGPointMake(ScreenWidth, ScreenHeight / 2);
    CGPoint controlPointTwo = CGPointMake(ScreenWidth *(3/4.0), ScreenHeight *(3/4.0));
    
    // 贝塞尔曲线，ToPoint:目标点，controlPoint：控制点
    [path addQuadCurveToPoint:pointOne controlPoint:controlPointOne];
    [path addQuadCurveToPoint:pointTwo controlPoint:controlPointTwo];
    
    path.lineWidth = 5;

    return path;
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
     CGContextAddPath(ctx, [self path].CGPath);
     CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
     CGContextDrawPath(ctx, kCGPathStroke);
}


@end
