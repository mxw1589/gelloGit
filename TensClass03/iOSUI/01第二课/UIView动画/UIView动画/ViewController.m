//
//  ViewController.m
//  UIView动画
//
//  Created by Chen on 16/1/11.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic)UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.redView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    /** 比较老的写法
    [UIView beginAnimations:nil context:nil];   // 开始
    [UIView setAnimationDuration:0.5];          // 设置动画的时长
    
    CGAffineTransform transform = CGAffineTransformTranslate(self.redView.transform, 0, 50);
    self.redView.transform = transform;
    
    [UIView commitAnimations];                  // 提交动画,也就是完成
     */
    
    
    /**     第一种动画方法
    第一个参数 动画时长
    第二个参数  相当于一个方法(叫法, 叫做block)
    [UIView animateWithDuration:0.5 animations:^{
        CGAffineTransform transform = CGAffineTransformTranslate(self.redView.transform, 0, 50);
        self.redView.transform = transform;
    }];

    
    [UIView animateWithDuration:1 animations:^{
        self.redView.frame = CGRectMake(300, 300, 100, 50);
    }];
     
     */

    /** 第二种动画方法
    
    [UIView animateWithDuration:1 animations:^{
        self.redView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.redView removeFromSuperview];
    }];
     
     */

    
    /** 第三种动画方法
     UIViewAnimationOptionCurveEaseInOut            = 0 << 16, // default
     UIViewAnimationOptionCurveEaseIn               = 1 << 16,
     UIViewAnimationOptionCurveEaseOut              = 2 << 16,
     UIViewAnimationOptionCurveLinear               = 3 << 16,

    
    
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.redView.center = self.view.center;
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.5 animations:^{
            CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4);
//            self.redView.transform = transform;
        }];
    }];
     */

    
    /** 第四种动画方法 弹簧动画
     
     * usingSpringWithDamping 范围0~1,数值越大振动效果越弱
     * initialSpringVelocity 初始速度,数值越大,一开始移动越快

     */
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:5 options:0 animations:^{
        self.redView.center = self.view.center;
    } completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIView *)redView {
    if (!_redView) {
        _redView = [[UIView alloc] initWithFrame:CGRectMake(100, 700, 200, 200)];
        _redView.backgroundColor = [UIColor redColor];
    }
    return _redView;
}

@end
