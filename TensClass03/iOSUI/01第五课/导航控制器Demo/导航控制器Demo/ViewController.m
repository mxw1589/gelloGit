//
//  ViewController.m
//  导航控制器Demo
//
//  Created by Chen on 16/1/18.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "ViewController.h"
#import "YellowViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];
        
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.center = self.view.center;
    [button addTarget:self
               action:@selector(pushToYellowPage)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    self.navigationItem.title = @"红色VC";        // ViewController 的标题
//    self.navigationItem.titleView = button;       // 自定义title的view
//    self.navigationItem.prompt = @"abc";        // 二级标题
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    self.navigationController.navigationBar.barTintColor = [UIColor redColor];   // 设置导航栏背景颜色
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushToYellowPage {
    
    NSLog(@"%@", self.navigationController);
    
    YellowViewController *yellowPage = [[YellowViewController alloc] init];
    
    [self.navigationController pushViewController:yellowPage animated:YES];
}

@end
