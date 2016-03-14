//
//  GreenViewController.m
//  导航控制器Demo
//
//  Created by Chen on 16/1/18.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "GreenViewController.h"
#import "YellowViewController.h"

@interface GreenViewController ()

@end

@implementation GreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor greenColor];
    
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"test2"] style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.leftBarButtonItem = item3;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor greenColor];   // 设置导航栏背景颜色
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    /** 1 ~ 10;
     */
    
    NSArray *viewControllers = self.navigationController.viewControllers;
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:viewControllers];
    
    for (UIViewController *vc in array) {
        if ([vc isKindOfClass:[YellowViewController class]]) {
            [array removeObject:vc];
            break;
        }
    }
    self.navigationController.viewControllers = array;
    
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
