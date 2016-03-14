//
//  HomeViewController.m
//  标签视图控制器
//
//  Created by Chen on 16/1/19.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "HomeViewController.h"

#import "ChatViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];
    
    self.navigationItem.title = @"abc";
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 31, 31)];
    imageView.image = [UIImage imageNamed:@"abc"];
    
    [self.view addSubview:imageView];
    
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 150, 31, 31)];
    imageView2.image = [UIImage imageNamed:@"abcaaa"];
    
    [self.view addSubview:imageView2];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [super touchesBegan:touches withEvent:event];
    
    
//    self.hidesBottomBarWhenPushed = YES;

    ChatViewController *chat = [[ChatViewController alloc] init];
    chat.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:chat animated:YES];
    NSLog(@"%@", self.navigationController);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
