//
//  RegistViewController.h
//  03-block_(作为类的属性使用)
//
//  Created by qinglinfu on 16/2/19.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RegistBlock)(NSString *userName, NSString *password);

@interface RegistViewController : UIViewController

@property(nonatomic, copy)RegistBlock block;

@end
