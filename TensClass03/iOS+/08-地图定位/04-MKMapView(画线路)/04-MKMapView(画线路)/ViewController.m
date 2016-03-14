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
@property (nonatomic, assign)CLLocationCoordinate2D *coordinates;
@property (nonatomic, assign)NSInteger coordinateCount;
@property (nonatomic, strong)CLGeocoder *geocoder;
@property (nonatomic, copy)void (^geoCoderCompletionHandler)(NSString *addressName);


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    [self mapView];
    
    // 设置经纬度数据的大小
    self.coordinateCount = 10;
    
}

#pragma mark - 添加标注视图
- (void)addAnnotation:(UILongPressGestureRecognizer *)longReg
{
    static int index = 0;
    if (longReg.state == UIGestureRecognizerStateBegan) {
        
        CGPoint touchPoint = [longReg locationInView:_mapView];
        CLLocationCoordinate2D coordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
        
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        annotation.coordinate = coordinate;
        annotation.title = @"位置查询中...";
        annotation.subtitle = [NSString stringWithFormat:@"%f, %f",annotation.coordinate.latitude, annotation.coordinate.longitude];
        
        [self setGeoCoderCompletionHandler:^(NSString *address) {
            
            annotation.title = address;
        }];
        
        
        if (index < self.coordinateCount ) {
            
            // 将经纬度保存到数组
            self.coordinates[index] = coordinate;
            
            if (index == self.coordinateCount - 1) {
                
                [self drawLineOnMap:self.coordinates withCount:self.coordinateCount];
                
                // 释放经纬度数组
                free(self.coordinates);
                self.coordinates = nil;
                
            }
            
            index++;
        }
        
        [self geoCoder:coordinate];
        
        [self.mapView addAnnotation:annotation];
    }
}

#pragma mark - 地图上画线
// 创建经纬度的数据
- (CLLocationCoordinate2D *)coordinates
{
    if (!_coordinates) {
        
        _coordinates = (CLLocationCoordinate2D *)malloc(sizeof(CLLocationCoordinate2D) * _coordinateCount);
    }
    return _coordinates;
}


- (void)drawLineOnMap:(CLLocationCoordinate2D *)coordinates withCount:(NSInteger)count
{
    MKPolyline *polyline = [MKPolyline polylineWithCoordinates:coordinates count:count];
    
    [self.mapView addOverlay:polyline];
}


#pragma mark - 地理位置编码、反编码
- (CLGeocoder *)geocoder
{
    if (!_geocoder) {
        
        _geocoder = [[CLGeocoder alloc] init];
    }
    return _geocoder;
}

- (void)geoCoder:(CLLocationCoordinate2D)coordinate
{
    // 1、通过地理名称查询地理位置（经纬度）
    /*
    [self.geocoder geocodeAddressString:@"天府广场" completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if (!error) {
            
            NSLog(@"----%f",[placemarks lastObject].location.coordinate.latitude);
        } else{
            
            NSLog(@"查询地理位置失败：%@",error);
        }
    }];
    */
    
    // 2、通过地理位置获取地理名称
    CLLocation *location = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if (!error) {
            
            NSLog(@"%@",[placemarks lastObject].name);
            NSString *addressName = [placemarks lastObject].name;
            
            if (self.geoCoderCompletionHandler) {
                
                _geoCoderCompletionHandler(addressName);
            }
            
        } else {
            
            NSLog(@"%@",error);
        }
    }];
}


#pragma mark - <MKMapViewDelegate>
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D center = userLocation.location.coordinate;
    MKCoordinateSpan span = {0.05,0.05};
    MKCoordinateRegion region = {center, span};
    [mapView setRegion:region animated:YES];
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if (![annotation isKindOfClass:[MKPointAnnotation class]]) {
        return nil;
    }
    
    static NSString *indentify = @"newAnnotation";
    MKAnnotationView *annotationView = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:indentify];
    
    if (!annotationView) {
        
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:indentify];
        
        annotationView.canShowCallout = YES;
        annotationView.image = [UIImage imageNamed:@"icon.png"];
        annotationView.centerOffset = CGPointMake(0, -25);
        
    }
    return annotationView;
}

// 添加了覆盖层后调用的协议方法，在里面进行图形、路径的绘制
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    NSLog(@"rendererForOverlay");
    
    // 绘制线路
    MKPolylineRenderer *polylineView = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    polylineView.strokeColor = [UIColor redColor];
    polylineView.lineWidth = 5;
    
    return polylineView;
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
