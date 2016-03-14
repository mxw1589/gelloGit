//
//  Display.m
//  homeWork1
//
//  Created by guoqiang on 15-7-23.
//  Copyright (c) 2015年 tens十安科技. All rights reserved.
//

#import "Display.h"

@implementation Display

-(void)setInch:(int)inch
{
    _inch = inch;
}
-(int)inch
{
    return _inch;
}


-(void)showScreen
{
    NSLog(@"显示画面");
}
-(void)close
{
    NSLog(@"关闭显示器");
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%d", _inch];
}


@end
