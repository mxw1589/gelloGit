//
//  ViewController.m
//  DownLoadProgressView
//
//  Created by qinglinfu on 16/2/26.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import "DrawDownLoadView.h"

@interface ViewController (){
    
    DrawDownLoadView *downLoadView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    downLoadView = [[DrawDownLoadView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    downLoadView.center = self.view.center;
    [self.view addSubview:downLoadView];
}

- (IBAction)sliderAction:(UISlider *)sender {
    
    downLoadView.progress = sender.value;
}


@end
