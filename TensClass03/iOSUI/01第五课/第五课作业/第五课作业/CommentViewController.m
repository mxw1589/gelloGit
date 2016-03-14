//
//  CommentViewController.m
//  第五课作业
//
//  Created by Chen on 16/1/19.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "CommentViewController.h"

@interface CommentViewController ()

@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"评论";
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(5, 50, 310, 100)];
    
    [self.view addSubview:textView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(5, 160, 310, 44);
    
    [button setTitle:@"发送" forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"subscription_cell_bg_pressed"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonOnClicked:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:button];
}

- (void)buttonOnClicked:(UIButton *)sender {
    NSLog(@"发送信息");
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
