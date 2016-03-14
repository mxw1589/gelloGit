//
//  ViewController.m
//  02UI第二课UIView
//
//  Created by Chen on 16/1/9.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    UIView *_redView;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.bounds = CGRectMake(50, 50, self.view.frame.size.width, self.view.frame.size.height);
    
    _redView = [[UIView alloc] init];
    _redView.frame = CGRectMake(50, 50, 200, 200); // 设置view的大小位置
    _redView.backgroundColor = [UIColor redColor];   // 背景颜色
    
    _redView.center = CGPointMake(200, 150);        // 中心点

//    _redView.alpha = 0.5;
    // 添加redView到self.view
    [self.view insertSubview:_redView atIndex:100];
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(100, 100, 200, 200); // 设置view的大小位置
    view.backgroundColor = [UIColor yellowColor];   // 背景颜色
    
    view.center = CGPointMake(300, 200);        // 中心点
    
//    view.alpha = 0.5;
    // 添加redView到self.view
    [self.view addSubview:view];
    
    [self.view exchangeSubviewAtIndex:2 withSubviewAtIndex:3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    _redView.transform = CGAffineTransformMakeRotation(M_PI_4);
    
    NSLog(@"window == %@", _redView.window);
    NSLog(@"window == %@", self.view.window);

    NSLog(@"frame == %@", NSStringFromCGRect(_redView.frame));
    NSLog(@"bounds == %@", NSStringFromCGRect(_redView.bounds));
}

@end
