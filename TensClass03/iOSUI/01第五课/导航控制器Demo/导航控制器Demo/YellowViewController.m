//
//  YellowViewController.m
//  导航控制器Demo
//
//  Created by Chen on 16/1/18.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "YellowViewController.h"
#import "GreenViewController.h"

@interface YellowViewController ()

@end

@implementation YellowViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor yellowColor];
    

    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.center = self.view.center;
    [button addTarget:self
               action:@selector(pushToGreenPage)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
#warning 只有第二种和第三种方式可以设置 backBarButtonItem
    
    /**
    // 第一种 使用系统提供的方式创建

    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(test)];
    self.navigationItem.leftBarButtonItem = item;


    // 第二种 使用系统提供的方式,但是可以设置标题
    
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"Tens" style:UIBarButtonItemStyleDone target:self action:@selector(test)];
    self.navigationItem.leftBarButtonItem = item2;
    

    // 第三种 使用系统提供的可以设置按钮图片,只是保留了图片的形状,颜色被设置为系统颜色
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"test.png"] style:UIBarButtonItemStyleDone target:nil action:nil];
//    self.navigationItem.leftBarButtonItem = item3;
    self.navigationItem.backBarButtonItem = item3;

    // 第四种 完全自义定
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"Label";
    label.frame = CGRectMake(0, 0, 50, 40);
    UIBarButtonItem *item4 = [[UIBarButtonItem alloc] initWithCustomView:label];
    self.navigationItem.rightBarButtonItem = item4;
 */
    
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"test.png"] style:UIBarButtonItemStyleDone target:nil action:nil];
    //    self.navigationItem.leftBarButtonItem = item3;
    self.navigationItem.backBarButtonItem = item3;

}

- (void)test {
    NSLog(@"%s", __func__);
    
//    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];


    self.navigationController.navigationBar.barTintColor = [UIColor yellowColor];   // 设置导航栏背景颜色
}

- (void)pushToGreenPage {
    GreenViewController *green = [[GreenViewController alloc] init];
    [self.navigationController pushViewController:green animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [super touchesBegan:touches withEvent:event];

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
