//
//  FriendViewController.m
//  标签视图控制器
//
//  Created by Chen on 16/1/19.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "FriendViewController.h"
#import "ChatViewController.h"

@interface FriendViewController ()

@end

@implementation FriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [super touchesBegan:touches withEvent:event];
    
    
    //    self.hidesBottomBarWhenPushed = YES;
    
    ChatViewController *chat = [[ChatViewController alloc] init];
    chat.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:chat animated:YES];
    NSLog(@"%@", self.navigationController);
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
