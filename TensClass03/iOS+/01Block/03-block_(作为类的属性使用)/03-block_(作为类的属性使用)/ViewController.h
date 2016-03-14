//
//  ViewController.h
//  03-block_(作为类的属性使用)
//
//  Created by qinglinfu on 16/2/19.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MyBlock)(int a);

@interface ViewController : UIViewController

@property (nonatomic, assign)int number;

@property (nonatomic, copy)MyBlock block;

@end

