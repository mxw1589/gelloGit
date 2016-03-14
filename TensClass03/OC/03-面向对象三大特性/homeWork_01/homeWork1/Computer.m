//
//  Computer.m
//  homeWork1
//
//  Created by guoqiang on 15-7-23.
//  Copyright (c) 2015年 tens十安科技. All rights reserved.
//

#import "Computer.h"

@implementation Computer

-(instancetype)initWithCPBrand:(NSString *)CPBrand withDisk:(Disk *)disk withDisplay:(Display *)display
{
    self = [super init];
    if (self) {
        _disk = disk;
        _display = display;
        _CPBrand = CPBrand;
    }
    return self;
}


-(void)setDisk:(Disk *)disk
{
    _disk = disk;
}

-(Disk *)disk
{
    return _disk;
}

-(void)setDisplay:(Display *)display
{
    _display = display;
}

-(Display *)display
{
    return _display;
}

-(void)showInfo
{
    NSLog(@"电脑：%@, 显示器：%@",_CPBrand, _display);
}


-(void)palyer
{
    NSLog(@"播放电影");
    [_disk read];
    [_display showScreen];
}


-(void)closed
{
    NSLog(@"关机");
    [_disk preserve];
    [_display close];
}

@end
