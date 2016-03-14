//
//  ViewController.m
//  TensMusic
//
//  Created by Chen on 16/1/15.
//  Copyright © 2016年 Weit. All rights reserved.
//

/**
 1. 先搭建UI ok
 2. 写逻辑代码
   2.1 播放进度的拖动
   2.2 上一曲,下一曲
   2.3 播放
 */

#import "ViewController.h"

#import <AVFoundation/AVFoundation.h>

#import "UIView+Addition.h"

@interface ViewController () {
    int _currentIndex;
}

@property (strong, nonatomic) UIImageView *backgroundImageView; // 背景图片
@property (strong, nonatomic) UILabel *titleLabel;              // 标题
@property (strong, nonatomic) UIButton *menuButton;             // 菜单
@property (strong, nonatomic) UIImageView *musicImageView;      // 音乐大图
@property (strong, nonatomic) UIButton *downLoadButton;         // 下载
@property (strong, nonatomic) UIButton *collectButton;          // 收藏
@property (strong, nonatomic) UILabel *actorLabel;              // 演员
@property (strong, nonatomic) UILabel *beginLabel;              // 开始时间
@property (strong, nonatomic) UILabel *endLabel;                // 结束时间
@property (strong, nonatomic) UISlider *musicSlider;            // 音乐进度
@property (strong, nonatomic) UIButton *playModeButton;         // 播放模式
@property (strong, nonatomic) UIButton *lastButton;             // 上一首
@property (strong, nonatomic) UIButton *playButton;             // 播放
@property (strong, nonatomic) UIButton *nextButton;             // 下一首
@property (strong, nonatomic) UIButton *shareButton;            // 分享

@property (strong, nonatomic) NSArray *musicList;               // 音乐列表
@property (strong, nonatomic) AVAudioPlayer *audioPlay;         // 播放对象

@property (strong, nonatomic) NSTimer *timer;                   // 一直获取播放的进度

/**
 *  准备播放音乐
 */
- (void)preparePlay;

/**
 *  加载子视图
 */
- (void)viewDidLoadSubViews;

/**
 *  设置子视图的位置
 */
- (void)setupSubViewsFrame;

/**
 *  获取音乐的进度赋值给slider
 */
- (void)getMusicCurrentTimer;

/**
 *  格式化时间字符串
 *
 *  @param duration 播放时长
 *
 *  @return 字符串类型的时长
 */
- (NSString *)formatterEndTimeWithDuration:(NSTimeInterval)duration;

/**
 *  播放按钮的点击事件
 */
- (void)playButtonOnClicked:(UIButton *)sender;

/**
 *  拖动slider后改变音乐的播放进度
 */
- (void)sliderValueChangeAction:(UISlider *)slider;

/**
 *  播放下一曲
 */
- (void)nextButtonOnClicked:(UIButton *)sender;

@end

@implementation ViewController


#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    // 加载子视图
    [self viewDidLoadSubViews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self preparePlay];
}

// view的布局将要改变
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
 
    [self setupSubViewsFrame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (void)playButtonOnClicked:(UIButton *)sender {
   
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.timer.fireDate = [NSDate distantPast];
        [self.audioPlay play];
    }
    else {
        [self.audioPlay pause];
        self.timer.fireDate = [NSDate distantFuture];
    }
}

- (void)nextButtonOnClicked:(UIButton *)sender {
    
    if (sender == self.nextButton) {
        // 让currentIndex 在 0-6之间循环
        _currentIndex = ++_currentIndex % self.musicList.count;
    }
    else {
        // 让currentIndex 在6-0之间循环
        _currentIndex = ((int)self.musicList.count + --_currentIndex)%self.musicList.count;
    }
    
    self.audioPlay = nil;
    [self preparePlay];
    
    self.playButton.selected = NO;
    [self.playButton sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)getMusicCurrentTimer {
    
    self.musicSlider.value = self.audioPlay.currentTime;
    self.beginLabel.text = [self formatterEndTimeWithDuration:self.audioPlay.currentTime];
    NSLog(@"%s", __func__);
}

- (void)sliderValueChangeAction:(UISlider *)slider {
    
    self.audioPlay.currentTime = slider.value;
}

#pragma mark - Private

- (void)viewDidLoadSubViews {
    [self.view addSubview:self.backgroundImageView];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.menuButton];
    [self.view addSubview:self.musicImageView];
    [self.view addSubview:self.downLoadButton];
    [self.view addSubview:self.actorLabel];
    [self.view addSubview:self.collectButton];
    [self.view addSubview:self.beginLabel];
    [self.view addSubview:self.musicSlider];
    [self.view addSubview:self.endLabel];
    [self.view addSubview:self.playModeButton];
    [self.view addSubview:self.lastButton];
    [self.view addSubview:self.playButton];
    [self.view addSubview:self.nextButton];
    [self.view addSubview:self.shareButton];
}

