//
//  IntroduceViewController.m
//  第五课作业
//
//  Created by Chen on 16/1/19.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "IntroduceViewController.h"

@interface IntroduceViewController ()

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *label;

@end

@implementation IntroduceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    self.title = @"人物简介";
    
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.label];
    
    self.label.text = self.introduce;
    self.imageView.image = [UIImage imageNamed:self.imageName];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGFloat screenWidht = CGRectGetWidth(self.view.frame);
    CGFloat screenHeight = CGRectGetHeight(self.view.frame);
    
    self.imageView.frame = CGRectMake(0, 100, screenWidht, screenHeight/2);
    
    CGFloat imageviewBottom = CGRectGetMaxY(self.imageView.frame);
    self.label.frame = CGRectMake(0, imageviewBottom+15, screenWidht, screenHeight-imageviewBottom);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - Custom Accessors

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.textColor = [UIColor whiteColor];
        _label.numberOfLines = 0;
    }
    return _label;
}

@end
