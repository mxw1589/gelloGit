//
//  AppDelegate.h
//  04-NSURLSession_(后台下载)
//
//  Created by qinglinfu on 16/3/7.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (copy, nonatomic)void (^backgroundCompletionHandler)();

@end

