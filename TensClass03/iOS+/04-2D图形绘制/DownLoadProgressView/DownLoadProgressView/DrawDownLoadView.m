//
//  DrawDownLoadView.m
//  DownLoadProgressView
//
//  Created by qinglinfu on 16/2/26.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "DrawDownLoadView.h"

@implementation DrawDownLoadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    [self drawBgView];
    [self drawProgressView];
    [self drawProgressText];
}

- (void)setProgress:(float)progress
{
    _progress = progress;
    // 重绘
    [self setNeedsDisplay];
}

// 画背景
- (void)drawBgView
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height) cornerRadius:20];
    
    [[UIColor colorWithWhite:0 alpha:0.5] setFill];
    
    [path fill];
}

// 画进度条
- (void)drawProgressView
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    float radius = self.bounds.size.width / 2 - 10;
    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    CGFloat endAngle = _progress * 2 * M_PI - M_PI_2;
    [path addArcWithCenter:center radius:radius startAngle:-M_PI_2 endAngle: endAngle clockwise:YES];
    [[UIColor whiteColor] setStroke];
    path.lineWidth = 10;
    path.lineCapStyle = kCGLineCapRound;
    
    [path stroke];
}

// 画文字
- (void)drawProgressText
{
    NSDictionary *attributes = @{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont boldSystemFontOfSize:20]};
    CGPoint center = CGPointMake(self.bounds.size.width / 2-30, self.bounds.size.height / 2 - 10);
    
    NSString *progressValue = [NSString stringWithFormat:@"%.2f%%",_progress * 100];
    [progressValue drawAtPoint:center withAttributes:attributes];
    
}


@end
