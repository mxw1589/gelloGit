//
//  main.m
//  homeWork1
//
//  Created by guoqiang on 15-7-23.
//  Copyright (c) 2015年 tens十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Computer.h"
#import "Display.h"
#import "Disk.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Display *display = [[Display alloc] init];
        Disk *disk = [[Disk alloc] init];
        display.inch = 22;
        disk.capacity = 500;
        
        Computer *cmp = [[Computer alloc] initWithCPBrand:@"联想" withDisk:disk withDisplay:display];
        cmp.display = display;
        cmp.disk = disk;

        [cmp showInfo];
        [cmp palyer];
        [cmp closed];

    }
    return 0;
}
