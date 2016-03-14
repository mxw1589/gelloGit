//
//  ViewController.m
//  05-CATransition(转场动画)
//
//  Created by qinglinfu on 16/2/23.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *transitionImageView;

@property (strong, nonatomic) CATransition *transitionAni;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISwipeGestureRecognizer *swipe_right = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(imageTransition:)];
    swipe_right.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe_right];
    
    UISwipeGestureRecognizer *swipe_left = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(imageTransition:)];
    swipe_left.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipe_left];
}

- (void)imageTransition:(UISwipeGestureRecognizer *)swipe
{
    static int index = 0;
    NSString *imageName;
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight ) {
        
        index--;
        if (index < 0) {
            
            index = 4;
        }
        self.transitionAni.subtype = kCATransitionFromLeft;
        imageName = [NSString stringWithFormat:@"%d.jpg",index];
    } else {
        
        index++;
        if (index > 4) {
            
            index = 0;
        }
        self.transitionAni.subtype = kCATransitionFromRight;
        imageName = [NSString stringWithFormat:@"%d.jpg",index];
    }

    self.transitionImageView.image = [UIImage imageNamed:imageName];
    
    [self.transitionImageView.layer addAnimation:self.transitionAni forKey:nil];
}


#pragma mark - 设置转场动画
- (CATransition *)transitionAni
{
    if (!_transitionAni) {
       
        _transitionAni = [CATransition animation];
        _transitionAni.duration = 0.5;
        
        // 设置转场动画的样式
        
        /* API中公开的效果只有fade、moveIn、push、reveal四种，其他为私有
         
         1. fade     淡出效果
         2. moveIn 进入效果
         3. push    推出效果
         4. reveal   移出效果
         5. cube   立方体翻转效果
         6. suckEffect  抽走效果
         7. rippleEffect 水波效果
         8. pageCurl    翻开页效果
         9. pageUnCurl 关闭页效果
         10. cameraIrisHollowOpen  相机镜头打开效果
         11.  cameraIrisHollowClose  相机镜头关闭效果
         
         */
        _transitionAni.type = @"cameraIrisHollowOpen";
        
        // 设置转场动画的切换方向
        /*
         kCATransitionFromRight
         kCATransitionFromLeft
         kCATransitionFromTop
         kCATransitionFromBottom
         */
         _transitionAni.subtype = kCATransitionFromRight;
    }
    
    return _transitionAni;
}

@end
