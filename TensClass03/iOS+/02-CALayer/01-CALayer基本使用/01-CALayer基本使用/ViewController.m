//
//  ViewController.m
//  01-CALayer基本使用
//
//  Created by qinglinfu on 16/2/20.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 320, 200)];
    
    view.backgroundColor = [UIColor orangeColor];
    view.layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view addSubview:view];
    */
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, 320, 150);
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    // 1、给layer填充图片内容
    UIImage *image = [UIImage imageNamed:@"image"];
    layer.contents = (__bridge id _Nullable)(image.CGImage);
    
    
    // 2、使用CALayer的子类填充内容
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = CGRectMake(0, 200, 320, 30);
    textLayer.string = @"这是一个显示文字的layer";
    textLayer.fontSize = 20;
    textLayer.alignmentMode = @"center";
    // textLayer.font = (__bridge CFTypeRef _Nullable)([UIFont fontNamesForFamilyName:@"楷体"]);
    textLayer.foregroundColor = [UIColor redColor].CGColor;
    textLayer.backgroundColor = [UIColor lightGrayColor].CGColor;

    [self.view.layer addSublayer:textLayer];
    
    
    // 3、给layer绘制图形
    CALayer *cLayer = [CALayer  layer];
    cLayer.bounds = CGRectMake(0, 0, 320, 200);
    cLayer.position = self.view.center;
    cLayer.backgroundColor = [UIColor grayColor].CGColor;
    cLayer.delegate = self;
    
    // 重绘，必须手动调用这个方法才会触发绘图的代理方法。
    [cLayer setNeedsDisplay];
    [self.view.layer addSublayer:cLayer];

}

// layer绘图的代理方法
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGRect rect = CGRectMake(20, 20, 280, 160);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor greenColor].CGColor);
    CGContextSetLineWidth(ctx, 5);
    // CGContextAddRect(ctx, rect); // 绘制矩形
    CGContextAddEllipseInRect(ctx, rect); // 绘制内切圆\椭圆
    CGContextDrawPath(ctx, kCGPathFillStroke);
}


@end
