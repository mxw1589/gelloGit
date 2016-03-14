//
//  AppDelegate.m
//  导航控制器Demo
//
//  Created by Chen on 16/1/18.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    /**
    ViewController *vc = [[ViewController alloc] init];
    self.window.rootViewController = vc;
    */
    
    ViewController *vc = [[ViewController alloc] init];
    
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
    
    /**
     UIBarStyleDefault          = 0,
     UIBarStyleBlack            = 1,

     */
    navi.navigationBar.barStyle = UIBarStyleDefault;    // 设置导航栏的样式
//    navi.navigationBar.tintColor = [UIColor blackColor];  // 设置导航栏字体的颜色
    
    // 设置导航栏的背景图片
    
    /** 设置图片
     UIImageResizingModeTile,
     UIImageResizingModeStretch,
     */
//    UIImage *image = [[UIImage imageNamed:@"naviBack"] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 150, 55, 1) resizingMode:UIImageResizingModeStretch];
    [navi.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];

    NSLog(@"%@", navi);
    
    self.window.rootViewController = navi;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
