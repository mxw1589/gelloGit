//
//  ViewController.m
//  02-BasicAnimation(基本动画)_02
//
//  Created by qinglinfu on 16/2/22.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CALayer *aniLayer;
    CABasicAnimation *_basicAni;
    
    BOOL _isPause;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    aniLayer = [CALayer layer];
    aniLayer.bounds = CGRectMake(0, 0, 200, 200);
    aniLayer.position = self.view.center;
    aniLayer.backgroundColor = [UIColor redColor].CGColor;
    // aniLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"get.jpeg"].CGImage);
    
    // 设置动画的支点
    aniLayer.anchorPoint = CGPointMake(0, 0);
    
    [self.view.layer addSublayer:aniLayer];
    
    [self rotation];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // [self position];
    
    if (_isPause) {
        
       [self startAnimation];
        
    } else {
        
        [self pauseAnimation];
    }
    
//     [aniLayer addAnimation:_basicAni forKey:@"旋转"];
    
}

- (void)position
{
    CABasicAnimation *basicAni = [CABasicAnimation animationWithKeyPath:@"position"];
    
    basicAni.duration = 2;
    basicAni.byValue = [NSValue valueWithCGPoint:CGPointMake(0, 300)];
    basicAni.removedOnCompletion = NO;
    basicAni.fillMode = kCAFillModeForwards;
    
    // kCAMediaTimingFunctionLinear // 匀速
    // kCAMediaTimingFunctionEaseIn // 加速
    // kCAMediaTimingFunctionEaseOut // 减速
    // kCAMediaTimingFunctionEaseInEaseOut // 加速进入减速停止
    
    // 动画速度变化函数
    basicAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [aniLayer addAnimation:basicAni forKey:@"移动"];
}

- (void)rotation
{
    _basicAni = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    
    _basicAni.duration = 5;
    _basicAni.byValue = @(M_PI * 2);
    _basicAni.removedOnCompletion = NO;
    _basicAni.fillMode = kCAFillModeForwards;
    _basicAni.repeatCount = HUGE_VALF;
    
    [aniLayer addAnimation:_basicAni forKey:@"旋转"];
    
    _isPause = NO;

}


// 官方文档参考：https://developer.apple.com/library/ios/qa/qa1673/_index.html
#pragma mark - 暂停动画
- (void)pauseAnimation
{
    CFTimeInterval pauseTime = [aniLayer convertTime:CACurrentMediaTime() fromLayer:nil];
    
    // 设置动画的时间偏移
    aniLayer.timeOffset = pauseTime;
    aniLayer.speed = 0;
    
    _isPause = YES;
}

#pragma mark - 恢复动画
- (void)startAnimation
{
    CFTimeInterval pauseTime = aniLayer.timeOffset;
    
    aniLayer.speed = 1;
    aniLayer.timeOffset = 0; // 重置动画的偏移时间
    aniLayer.beginTime = 0;  // 重置动画的开始时间
    // 设置动画的开始时间
    aniLayer.beginTime = [aniLayer convertTime:CACurrentMediaTime() fromLayer:nil] - pauseTime;
    
    _isPause = NO;
}



@end
