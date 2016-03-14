//
//  TabBarViewController.m
//  标签视图控制器
//
//  Created by Chen on 16/1/19.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "TabBarViewController.h"

#import "HomeViewController.h"
#import "FriendViewController.h"
#import "MoreViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initTabbarController];
}

- (void)initTabbarController {
    HomeViewController *home = [[HomeViewController alloc] init];
    home.title = @"首页";
    //    UITabBarItem *item = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:0];
    
    UIImage *image = [[UIImage imageNamed:@"1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"首页" image:image tag:0];
    home.tabBarItem = item;
    UINavigationController *homeNavi = [[UINavigationController alloc] initWithRootViewController:home];
    homeNavi.navigationBar.translucent = NO;
    
    FriendViewController *friend = [[FriendViewController alloc] init];
    friend.title = @"朋友";
    UITabBarItem *item2 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:0];
    friend.tabBarItem = item2;
    
    MoreViewController *more = [[MoreViewController alloc] init];
    more.title = @"更多";
    UITabBarItem *item3 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:0];
    more.tabBarItem = item3;
    
    self.tabBar.translucent = NO;
    
    self.viewControllers = @[homeNavi, friend, more];
    self.tabBar.tintColor = [UIColor blueColor]; // 选中后的颜色
    self.tabBar.barTintColor = [UIColor whiteColor];   // 背景颜色
    //    tabbar.tabBar.backgroundImage = [UIImage imageNamed:@"bg"]; // 背景图片
    //    tabbar.tabBar.selectionIndicatorImage = [UIImage imageNamed:@"2"];  // 设置选中的图片
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
