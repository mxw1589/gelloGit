//
//  ViewController.m
//  03-block_(作为类的属性使用)
//
//  Created by qinglinfu on 16/2/19.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.block = ^(int a) {
      
        NSLog(@"a = %d",a);
    };
    
    _block(200);
}




@end
