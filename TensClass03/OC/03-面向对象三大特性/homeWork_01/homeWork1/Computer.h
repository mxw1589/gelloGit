//
//  Computer.h
//  homeWork1
//
//  Created by guoqiang on 15-7-23.
//  Copyright (c) 2015年 tens十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Disk.h"
#import "Display.h"
@interface Computer : NSObject
{
    NSString *_CPBrand;
    Disk *_disk;
    Display *_display;
}

-(instancetype)initWithCPBrand:(NSString *)CPBrand withDisk:(Disk *)disk withDisplay:(Display *)display;

-(void)setDisk:(Disk *)disk;
-(Disk *)disk;

-(void)setDisplay:(Display *)display;
-(Display *)display;

-(void)showInfo;
-(void)palyer;
-(void)closed;
@end
