//
//  ViewController.m
//  触摸事件课后练习2
//
//  Created by Chen on 16/1/26.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    CGPoint _beginPoint;
}

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIView *alphaView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.alphaView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    self.alphaView.hidden = NO;

    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    _beginPoint = point;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];

    CGRect frame = {_beginPoint, point.x- _beginPoint.x, point.y - _beginPoint.y};
    self.alphaView.frame = frame;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    
    self.alphaView.hidden = YES;
}

- (UIView *)alphaView {
    if (!_alphaView) {
        _alphaView = [[UIView alloc] init];
        _alphaView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.2];
    }
    return _alphaView;
}

@end