- (void)setupSubViewsFrame {
    
    CGFloat viewWidth = CGRectGetWidth(self.view.frame);
    CGFloat viewHeight = CGRectGetHeight(self.view.frame);
    
    self.backgroundImageView.frame = self.view.bounds;
    self.titleLabel.frame = CGRectMake(40, 30, viewWidth-80, 40);
    self.menuButton.frame = CGRectMake(viewWidth-37, 10, 42, 42);
    self.musicImageView.frame = CGRectMake(45, 75, viewWidth-90, 340);
    self.downLoadButton.frame = CGRectMake(45, self.musicImageView.bottom+5, 42, 42);
    self.actorLabel.frame = CGRectMake(45+42+5, 0, viewWidth - 184, 30);
    self.actorLabel.bottom = self.downLoadButton.bottom;
    self.collectButton.frame = CGRectMake(viewWidth -87, self.musicImageView.bottom+5, 42, 42);
    self.beginLabel.frame =  CGRectMake(5, viewHeight - 102, 60, 20);
    self.musicSlider.frame = CGRectMake(70,  viewHeight - 97, viewWidth-140, 10);
    self.endLabel.frame = CGRectMake(viewWidth-65, viewHeight - 102, 60, 20);
    self.playModeButton.frame = CGRectMake(5, viewHeight - 72, 42, 42);
    self.lastButton.frame = CGRectMake(57, viewHeight - 72, 42, 42);
    self.playButton.frame = CGRectMake(viewWidth/2-42, viewHeight - 75, 84, 50);
    self.nextButton.frame = CGRectMake(viewWidth - 99, viewHeight - 72, 42, 42);
    self.shareButton.frame = CGRectMake(viewWidth-47, viewHeight - 72, 42, 42);
}

- (void)preparePlay {
 
    NSDictionary *musicInfo = self.musicList[_currentIndex];
    NSString *musicName = musicInfo[@"name"];
    NSString *actor = musicInfo[@"actor"];
    NSString *imageName = musicInfo[@"imageName"];
    self.titleLabel.text = musicName;
    self.actorLabel.text = actor;
    self.musicImageView.image = [UIImage imageNamed:imageName];
    self.beginLabel.text = @"00:00";
    self.endLabel.text = [self formatterEndTimeWithDuration:self.audioPlay.duration];
    self.musicSlider.maximumValue = self.audioPlay.duration;
}

- (NSString *)formatterEndTimeWithDuration:(NSTimeInterval)duration {
    
    int m = duration/60;
    int s = (int)duration%60;
    NSString *string = [NSString stringWithFormat:@"%02d:%02d", m, s];
    return string;
}

#pragma mark - Custom Accessors

- (NSArray *)musicList {
    if (!_musicList) {
        NSString *musicPath = [[NSBundle mainBundle] pathForResource:@"MusicInfo.plist" ofType:nil];
        _musicList = [NSArray arrayWithContentsOfFile:musicPath];
    }
    return _musicList;
}

- (AVAudioPlayer *)audioPlay {
    if (!_audioPlay) {
        NSDictionary *musicInfo = self.musicList[_currentIndex];
        
        // 创建路径url
        NSString *musicName = musicInfo[@"name"];
        NSString *audioPath = [[NSBundle mainBundle] pathForResource:musicName ofType:@"mp3"];
        NSURL *url = [NSURL fileURLWithPath:audioPath];
        
        if (url == nil) {
            NSLog(@"音乐不存在");
            return nil;
        }
        
        NSError *error;
        
        // 创建播放对象
        _audioPlay = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        if (error) {
            NSLog(@"创建播放对象错误,请稍后再试");
            return nil;
        }
        
        // 准备播放
        [_audioPlay prepareToPlay];
    }
    return _audioPlay;
}

- (NSTimer *)timer {
    if (_timer == nil) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(getMusicCurrentTimer) userInfo:nil repeats:YES];
        _timer.fireDate = [NSDate distantFuture];
    }
    return _timer;
}

- (UIImageView *)backgroundImageView {
    if (_backgroundImageView == nil) {
        UIImage *image = [UIImage imageNamed:@"img.png"];
        
        _backgroundImageView = [[UIImageView alloc] initWithImage:image];
    }
    return _backgroundImageView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.text = @"标题.png";
    }
    return _titleLabel;
}

