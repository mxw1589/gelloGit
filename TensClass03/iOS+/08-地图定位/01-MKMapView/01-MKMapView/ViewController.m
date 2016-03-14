//
//  ViewController.m
//  01-MKMapView
//
//  Created by qinglinfu on 16/3/9.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic)CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initMapView];
}

- (CLLocationManager *)locationManager
{
    if (!_locationManager) {
        
        _locationManager = [[CLLocationManager alloc] init];
        
        // 30.551796, 104.072853 在模拟器中设置经纬度
        /*1、设置定位的精准度:
         kCLLocationAccuracyBestForNavigation
         kCLLocationAccuracyBest
         kCLLocationAccuracyNearestTenMeters
         kCLLocationAccuracyHundredMeters
         kCLLocationAccuracyKilometer
         kCLLocationAccuracyThreeKilometers
         */
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        // 2、设置定位更新的距离
        _locationManager.distanceFilter = 10;
    }
    
    return _locationManager;
    
}


- (void)initMapView
{
    /*
     地图样式：
     
     MKMapTypeStandard = 0, 平面地图
     MKMapTypeSatellite, 卫星地图
     MKMapTypeHybrid, 混合地图
     */
    self.mapView.mapType = MKMapTypeStandard;
    
    // 是否显示用户当前位置
    self.mapView.showsUserLocation = YES;
    
    // 设置代理
    self.mapView.delegate = self;
    

    // 2、iOS 8.0 后要设置定位权限，在info.plist 文件中添加 NSLocationWhenInUseUsageDescription（前台定位） 或者 NSLocationAlwaysUsageDescription（前台后台都允许定位） ,并调用如下方法授权：
    
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
         [self.locationManager requestWhenInUseAuthorization];
    }
}


#pragma mark - <MKMapViewDelegate>

// 用户位置发生改变后掉
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"用户位置更新！");
    // 设置中心点
    CLLocationCoordinate2D center = userLocation.location.coordinate;
    // 设置地图跨度
    MKCoordinateSpan span = {0.05,0.05};
    MKCoordinateRegion region = {center, span};
    // 设置地图的范围，包含中心点和跨度
    [mapView setRegion:region animated:YES];
}

@end
