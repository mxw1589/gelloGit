//
//  ViewController.m
//  UISliderDemo
//
//  Created by Chen on 16/1/12.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UIAlertViewDelegate,
UIActionSheetDelegate>
{
    UISlider *_slider;
    UIProgressView *progressView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", [[UIApplication sharedApplication] windows]);

    [self createAlertView];

    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"%@", [[UIApplication sharedApplication] windows]);
    });
    
//    [self createSlider];
//    [self createProgressView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
//    [_slider setValue:100 animated:NO];
    
//    NSLog(@"value == %f", _slider.value);
    NSLog(@"progress == %f", progressView.progress);
    
//    [self createActionSheet];

}


#pragma mark - Private

- (void)createProgressView {
 
    progressView = [[UIProgressView alloc] init];
    progressView.frame = CGRectMake(10, 200, 200, 100);
    progressView.progressTintColor = [UIColor redColor];    // 设置进度条左边的颜色
    progressView.trackTintColor = [UIColor yellowColor];    // 设置进度条右边的颜色
    
    [progressView setProgress:0.5 animated:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(progressViewValueChange:)
                                   userInfo:nil
                                    repeats:YES];
    
    [self.view addSubview:progressView];
}

- (void)createSlider {
    
    _slider = [[UISlider alloc] initWithFrame:CGRectMake(15, 200, 250, 100)];
//    _slider.value // 获取_slider当前的数值
    _slider.minimumValue = 0;    // 滑块的最小值,默认为0
    _slider.maximumValue = 100;  // 滑块的最大值,默认为1
    
    _slider.minimumValueImage = [UIImage imageNamed:@"button1"];    // 滑块左边的图标
    _slider.maximumValueImage = [UIImage imageNamed:@"button2"];    // 滑块右边的图标
        
    _slider.continuous = NO;    // 为yes时会一直调用绑定的事件,为NO时,事件结束后调用
    
    _slider.minimumTrackTintColor = [UIColor redColor];     // 滑块左边的颜色
    _slider.maximumTrackTintColor = [UIColor yellowColor];  // 滑块右边的颜色
    _slider.thumbTintColor = [UIColor grayColor];           // 滑块的颜色
    
    
    /**
     
     - (void)setThumbImage:(nullable UIImage *)image forState:(UIControlState)state;
     - (void)setMinimumTrackImage:(nullable UIImage *)image forState:(UIControlState)state;
     - (void)setMaximumTrackImage:(nullable UIImage *)image forState:(UIControlState)state;
     */
    
    [_slider setThumbImage:[UIImage imageNamed:@"button1"]
                  forState:UIControlStateNormal];          // 滑块的样式
 
    [_slider setMinimumTrackImage:[UIImage imageNamed:@"button1"] forState:UIControlStateNormal];           // 滑块左边的图片
    [_slider setMaximumTrackImage:[UIImage imageNamed:@"button2"] forState:UIControlStateHighlighted];
    
    
    [_slider addTarget:self action:@selector(sliderChangeValueAction:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_slider];
}


- (void)createAlertView {
    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"一个title" message:@"你中毒啦" delegate:self cancelButtonTitle:@"晓得了" otherButtonTitles:@"好", @"很好", nil];
//
//    [alert show];
    
    UIAlertController *alert2 = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert2 addAction:[UIAlertAction actionWithTitle:@"1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"123");
    }]];
    
    [alert2 addAction:[UIAlertAction actionWithTitle:@"2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"345");
    }]];
    
    [self presentViewController:alert2 animated:YES completion:nil];
}

- (void)createActionSheet {
    UIActionSheet *actionSheet =
    [[UIActionSheet alloc] initWithTitle:@"温馨提示"
                                delegate:self
                       cancelButtonTitle:@"取消按钮"
                  destructiveButtonTitle:nil
                       otherButtonTitles:@"另一个按钮", @"另另一个按钮", nil];
                                  

    [actionSheet showInView:self.view];
}


#pragma mark - UIAlertViewDelegate


// 按钮点击时调用
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSLog(@"buttIndex== %ld", buttonIndex);

}

- (void)alertViewCancel:(UIAlertView *)alertView {
    NSLog(@"点击了取消按钮");

}

// alertView将要显示
- (void)willPresentAlertView:(UIAlertView *)alertView {
    
}

// alertView已经显示
- (void)didPresentAlertView:(UIAlertView *)alertView {

}

// alertView将要消失
- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {

}

// alertView已经消失
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"%s", __func__);


}

// 返回NO,第一个按钮不可用
- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView {

    return YES;
}


#pragma mark - UIActionSheetDelegate

// 按钮点击时调用
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"buttonIndex %ld", buttonIndex);
}

// 取消按钮点击
- (void)actionSheetCancel:(UIActionSheet *)actionSheet {
    
}

// 将要显示
- (void)willPresentActionSheet:(UIActionSheet *)actionSheet {
    
}
// 已经显示
- (void)didPresentActionSheet:(UIActionSheet *)actionSheet {
    
}

// 将要消失
- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex {
    
}

// 已经消失
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
}

#pragma mark - IBActions

- (void)sliderChangeValueAction:(UISlider *)slider {
    
    NSLog(@"value == %f", slider.value);
}

- (void)progressViewValueChange:(UIProgressView *)progressView2 {
    
    progressView.progress += 0.01;
}

@end