- (UIButton *)menuButton {
    if (!_menuButton) {
        _menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_menuButton setImage:[UIImage imageNamed:@"42e"]
                     forState:UIControlStateNormal];
    }
    return _menuButton;
}

- (UIImageView *)musicImageView {
    if (!_musicImageView) {
        _musicImageView = [[UIImageView alloc] init];
        _musicImageView.backgroundColor = [UIColor redColor];
    }
    return _musicImageView;
}

- (UIButton *)downLoadButton {
    if (!_downLoadButton) {
        _downLoadButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_downLoadButton setImage:[UIImage imageNamed:@"xz"]
                         forState:UIControlStateNormal];
    }
    return _downLoadButton;
}

- (UIButton *)collectButton {
    if (!_collectButton) {
        _collectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_collectButton setImage:[UIImage imageNamed:@"liked"] forState:UIControlStateNormal];
    }
    return _collectButton;
}

- (UILabel *)actorLabel {
    if (!_actorLabel) {
        _actorLabel = [[UILabel alloc] init];
        _actorLabel.font = [UIFont systemFontOfSize:16];
        _actorLabel.textColor = [UIColor whiteColor];
        _actorLabel.textAlignment = NSTextAlignmentCenter;
        _actorLabel.text = @"歌手";
    }
    return _actorLabel;
}

- (UILabel *)beginLabel {
    if (!_beginLabel) {
        _beginLabel = [[UILabel alloc] init];
        _beginLabel.font = [UIFont systemFontOfSize:12];
        _beginLabel.textAlignment = NSTextAlignmentCenter;
        _beginLabel.textColor = [UIColor whiteColor];
        _beginLabel.text = @"00:00";
    }
    return _beginLabel;
}

- (UILabel *)endLabel {
    if (!_endLabel) {
        _endLabel = [[UILabel alloc] init];
        _endLabel.font = [UIFont systemFontOfSize:12];
        _endLabel.textAlignment = NSTextAlignmentCenter;
        _endLabel.textColor = [UIColor whiteColor];
        _endLabel.text = @"00:00";
    }
    return _endLabel;
}

- (UISlider *)musicSlider {
    if (!_musicSlider) {
        _musicSlider = [[UISlider alloc] init];
        [_musicSlider setMinimumTrackImage:[UIImage imageNamed:@"volleft"]
                                  forState:UIControlStateNormal];
        [_musicSlider setMaximumTrackImage:[UIImage imageNamed:@"volright"] forState:UIControlStateNormal];
        [_musicSlider setThumbImage:[UIImage imageNamed:@"voldrag"]
                           forState:UIControlStateNormal];
        [_musicSlider addTarget:self
                         action:@selector(sliderValueChangeAction:)
               forControlEvents:UIControlEventValueChanged];
    }
    return _musicSlider;
}

- (UIButton *)playModeButton {
    if (!_playModeButton) {
        _playModeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playModeButton setImage:[UIImage imageNamed:@"shunxv3"]
                   forState:UIControlStateNormal];
    }
    return _playModeButton;
}

- (UIButton *)lastButton {
    if (!_lastButton) {
        _lastButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_lastButton setImage:[UIImage imageNamed:@"play4"]
                     forState:UIControlStateNormal];
        [_lastButton addTarget:self
                        action:@selector(nextButtonOnClicked:)
              forControlEvents:UIControlEventTouchUpInside];
    }
    return _lastButton;
}

- (UIButton *)playButton {
    if (!_playButton) {
        _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playButton setImage:[UIImage imageNamed:@"play3"] forState:UIControlStateNormal];
        [_playButton setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateSelected];
        [_playButton setBackgroundImage:[UIImage imageNamed:@"play2"]
                               forState:UIControlStateNormal];
        [_playButton addTarget:self
                        action:@selector(playButtonOnClicked:)
              forControlEvents:UIControlEventTouchUpInside];
    }
    return _playButton;
}

- (UIButton *)nextButton {
    if (!_nextButton) {
        _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextButton setImage:[UIImage imageNamed:@"play5"]
                     forState:UIControlStateNormal];
        [_nextButton addTarget:self
                        action:@selector(nextButtonOnClicked:)
              forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _nextButton;
}

- (UIButton *)shareButton {
    if (!_shareButton) {
        _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareButton setImage:[UIImage imageNamed:@"42x42"]
                      forState:UIControlStateNormal];
    }
    return _shareButton;
}

@end
