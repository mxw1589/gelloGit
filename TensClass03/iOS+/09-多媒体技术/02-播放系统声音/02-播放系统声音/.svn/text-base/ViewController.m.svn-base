//
//  ViewController.m
//  02-播放系统声音
//
//  Created by qinglinfu on 16/3/11.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)playSystemAudio
{
    // 系统声音ID列表http://iphonedevwiki.net/index.php/AudioServices
    // 直接播放系统指定ID的声音
    // AudioServicesPlaySystemSound(1002);
    
    SystemSoundID soundID;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"msg" ofType:@"wav"];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    // 将本地的声音注册为系统声音
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(url), &soundID);
    
    // 播放没有震动
    // AudioServicesPlaySystemSound(soundID);
    
    // 播放并且震动
    AudioServicesPlayAlertSound(soundID);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self playSystemAudio];
}


@end
