//
//  ViewController.m
//  02-Quartz 2D绘制基本图形
//
//  Created by qinglinfu on 16/2/24.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import "QuartzView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    QuartzView *view = [[QuartzView alloc] initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
    
}



@end
