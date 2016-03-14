//
//  ViewController.m
//  03-AVAudioPalyer(播放本地音频)
//
//  Created by qinglinfu on 16/3/11.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()<AVAudioPlayerDelegate>

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (weak, nonatomic) IBOutlet UISlider *progressView;
@property (weak, nonatomic) IBOutlet UISlider *soundValue;
@property (weak, nonatomic) IBOutlet UIButton *playButton;

@property (strong, nonatomic)NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateAudioTime) userInfo:nil repeats:YES];
    self.timer.fireDate = [NSDate distantFuture];
    
    // 开启远程控制事件, （耳机控制、锁屏时的信息显示）
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self becomeFirstResponder];
    
}

- (void)updateAudioTime
{
    self.progressView.value = self.audioPlayer.currentTime;
}

- (IBAction)progressChange:(UISlider *)sender {
    
    self.audioPlayer.currentTime = sender.value;
}

- (IBAction)soundValueChange:(UISlider *)sender {
    
    self.audioPlayer.volume = sender.value;
}


- (IBAction)playAudioAction:(UIButton *)sender {
    
    if (!sender.selected) {
        
        [self.audioPlayer play];
        
        self.timer.fireDate = [NSDate distantPast];
        
    } else
    {
        [self.audioPlayer pause];
        self.timer.fireDate = [NSDate distantFuture];

    }
    
    sender.selected = !sender.selected;
    
}


- (AVAudioPlayer *)audioPlayer
{
    if (!_audioPlayer) {
        
        // 设置后台播放，先要在info.plist 文件中添加 Required background modes项并且添加item: App plays audio or streams audio/video using AirPlay
        AVAudioSession *session = [[AVAudioSession alloc] init];
        [session setActive:YES error:nil];
        [session setCategory:AVAudioSessionCategoryPlayback error:nil];
        
    
        NSString *path = [[NSBundle mainBundle] pathForResource:@"贰佰-狗日的青春" ofType:@"mp3"];
        NSURL *url = [NSURL fileURLWithPath:path];
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        _audioPlayer.delegate = self;
        self.progressView.maximumValue = _audioPlayer.duration;
        _audioPlayer.volume = 0.5;
    
        [_audioPlayer prepareToPlay];
        
        
        [self showAudioInfo];
    }
    
    return _audioPlayer;
}

#pragma mark - 锁屏时显示信息
- (void)showAudioInfo
{
    NSMutableDictionary *audioInfo = [NSMutableDictionary dictionary];
    [audioInfo setObject:@"贰佰-狗日的青春" forKey:MPMediaItemPropertyTitle];
    [audioInfo setObject:@"贰佰" forKey:MPMediaItemPropertyArtist];
    [audioInfo setObject:@(self.audioPlayer.duration) forKey:MPMediaItemPropertyPlaybackDuration];
    
    MPMediaItemArtwork *artwork = [[MPMediaItemArtwork alloc] initWithImage:[UIImage imageNamed:@"贰佰.jpg"]];
    [audioInfo setObject:artwork forKey:MPMediaItemPropertyArtwork];
    
    
    MPNowPlayingInfoCenter *infoCenter = [MPNowPlayingInfoCenter defaultCenter];
    [infoCenter setNowPlayingInfo:audioInfo];
}

#pragma mark - 远程控制事件
- (void)remoteControlReceivedWithEvent:(UIEvent *)event
{
    switch (event.subtype) {
        case UIEventSubtypeRemoteControlTogglePlayPause:
            
            NSLog(@"单击了耳机！");
            
            [self.playButton sendActionsForControlEvents:UIControlEventTouchUpInside];
            break;
            
        case UIEventSubtypeRemoteControlNextTrack:
            
            NSLog(@"按两下");
            break;
            
        case UIEventSubtypeRemoteControlPreviousTrack:
            NSLog(@"按三下");
            break;
            
        default:
            break;
    }
}


@end
