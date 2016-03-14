//
//  ViewController.m
//  02-CALayer隐式动画和事务
//
//  Created by qinglinfu on 16/2/20.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CALayer *layer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = CGPointMake(50, 50);
    layer.opacity = 1;
    layer.backgroundColor = [UIColor redColor].CGColor;
    
    [self.view.layer addSublayer:layer];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

//----------------------隐式动画---------------------------------
    // 当layer中属性(支持Animatable)值发生变化时会触发一个动画，这个动画不需要自己设置，所以叫隐式动画。默认动画时间是0.25s
 /*
    layer.position = self.view.center;
    layer.opacity = 1;
    
    layer.cornerRadius = 100;
    layer.masksToBounds = YES;
    
    layer.transform = CATransform3DMakeScale(1.5, 1.5, 0);
 */
    
//----------------------事务---------------------------------
    
    // 隐式事务：当属性值发生给变后会自动提交的一个事务。
    // layer.position = CGPointMake(50, 400);

    // 显示事务，手动添加和提交事务。事务可以嵌套使用
    [CATransaction begin];
    
    [CATransaction setAnimationDuration:5];
    layer.transform = CATransform3DMakeScale(2, 2, 1);
    
    // 通过事务修改隐式动画的时间
    [CATransaction begin];
    // 通过事务修改隐式动画的时间
    [CATransaction setAnimationDuration:2];
    layer.position = self.view.center;;
     [CATransaction commit];
    
    [CATransaction commit];

}




@end
