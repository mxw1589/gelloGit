//
//  ViewController.m
//  04-AVPlayer(播放流媒体)
//
//  Created by qinglinfu on 16/3/12.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerItem *playerItem;
@property (nonatomic, strong) NSTimer *timer;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(palyerCurrentTime:) userInfo:nil repeats:YES];
    self.timer.fireDate = [NSDate distantFuture];
}

- (void)palyerCurrentTime:(NSTimer *)timer
{
    // 获取播放的时间进度：currentTime
    float timeValue = (float)self.player.currentItem.currentTime.value / self.player.currentItem.currentTime.timescale;
    
    NSLog(@"当前时间：%f",timeValue);

    
    // 获取在线播放的媒体加载好的时间： loadedTimeRanges
    NSValue *loadTimeValue = [self.player.currentItem.loadedTimeRanges lastObject];
    CMTimeRange timeRange;
    [loadTimeValue getValue:&timeRange];
    NSLog(@"loadTime:%f",(float)timeRange.duration.value/timeRange.duration.timescale);

}


- (IBAction)statrPalyer:(UIButton *)sender {
    
    NSLog(@"%ld",self.player.status);
    /* 
     播放前先判断播放状态：
     
        AVPlayerStatusUnknown, 未知，没有加载完成时
        AVPlayerStatusReadyToPlay, 可以播放
        AVPlayerStatusFailed, 加载失败
    */
    if (self.player.status == AVPlayerStatusReadyToPlay) {
        
        if (!sender.selected) {
            
            [self.player play];
            
            self.timer.fireDate = [NSDate distantPast];
        } else {
            
            [self.player pause];
            self.timer.fireDate = [NSDate distantFuture];
        }
        
        sender.selected = !sender.selected;
    }
  
}


- (AVPlayer *)player
{
    if (!_player) {
        
        // 播放在线音乐
        // NSURL *url = [NSURL URLWithString:@"http://tsmusic24.tc.qq.com/105569954.mp3"];
        
        // 播放本地音乐
        NSString *path = [[NSBundle mainBundle] pathForResource:@"张婧懿-玫瑰" ofType:@"mp3"];
        NSURL *url = [NSURL fileURLWithPath:path];
        
        // 1、直接播放URL
        // _player = [[AVPlayer alloc] initWithURL:url];
        
        // 2、使用播放项 AVPlayerItem 播放
        _player = [AVPlayer playerWithPlayerItem:self.playerItem];
        
        _player.volume = 0.5;
    }
    
    return _player;
}

// 创建播放项
- (AVPlayerItem *)playerItem
{
    NSURL *url = [NSURL URLWithString:@"http://tsmusic24.tc.qq.com/105569954.mp3"];
    _playerItem = [AVPlayerItem playerItemWithURL:url];
    
    // [AVPlayerItem playerItemWithAsset:<#(nonnull AVAsset *)#>]
    
    return _playerItem;
}


@end
