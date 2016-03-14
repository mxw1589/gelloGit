//
//  ViewController.m
//  触摸事件作业1
//
//  Created by Chen on 16/1/26.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    // 图片的放大缩放
    //    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesturePress:)];
    //    tap1.numberOfTapsRequired = 2;
    //
    //    [self.imageView addGestureRecognizer:tap1];
    //
    //    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap2GesturePress:)];
    //    tap2.numberOfTouchesRequired = 2;
    //    [self.imageView addGestureRecognizer:tap2];
    //
    //    [tap1 requireGestureRecognizerToFail:tap2];
}


//- (void)tapGesturePress:(UITapGestureRecognizer *)tap {
//
//    [UIView animateWithDuration:0.25 animations:^{
//        self.imageView.transform = CGAffineTransformMakeScale(2, 2);
//    }];
//}
//
//- (void)tap2GesturePress:(UITapGestureRecognizer *)tap {
//
//    [UIView animateWithDuration:0.25 animations:^{
//        self.imageView.transform = CGAffineTransformIdentity;
//    }];
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    UITouch *touch = [touches anyObject];
    NSLog(@"%ld", touches.count);
    
    if (touch.tapCount == 1 && touches.count == 1) {
        // 功能1,单击后移动图片
        CGPoint curretPoint = [self getCurrentPointWithTouchs:touches];
        [UIView animateWithDuration:0.25 animations:^{
            self.imageView.center = curretPoint;
        }];
    }
    
    // 功能3, 放大
    if (touch.tapCount == 2 && touches.count == 1) {
        [UIView animateWithDuration:0.25 animations:^{
            self.imageView.transform = CGAffineTransformMakeScale(2, 2);
        }];
    }
    
    if (touch.tapCount == 1 && touches.count == 2) {
        [UIView animateWithDuration:0.25 animations:^{
            self.imageView.transform = CGAffineTransformIdentity;
        }];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    
    return;
    // 功能2,图片跟随手势移动
    CGPoint currentPoint = [self getCurrentPointWithTouchs:touches];
    [UIView animateWithDuration:0.25 animations:^{
        self.imageView.center = currentPoint;
    }];
}

- (CGPoint)getCurrentPointWithTouchs:(NSSet *)touches {
    
    UITouch *touch = [touches anyObject];
    return [touch locationInView:self.view];
}

@end
