//
//  ViewController.m
//  UIWindowDemo
//
//  Created by Chen on 16/1/9.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"title" message:@"tens" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
    [alert show
     ];
}

@end
