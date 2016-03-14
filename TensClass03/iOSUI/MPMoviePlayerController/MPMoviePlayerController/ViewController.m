//
//  ViewController.m
//  MPMoviePlayerController
//
//  Created by Chen on 16/2/17.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController () {
    MPMoviePlayerController *_player;
    MPMoviePlayerViewController *player2;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"http://flv2.bn.netease.com/videolib3/1508/17/BaHbn5587/SD/BaHbn5587-mobile.mp4"];

    player2 = [[MPMoviePlayerViewController alloc] initWithContentURL:url
                                           ];
    
    
    /**
    _player = [[MPMoviePlayerController alloc] initWithContentURL:url];

    // 播放界面
    _player.view.frame = CGRectMake(20, 20, 280, 528);

    // 背景view
    _player.backgroundView.backgroundColor = [UIColor purpleColor];
    
    // 视频的播放状态
    NSLog(@"%ld", (long)_player.playbackState);
        
    // 控制面板样式
    _player.controlStyle = MPMovieControlStyleEmbedded;
    
    // 循环播放模式
    _player.repeatMode = MPMovieRepeatModeNone;
    
    // 视频内容的缩放模式
    _player.scalingMode = MPMovieScalingModeAspectFill;
    
    [self.view addSubview:_player.view];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(test:) name:MPMoviePlayerScalingModeDidChangeNotification object:nil];
     */
}

- (void)test:(NSNotification *)notify {
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];

    [self presentMoviePlayerViewControllerAnimated:player2];

    
    
//    [_player play];
    
//    [_player setFullscreen:YES animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
