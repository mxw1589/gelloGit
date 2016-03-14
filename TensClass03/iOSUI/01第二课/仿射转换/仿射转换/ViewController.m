//
//  ViewController.m
//  仿射转换
//
//  Created by Chen on 16/1/11.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.redView];
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [super touchesBegan:touches withEvent:event];
//    
//    
//    // 多了make 代表这仿射转换从最初值开始变化
//    // 没有maek 代表这仿射转换从当前状态开始变化
//    
//    // 平移
//    CGAffineTransform translation = CGAffineTransformMakeTranslation(0, 100);
//    CGAffineTransform translation2 = CGAffineTransformTranslate(self.redView.transform, CGFloat tx, CGFloat ty)
//    
//    // 缩放
//    CGAffineTransform scale = CGAffineTransformMakeScale(0.5, 0.5);
////    CGAffineTransform scale2 = CGAffineTransformScale(<#CGAffineTransform t#>, <#CGFloat sx#>, <#CGFloat sy#>)
//    
//    // 旋转
//    CGAffineTransform rotation = CGAffineTransformMakeRotation(M_PI_4);
////    CGAffineTransform rotation = CGAffineTransformRotate(<#CGAffineTransform t#>, <#CGFloat angle#>)
//    
//    // 缩放+旋转
//    CGAffineTransform transform = CGAffineTransformConcat(scale, rotation);
//    
//    // 平移 + 缩放 + 旋转
//    CGAffineTransform transform2 = CGAffineTransformConcat(transform, translation);
//    
//    self.redView.transform = transform2;
//    // 恢复view的初始值
////    self.redView.transform = CGAffineTransformIdentity;
//}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    // 多了make 代表这仿射转换从最初值开始变化
    // 没有maek 代表这仿射转换从当前状态开始变化
    
    
    // 缩放
    self.redView.transform = CGAffineTransformScale(self.redView.transform, 0.9, 0.9);
    
    // 旋转
//    self.redView.transform = CGAffineTransformRotate(self.redView.transform, M_PI_4);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)redView {
    
    if (_redView == nil) {
        _redView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        _redView.backgroundColor = [UIColor redColor];
    }
    return _redView;
}

@end
