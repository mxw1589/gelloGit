//
//  ViewController.m
//  02-MKMapView(添加标注)
//
//  Created by qinglinfu on 16/3/9.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController ()<MKMapViewDelegate>
@property (nonatomic, strong)MKMapView *mapView;

@property (nonatomic, strong)CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    [self mapView];
    
}

#pragma mark - 添加标注视图
- (void)addAnnotation:(UILongPressGestureRecognizer *)longReg
{
    if (longReg.state == UIGestureRecognizerStateBegan) {
        NSLog(@"添加了标注");

        // 将触摸点的坐标转为对应的经纬度
        CGPoint touchPoint = [longReg locationInView:_mapView];
        CLLocationCoordinate2D coordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
        
        // 创建标注
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        annotation.coordinate = coordinate;

        annotation.title = @"xxxxxx路";
        annotation.subtitle = [NSString stringWithFormat:@"%f, %f",annotation.coordinate.latitude, annotation.coordinate.longitude];
        
        // 添加标注到地图中
        [self.mapView addAnnotation:annotation];
    }
}

#pragma mark - <MKMapViewDelegate>
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D center = userLocation.location.coordinate;
    MKCoordinateSpan span = {0.05,0.05};
    MKCoordinateRegion region = {center, span};
    [mapView setRegion:region animated:YES];
}

// 添加标注后调用的协议方法
- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray<MKAnnotationView *> *)views
{
    NSLog(@"添加了一个标注视图！");
}

// 点击一个标注后调用，通常在这个方法中自定义标注视图
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
     NSLog(@"----%@",annotation);
    
    // 如果是当前用户的标注就返回nil,就会显示用户的标注类型
    if (![annotation isKindOfClass:[MKPointAnnotation class]]) {
       return nil;
    }

    // 自定义标注视图并且复用
    static NSString *indentify = @"newAnnotation";
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:indentify];
    
    if (!annotationView) {
        
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:indentify];
        // 修改大头针的颜色
        annotationView.pinTintColor = [UIColor greenColor];
        
        // 是否可以显示标注的辅助视图
        annotationView.canShowCallout = YES;
        
        // 显示标注时是否有动画效果
        annotationView.animatesDrop = YES;
    }
    
    return annotationView;
}




#pragma  mark - 创建地图和定位
- (MKMapView *)mapView
{
    if (!_mapView) {
        
        _mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
        _mapView.mapType = MKMapTypeStandard;
        _mapView.delegate = self;
        _mapView.showsUserLocation = YES;
        
        UILongPressGestureRecognizer *longReg = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(addAnnotation:)];
        longReg.minimumPressDuration = 0.3;
        [_mapView addGestureRecognizer:longReg];
        
        [self.view addSubview:_mapView];
    }
    
    return _mapView;
}

- (CLLocationManager *)locationManager
{
    if (!_locationManager) {
        
        _locationManager = [[CLLocationManager alloc] init];
        
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = 10;
    }
    return _locationManager;
}


@end
