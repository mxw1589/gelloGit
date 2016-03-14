//
//  ViewController.m
//  UIImageView的使用
//
//  Created by Chen on 16/1/12.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    UIImageView *imageView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor grayColor];
    
    [self createImageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 点击self.view时会调用该方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    if ([imageView isAnimating]) {
        [imageView stopAnimating];
    }
    else {
        [imageView startAnimating];
    }
}


#pragma mark - Private

- (UIImage *)createImagewithName:(NSString *)name {
    
    // UIImage的使用 使用图片名字的方式创建图片 一直在内存里面,适合一些icon之类的创建
//    UIImage *image = [UIImage imageNamed:@"0.png"];
    
    // 使用文件路径的方式创建图片, 这种方式创建的图片不会缓存在内存中,适合一些大图片的使用
    NSString *filePath = [[NSBundle mainBundle] pathForResource:name ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:filePath];

    NSLog(@"size == %@", NSStringFromCGSize(image.size));
    NSLog(@"scale == %f", image.scale);
    return image;
}

- (void)createImageView {
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 60)];
    imageView2.center = self.view.center;
    
    UIImage *image = [self createImagewithName:@"image"];
    
    // 设置image
    imageView2.image = image;

    [self.view addSubview:imageView2];
}

- (void)createImageView2 {
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    imageView.center = self.view.center;
    
    
    NSMutableArray *images = [NSMutableArray array];
    for (int i=0; i<5; i++) {
        images[i] = [self createImagewithName:[@(i) stringValue]];
    }
    
    imageView.animationImages = images;
    imageView.animationDuration = 5;        // 动画的总时间
    imageView.animationRepeatCount = HUGE_VALF;     // 动画重复的次数
    
    [self.view addSubview:imageView];
}

@end
