//
//  ViewController.m
//  05-视频播放
//
//  Created by qinglinfu on 16/3/12.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

// iOS 9.0后停止更新,如果要适配7.0就要使用这个
@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;

// iOS 8.0以后使用这个
@property (nonatomic, strong) AVPlayerViewController *avPlayerVC;


@property (nonatomic, strong) AVPlayerLayer *playerLayer;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)playMovie:(id)sender {
    
    // 系统版本判断
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        
        
        // [self presentViewController:self.avPlayerVC animated:YES completion:NULL];
        // [self.avPlayerVC.player play];
        
        [self.playerLayer.player play];
        
    } else{
        
        [self moviePlayer];
        [self.moviePlayer play];
    }

}

#pragma mark - 8.0前使用的
- (MPMoviePlayerController *)moviePlayer
{
    if (!_moviePlayer) {
        
        NSURL *url = [NSURL URLWithString:@"http://vf3.mtime.cn/Video/2015/07/24/mp4/150724094629421714.mp4"];
        _moviePlayer = [[MPMoviePlayerController alloc] init];
        _moviePlayer.contentURL = url;
        
        _moviePlayer.view.frame = CGRectMake(20, 100, 300, 200);
        _moviePlayer.shouldAutoplay = YES;
        
        _moviePlayer.controlStyle = MPMovieControlStyleEmbedded;
        
        [_moviePlayer prepareToPlay];
        
        [self.view addSubview:_moviePlayer.view];
    }
    
    return _moviePlayer;
}


#pragma mark - 8.0后使用的视频播放
- (AVPlayerViewController *)avPlayerVC
{
    if (!_avPlayerVC) {
        
        _avPlayerVC = [[AVPlayerViewController alloc] init];
        
        NSURL *url = [NSURL URLWithString:@"http://vf3.mtime.cn/Video/2015/07/24/mp4/150724094629421714.mp4"];
        AVPlayer *player = [AVPlayer playerWithURL:url];
        
        _avPlayerVC.player = player;
    }
    
    return _avPlayerVC;
}

-(void)xx{
    AVPlayer *player = [[AVPlayer alloc]init];

    
}


- (AVPlayerLayer *)playerLayer
{
    if (!_playerLayer) {

        
        _playerLayer = [[AVPlayerLayer alloc] init];
        _playerLayer.bounds = CGRectMake(0, 0, 300, 300);
        _playerLayer.position = self.view.center;
        _playerLayer.backgroundColor = [UIColor blackColor].CGColor;
        _playerLayer.cornerRadius = 150;
        
        NSURL *url = [NSURL URLWithString:@"http://vf3.mtime.cn/Video/2015/07/24/mp4/150724094629421714.mp4"];
        AVPlayer *player = [AVPlayer playerWithURL:url];
        _playerLayer.player = player;
        
        [self.view.layer addSublayer:_playerLayer];
        
    }
    return _playerLayer;
}




@end
