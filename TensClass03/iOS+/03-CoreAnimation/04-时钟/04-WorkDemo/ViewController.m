//
//  ViewController.m
//  04-WorkDemo
//
//  Created by qinglinfu on 16/2/23.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"

#define HourAnlge   M_PI * 2 / 12.0 // 每小时旋转的弧度
#define MinuteAnlge M_PI * 2 / 60.0 // 每分钟旋转的弧度
#define SecondAngle M_PI * 2 / 60.0 // 每秒旋转的弧度

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *hourImageView;
@property (weak, nonatomic) IBOutlet UIImageView *minuteImageView;
@property (weak, nonatomic) IBOutlet UIImageView *secondImageView;
@property (strong, nonatomic)NSDateComponents *dateComponents;
@property (strong, nonatomic)NSCalendar *calendar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTimeViews];
    [self setTimeAngle];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(setTimeAngle) userInfo:nil repeats:YES];
}

#pragma mark - 设置旋转锚点
- (void)setTimeViews
{
    self.hourImageView.layer.anchorPoint = CGPointMake(0.5, 0.88);
    self.minuteImageView.layer.anchorPoint = CGPointMake(0.5, 0.88);
    self.secondImageView.layer.anchorPoint = CGPointMake(0.5, 0.88);
}

#pragma mark - 设置时刻的旋转角度
- (void)setTimeAngle
{
    float minuteAngle = self.dateComponents.minute * MinuteAnlge;
    float secondAngle = self.dateComponents.second * SecondAngle;
    float hourAngle = self.dateComponents.hour * HourAnlge;
    hourAngle += self.dateComponents.minute  * (M_PI / 6.0) / 60.0;
    
    self.hourImageView.layer.transform = CATransform3DMakeRotation(hourAngle, 0, 0, 1);
    self.minuteImageView.layer.transform = CATransform3DMakeRotation(minuteAngle, 0, 0, 1);
    self.secondImageView.layer.transform = CATransform3DMakeRotation(secondAngle, 0, 0, 1);
    
}

#pragma mark - 获取时间组成部分
- (NSDateComponents *)dateComponents
{
    if (!_calendar) {
        // 日历类，用于获取对应的日期
        _calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
     }
        // 获取日期的组成部分
    _dateComponents = [_calendar components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond  fromDate:[NSDate date]];
    
    return _dateComponents;
}



@end
