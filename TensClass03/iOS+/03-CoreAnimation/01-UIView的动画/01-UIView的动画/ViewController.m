//
//  ViewController.m
//  01-UIView的动画
//
//  Created by qinglinfu on 16/2/22.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
    __weak IBOutlet UIView *aniView;
    
    __weak IBOutlet UIView *otherView;
    
}

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    // 1、UIView 的简单动画
    [UIView animateWithDuration:1.0 animations:^{
        
        // aniView.frame = CGRectMake(0, 400, 100, 100);
        
    }];
    
    
    // 2、动画嵌套
    [UIView animateWithDuration:1.0 animations:^{
        
         // aniView.frame = CGRectMake(0, 400, 100, 100);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:1.0 animations:^{
            
            // aniView.alpha = 0;
            
        }];
        
    }];
    
    
    // 3、delay: 动画延迟的秒数，options：动画运动效果（匀速、加速、减速）
    [UIView animateWithDuration:2 delay:0 options:0 animations:^{
        
        // aniView.frame = CGRectMake(20, 400, 100, 100);
        
    } completion:^(BOOL finished) {
        
        // aniView.transform = CGAffineTransformMakeScale(2, 2);
        
    }];
    
    
    [UIView animateWithDuration:2 delay:0.5 options:1 animations:^{
        
        // otherView.frame = CGRectMake(200, 400, 100, 100);
        
    } completion:^(BOOL finished) {
        
        
        [UIView animateWithDuration:0.5 animations:^{
           
           // otherView.transform = CGAffineTransformMakeRotation(M_PI_4);
        }];
        
    }];
    
    
    // 4、可以设置动画的缓冲效果，Damping: 0~1， 动画速度控制：Velocity：0~1
    [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1 options:0 animations:^{
        
        aniView.center = self.view.center;
        aniView.transform = CGAffineTransformMakeScale(2, 2);
        
    } completion:^(BOOL finished) {
    
    }];

}


@end
