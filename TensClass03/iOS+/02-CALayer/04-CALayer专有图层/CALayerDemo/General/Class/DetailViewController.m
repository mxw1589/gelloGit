//
//  DetailViewController.m
//  CALayerDemo
//
//  Created by Chen on 15/7/14.
//  Copyright (c) 2015年 Wet. All rights reserved.
//

#import "DetailViewController.h"

#import <AVFoundation/AVFoundation.h>

@interface DetailViewController ()
- (void)loadLayerWithType:(LayerType)type;
- (void)loadCAShapeLayer;
- (void)loadCATextLayer;
- (void)loadCAGradientLayer;
- (void)loadCAEmitterLayer;
- (void)loadAVPlayerLayer;

@end

@implementation DetailViewController


#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadLayerWithType:self.type];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Private

- (void)loadLayerWithType:(LayerType)type {
    switch (type) {
        case LayerTypeCAShapeLayer: {
            [self loadCAShapeLayer];
            break;
        }
        case LayerTypeCATextLayer: {
            [self loadCATextLayer];
            break;
        }
        case LayerTypeCAGradientLayer: {
            [self loadCAGradientLayer];
            break;
        }
        case LayerTypeCAEmitterLayer: {
            [self loadCAEmitterLayer];
            break;
        }
        case LayerTypeAVPlayerLayer: {
            [self loadAVPlayerLayer];
            break;
        }
    }
}

- (void)loadCAShapeLayer {
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path addArcWithCenter:CGPointMake(160, 100) radius:50 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [path moveToPoint:CGPointMake(160, 150)];
    [path addLineToPoint:CGPointMake(100, 350)];
    [path moveToPoint:CGPointMake(160, 150)];
    [path addLineToPoint:CGPointMake(220, 350)];
    [path moveToPoint:CGPointMake(80, 200)];
    [path addLineToPoint:CGPointMake(240, 200)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 5;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;

    [self.view.layer addSublayer:shapeLayer];
}

- (void)loadCATextLayer {
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = CGRectMake(100, 100, 200, 100);
        textLayer.foregroundColor = [UIColor blackColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    
    UIFont *font = [UIFont systemFontOfSize:15];
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    
    NSString *text = @"人永远是要学习的。死的时候，才是毕业的时候。";
    textLayer.string = text;
    
    [self.view.layer addSublayer:textLayer];
}

- (void)loadCAGradientLayer {

    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.view.bounds;
    NSArray *colors = @[(__bridge id)[UIColor grayColor].CGColor,
                        (__bridge id)[UIColor whiteColor].CGColor,
                        (__bridge id)[UIColor yellowColor].CGColor];
    gradientLayer.colors = colors;
    gradientLayer.locations = @[@0.33, @0.67];  // 0 ~ 1
    gradientLayer.startPoint = CGPointMake(0, 1);
    gradientLayer.endPoint = CGPointMake(1, 1);
    
    [self.view.layer addSublayer:gradientLayer];
}

- (void)loadCAEmitterLayer {
    
    self.view.backgroundColor  = [UIColor blackColor];
    
    // 创建粒子Layer
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    
    // 粒子发射位置
    snowEmitter.emitterPosition = CGPointMake(120,-20);
    
    // 发射源的尺寸大小
    snowEmitter.emitterSize = self.view.bounds.size;
    
    // 发射模式
    snowEmitter.emitterMode = kCAEmitterLayerSurface;
    
    // 发射源的形状
    snowEmitter.emitterShape = kCAEmitterLayerLine;
    
    // 创建雪花类型的粒子
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    
    // 粒子参数的速度乘数因子
    snowflake.birthRate = 20.0;
    snowflake.lifetime = 120.0;
    
    // 粒子速度
    snowflake.velocity =10.0;
    
    // 粒子的速度范围
    snowflake.velocityRange = 10;
    
    // 粒子y方向的加速度分量
    snowflake.yAcceleration = 200;
    
    // 周围发射角度
    snowflake.emissionRange = 0.5 * M_PI;
    
    // 子旋转角度范围
    snowflake.spinRange = 0.25 * M_PI;
    snowflake.contents = (id)[[UIImage imageNamed:@"snow"] CGImage];
    
    // 设置雪花形状的粒子的颜色
    snowflake.color = [[UIColor whiteColor] CGColor];
    
    snowEmitter.shadowOpacity = 1.0;
    snowEmitter.shadowRadius = 0.0;
    snowEmitter.shadowOffset = CGSizeMake(0.0, 0.0);
    
    // 粒子边缘的颜色
    snowEmitter.shadowColor = [[UIColor whiteColor] CGColor];
    
    // 粒子的名字
    snowflake.name = @"snow";
    
    // 添加粒子
    snowEmitter.emitterCells = @[snowflake];
    
    // 将粒子Layer添加进图层中
    [self.view.layer addSublayer:snowEmitter];
}

- (void)loadAVPlayerLayer {
    
    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"video" withExtension:@"mp4"];
    
    AVPlayer *player = [AVPlayer playerWithURL:URL];
    
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    playerLayer.frame = CGRectMake(32, 100, 256, 140);
    
    playerLayer.masksToBounds = YES;
    playerLayer.cornerRadius = 20.0;
    playerLayer.borderColor = [UIColor redColor].CGColor;
    playerLayer.borderWidth = 5.0;
    
    [self.view.layer addSublayer:playerLayer];
    
    [player play];
}

@end
