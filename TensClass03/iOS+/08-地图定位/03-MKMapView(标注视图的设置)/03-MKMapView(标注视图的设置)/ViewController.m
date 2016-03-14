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
    if (![annotation isKindOfClass:[MKPointAnnotation class]]) {
        return nil;
    }
    
    // 自定义标注视图并且复用
    static NSString *indentify = @"newAnnotation";
    MKAnnotationView *annotationView = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:indentify];
    
    if (!annotationView) {
        
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:indentify];
      
        // 是否可以显示标注的辅助视图,前提是设置了annotation的title
        annotationView.canShowCallout = YES;
        
        // 设置标注的图片
        annotationView.image = [UIImage imageNamed:@"icon.png"];
        
        // 设置标注视图中心点的偏移
        annotationView.centerOffset = CGPointMake(0, -25);
        
        // 设置标注弹出视图的偏移
        annotationView.calloutOffset = CGPointMake(20, 0);
        
        // 设置左边的辅助视图
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftButton.bounds = CGRectMake(0, 0, 50, 50);
        [leftButton setImage:[UIImage imageNamed:@"头像.jpg"] forState:UIControlStateNormal];
        annotationView.leftCalloutAccessoryView = leftButton;
        
        // 设置右边的辅助视图
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
        annotationView.rightCalloutAccessoryView = rightButton;
        
        // 是否可以拖拽
        annotationView.draggable = YES;
        
    }
    
    return annotationView;
}

// 拖拽了标注视图后调用的方法
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState
{
    if (newState == MKAnnotationViewDragStateEnding) {
        MKPointAnnotation *annotation = (MKPointAnnotation *)view.annotation;
        NSLog(@"拖拽了标注视图！%f, %f",annotation.coordinate.latitude,annotation.coordinate.longitude);
        annotation.subtitle = [NSString stringWithFormat:@"N:%f, E:%f",annotation.coordinate.latitude,annotation.coordinate.longitude];
    }
}

// 点击了left、right赋值视图时调用
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    NSLog(@"点击了赋值视图 %@",control);
}

// 点击了标注视图时调用
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    NSLog(@"点击标注视图");
}

// 地图的显示的范围将要改变是调用
- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
}

// 地图显示的范围改变后调用
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    
}

// 定位失败时调用
- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error
{
    
}

// 地图完成加载后调用
- (void)mapViewDidFinishRenderingMap:(MKMapView *)mapView fullyRendered:(BOOL)fullyRendered
{
    
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
