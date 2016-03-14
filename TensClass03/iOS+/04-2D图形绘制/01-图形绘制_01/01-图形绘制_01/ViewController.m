//
//  ViewController.m
//  01-图形绘制_01
//
//  Created by qinglinfu on 16/2/24.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    CALayer *drawLayer = [CALayer layer];
    drawLayer.bounds = self.view.bounds;
    drawLayer.position = self.view.center;
    drawLayer.backgroundColor = [UIColor blackColor].CGColor;
    drawLayer.delegate = self;
    [drawLayer setNeedsDisplay];
    
    [self.view.layer addSublayer:drawLayer];
    */
    
    DrawView *drawView = [[DrawView alloc] initWithFrame:self.view.bounds];
    drawView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:drawView];
    
}


@end
