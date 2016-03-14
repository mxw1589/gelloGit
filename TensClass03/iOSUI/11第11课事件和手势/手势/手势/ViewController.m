//
//  ViewController.m
//  手势
//
//  Created by Chen on 16/1/26.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet CustomView *customView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    //点击手势
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAction:)];
//
//    [self.customView addGestureRecognizer:tap];
    
    // 捏合手势
//    UIPinchGestureRecognizer *pin = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAction:)];
//    [self.customView addGestureRecognizer:pin];
    
    // 平移手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAction:)];
//    pan.minimumNumberOfTouches = 2;
//    pan.maximumNumberOfTouches = 3;
    
    [self.customView addGestureRecognizer:pan];
    
    // 轻扫手势
//    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAction:)];
//    [self.customView addGestureRecognizer:swipe];
    
    // 旋转手势
//    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAction:)];
//    [self.customView addGestureRecognizer:rotation];
    
    // 长按手势
//    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAction:)];
////    longPress.minimumPressDuration = 2; // 设置最小按下时间
//    longPress.numberOfTapsRequired = 1;     // 点击次数,默认是0,那就按下后就响应,为1的时候,按第二次的时候响应
//    longPress.numberOfTouchesRequired = 2;
//    [self.customView addGestureRecognizer:longPress];
}

- (void)gestureAction:(UIGestureRecognizer *)gesture {
    NSLog(@"%s %ld", __func__, gesture.state);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];

    self.customView.center = point;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
