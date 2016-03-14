//
//  ViewController.m
//  02-BasicAnimation(基本动画)
//
//  Created by qinglinfu on 16/2/22.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CALayer *aniLayer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    aniLayer = [CALayer layer];
    aniLayer.bounds = CGRectMake(0, 0, 100, 100);
    aniLayer.position = CGPointMake(160, 100);
    aniLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:aniLayer];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self position];
    
    // [self rotation];
    
    [self cornerRadius];
}


- (void)position
{
    // CABasicAnimation *basicAni = [CABasicAnimation animation];
    // basicAni.keyPath = @"position";
    
    // 创建基本动画并通过 KeyPath 指定动画改变的属性
    CABasicAnimation *basicAni = [CABasicAnimation animationWithKeyPath:@"position"];
    
    // 1、动画时间
    basicAni.duration = 1;
    // 2、动画的起始值
    basicAni.fromValue = [NSValue valueWithCGPoint:CGPointMake(160, 100)];
    // 3、动画的目标值
    basicAni.toValue = [NSValue valueWithCGPoint:CGPointMake(160, 300)];
    
    // 4、动画变化的值，也就是 fromValue 到 toValue 变化的值
    // basicAni.byValue = [NSValue valueWithCGPoint:CGPointMake(160, 300)];
    
    // 5、是否有恢复动画
    basicAni.autoreverses = YES;
    
    // 6、动画重复的次数,HUGE_VALF 很大的数，表示无限次重复。
    basicAni.repeatCount = HUGE_VALF;  // MAXFLOAT
    
    // 7、动画重复的时间
    basicAni.repeatDuration = 5;
    
    // 8、动画的速度，默认是 1
    basicAni.speed = 2;
    
    // 9、动画延迟启动的，要使用 CACurrentMediaTime() + 延迟的秒数
    basicAni.beginTime = CACurrentMediaTime() + 2;
    
    // CACurrentMediaTime(),当前媒体时间，也就是系统启动后的一个秒数，系统重启后会清零。
    NSLog(@"CACurrentMediaTime(): %f",CACurrentMediaTime());
    
    // 10、动画的填充模式，要让动画保持在动画后的位置要设置为：kCAFillModeForwards
    basicAni.fillMode = kCAFillModeForwards;
    
    // 11、是否移除动画完成后的状态，要设置fillMode 为：kCAFillModeForwards
    basicAni.removedOnCompletion = NO;

    [aniLayer addAnimation:basicAni forKey:@"position变化"];

}

- (void)rotation
{
    CABasicAnimation *rotationAni = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];

    rotationAni.duration = 1;
    rotationAni.fromValue = @(0);
    rotationAni.toValue = @(2 * M_PI);
    //rotationAni.fillMode = kCAFillModeForwards;
    //rotationAni.removedOnCompletion = NO;
    rotationAni.repeatCount = HUGE_VALF;
    
    [aniLayer addAnimation:rotationAni forKey:@"旋转"];
    
}


- (void)cornerRadius
{
    CABasicAnimation *rotationAni = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    
    rotationAni.duration = 2;
    rotationAni.fromValue = @(0);
    rotationAni.toValue = @50;
    //rotationAni.fillMode = kCAFillModeForwards;
    //rotationAni.removedOnCompletion = NO;
    rotationAni.repeatCount = HUGE_VALF;
    
    [aniLayer addAnimation:rotationAni forKey:@"圆角"];
}


@end
