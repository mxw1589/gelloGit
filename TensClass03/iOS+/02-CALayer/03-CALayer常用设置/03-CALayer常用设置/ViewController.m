//
//  ViewController.m
//  03-CALayer常用设置
//
//  Created by qinglinfu on 16/2/20.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    CALayer *layer = [CALayer layer];
    [self.view.layer addSublayer:layer];

    layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    
    // 1、设置大小
    layer.bounds = CGRectMake(0, 0, 300, 300);
    
    // 2、定位点
    layer.position = self.view.center;
    
    // 3、锚点、支点，决定子图层的哪个点在position点上。取值范围(0,0)~(1,1)
    layer.anchorPoint = CGPointMake(0.5, 0.5);
    
    // 4、设置图层在父图层中的层次位置
     layer.zPosition = 0;
    
    // 5、填充内容
     layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"photo.jpg"].CGImage);
    
    // 6、设置边框宽度
    layer.borderWidth = 3;
    // 7、边框颜色
    layer.borderColor = [UIColor redColor].CGColor;
    
    // 8、添加圆角,必须设置masksToBounds为YES
     // layer.cornerRadius = 150;
    // 9、是否裁剪子图层多余部分
     // layer.masksToBounds = YES;
    
    // 10、设置透明度
    layer.opacity = 0.5;
    
    // 11、设置阴影的尺寸
    layer.shadowOffset = CGSizeMake(3,5);
    // 12、阴影的颜色
    layer.shadowColor = [UIColor blackColor].CGColor;
    // 13、阴影透明度
    layer.shadowOpacity = 1;
    // 14、阴影圆角
    layer.shadowRadius = 10;
    
    // 同时设置圆角和阴影时，可以将图片转为color填充
    UIImage *image = [UIImage imageNamed:@"photo.jpg"];
    layer.backgroundColor = [UIColor colorWithPatternImage:image].CGColor;
    
    
     // 15、设置裁剪图层
    CALayer *maskLayer = [CALayer layer];
    maskLayer.position = CGPointMake(150, 150);
    maskLayer.bounds = CGRectMake(0, 0, 200, 200);
     maskLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"maskPicture"].CGImage);
    // [layer addSublayer:maskLayer];
    
    // layer.mask = maskLayer;
    
    
   //---------------------CALayer的仿射坐标变换--------------------
    
    // 设置layer缩放
    layer.transform = CATransform3DMakeScale(1, 1, 1);
    
    // 设置layer旋转
    layer.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
    
    // 设置layer平移
    layer.transform = CATransform3DMakeTranslation(0, 0, 0);
    
    
    // 通过KVC设置transform
    [layer setValue:@0.5 forKeyPath:@"transform.scale"];
    
    [layer setValue:@(M_PI_4) forKeyPath:@"transform.rotation.z"];
    
    [layer setValue:@20 forKeyPath:@"transform.translation.x"];
}



@end
