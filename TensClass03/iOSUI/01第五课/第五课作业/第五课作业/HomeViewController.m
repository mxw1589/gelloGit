//
//  HomeViewController.m
//  第五课作业
//
//  Created by Chen on 16/1/19.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "HomeViewController.h"

#import "PeopleViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置标题
    self.title = @"首页";
    
    // 设置左右按钮
    UIBarButtonItem *leftItem =
    [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_nav_subscription_normal"]
                                     style:UIBarButtonItemStyleDone
                                    target:self
                                    action:@selector(leftButtonOnClicked:)];
    leftItem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem =
    [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"bottom_bar_comment_normal"]
                                     style:UIBarButtonItemStyleDone
                                    target:self
                                    action:@selector(rightButtonOnClicked:)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.navigationItem.backBarButtonItem.tintColor = [UIColor whiteColor];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBActions

- (void)leftButtonOnClicked:(UIBarButtonItem *)sender {
    
    PeopleViewController  *people = [[PeopleViewController alloc] init];
    
    [self.navigationController pushViewController:people animated:YES];
}

- (void)rightButtonOnClicked:(UIBarButtonItem *)sender {

    Class class = NSClassFromString(@"CommentViewController");
    id comment = [[class alloc] init];
    
    [self presentViewController:comment animated:YES completion:nil];
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
