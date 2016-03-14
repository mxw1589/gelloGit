//
//  main.m
//  UIWindowDemo
//
//  Created by Chen on 16/1/9.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        // 1 创建application
        // 2 去读取工程里面设置的storyboard,并显示,在这过程中会创建window
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
