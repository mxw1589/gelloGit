//
//  ViewController.m
//  07-CAAnimationGroup
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
    
    aniLayer = [CALayer layer];
    aniLayer.bounds = CGRectMake(0, 0, 100, 100);
    aniLayer.position = CGPointMake(ScreenWidth/2, 50);
    aniLayer.backgroundColor = [UIColor redColor].CGColor;
    
    [self.view.layer addSublayer:aniLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [aniLayer addAnimation:[self animationGroup] forKey:nil];
}

- (CAAnimation *)rotation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.duration = 2;
    animation.beginTime = 1;
    animation.byValue = @(2 * M_PI);
    animation.repeatCount = HUGE_VALF;
    
    return animation;
}

- (CAAnimation *)scale
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 1;
    animation.byValue = @1;
    animation.beginTime =  0.5;
    animation.repeatCount = HUGE_VALF;
    
    return animation;
}

- (CAAnimation *)keyframe
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 5;
    animation.repeatCount = HUGE_VALF;
    NSValue *pointBegain = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth / 2,50)];
    NSValue *pointOne = [NSValue valueWithCGPoint:CGPointMake(50,ScreenHeight / 2 )];
    NSValue *pointTwo = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth / 2, ScreenHeight - 50)];
    NSValue *pointThree = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth - 50, ScreenHeight / 2)];
    NSValue *pointFour = [NSValue valueWithCGPoint:CGPointMake(ScreenWidth / 2,50)];
    
    // 1、设置关键帧的值
    NSArray *values = @[pointBegain,pointOne, pointTwo, pointThree,pointFour];
    animation.values = values;
    
    return animation;
}



- (CAAnimation *)animationGroup
{
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 5;
    animationGroup.repeatCount = HUGE_VALF;
    // 设置动画组的多个动画
    animationGroup.animations = @[[self rotation],[self scale], [self keyframe]];
    return animationGroup;
}



@end
