//
//  ViewController.m
//  UIScrollView
//
//  Created by Chen on 16/1/20.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "ViewController.h"
#import "ScrollView.h"

@interface ViewController ()
<UIScrollViewDelegate>
{
    ScrollView *_scrollView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _scrollView = [[ScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = YES; // 是否显示水平方向的滚动条
    _scrollView.showsVerticalScrollIndicator = YES;   // 是否显示垂直方向的滚动条
    
    _scrollView.pagingEnabled = YES;                  // 是否显示分页效果
    _scrollView.bounces = NO;                         // 是否有缓冲效果
    _scrollView.scrollEnabled = YES;                   // 是否可以滚动
    
    _scrollView.contentSize = CGSizeMake(320*2, 568*10);
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    view1.backgroundColor = [UIColor blueColor];
    
    [_scrollView addSubview:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, _scrollView.contentSize.height-10, 10, 10)];
    view2.backgroundColor = [UIColor blueColor];
    
    [_scrollView addSubview:view2];    
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(_scrollView.contentSize.width-10, 0, 10, 10)];
    view3.backgroundColor = [UIColor blueColor];
    
    [_scrollView addSubview:view3];
    
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(_scrollView.contentSize.width-10, _scrollView.contentSize.height-10, 10, 10)];
    view4.backgroundColor = [UIColor blueColor];
    
    [_scrollView addSubview:view4];

    
    _scrollView.backgroundColor = [UIColor greenColor];
    
    
    [self.view addSubview:_scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIScrollViewDelegate

// 即将拖动滚动视图
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"%s", __func__);
}

// 滚动视图滚动的时候调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSLog(@"%s", __func__);
}

// 将要结束拖拽时调用
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"%s", __func__);
}

// 结束拖动时调用 ,当手指离开后
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"%s", __func__);
}


// 视图滚动将要减速的时候调用
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    NSLog(@"%s", __func__);
}

// 视图结束减速是调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"%s", __func__);
    
    NSLog(@"当前是第%d屏", (int)(scrollView.contentOffset.y /568)+1);
}

@end
