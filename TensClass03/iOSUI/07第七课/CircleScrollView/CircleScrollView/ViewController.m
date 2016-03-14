//
//  ViewController.m
//  CircleScrollView
//
//  Created by Chen on 16/1/22.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "ViewController.h"

#define kScreenWidth    CGRectGetWidth([[UIScreen mainScreen] bounds])
#define kBaseTag 100

@interface ViewController ()
<UIScrollViewDelegate> {
    NSInteger _pageCount;
}


@property (strong, nonatomic) NSMutableArray *images;
@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) UIImageView *leftImageView;
@property (strong, nonatomic) UIImageView *centerImageView;
@property (strong, nonatomic) UIImageView *rightImageView;

@property (assign, nonatomic) NSInteger lastPage;
@property (assign, nonatomic) NSInteger currentPage;
@property (assign, nonatomic) NSInteger nextPage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.scrollView];
    [self loadScrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Private

- (void)loadScrollView {
    
    _pageCount = 5;
    
    [self.scrollView addSubview:self.leftImageView];
    [self.scrollView addSubview:self.centerImageView];
    [self.scrollView addSubview:self.rightImageView];
    
    [self refreshScrollView];
    
    self.scrollView.contentOffset = CGPointMake(kScreenWidth, 0);
}

- (void)refreshScrollView {
 
    self.leftImageView.image = self.images[self.lastPage];
    self.centerImageView.image = self.images[self.currentPage];
    self.rightImageView.image = self.images[self.nextPage];
}

/**
 *  把所有View往左边移动
 */
- (void)moveAllViewToLeft {
    
    [self refreshScrollView];

    self.scrollView.contentOffset = CGPointMake(kScreenWidth, 0);
}

/**
 *  把所有View往右边移动
 */
- (void)moveAllViewToRight {
//    
//    self.currentPage ++;
    [self refreshScrollView];

    self.scrollView.contentOffset = CGPointMake(kScreenWidth, 0);
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    NSLog(@"%f %f", scrollView.contentOffset.x ,targetContentOffset->x);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    if (scrollView.contentOffset.x == 0) {
        self.currentPage = (_pageCount + --self.currentPage) % _pageCount;
        [self moveAllViewToLeft];
    }
    
    if (scrollView.contentOffset.x == 750) {

        self.currentPage = ++self.currentPage % _pageCount;
        [self moveAllViewToRight];
    }
    
//    NSLog(@"%ld %ld %ld", self.lastPage, self.currentPage, self.nextPage);
}

#pragma mark - Custom Accessors

- (NSMutableArray *)images {
    if (!_images) {
        _images = [NSMutableArray array];
        for (int i=0; i<5; i++) {
            NSString *name = [@(i) stringValue];
            UIImage *image = [UIImage imageNamed:name];
            [_images addObject:image];
        }
    }
    return _images;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        CGSize size = self.view.bounds.size;
        size.width *= 3;
        _scrollView.contentSize = size;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return _scrollView;
}

- (NSInteger)lastPage {
    return (_pageCount + self.currentPage-1) % _pageCount;
}

- (NSInteger)nextPage {
    return (self.currentPage+1) % _pageCount;
}

- (UIImageView *)leftImageView {
    
    _leftImageView = [self.scrollView viewWithTag:kBaseTag];
    if (!_leftImageView) {
        CGRect frame = self.scrollView.bounds;
        _leftImageView = [[UIImageView alloc] initWithFrame:frame];
        _leftImageView.tag = kBaseTag;
    }

    return _leftImageView;
}

- (UIImageView *)centerImageView {
    
    _centerImageView = [self.scrollView viewWithTag:kBaseTag+1];
    if (!_centerImageView) {
        CGRect frame = self.scrollView.bounds;
        frame.origin.x = kScreenWidth;
        _centerImageView = [[UIImageView alloc] initWithFrame:frame];
        _centerImageView.tag = kBaseTag+1;
    }
    return _centerImageView;
}

- (UIImageView *)rightImageView {
    _rightImageView = [self.scrollView viewWithTag:kBaseTag+2];
    if (!_rightImageView) {
        CGRect frame = self.scrollView.bounds;
        frame.origin.x = kScreenWidth*2;
        _rightImageView = [[UIImageView alloc] initWithFrame:frame];
        _rightImageView.tag = kBaseTag+2;
    }
    return _rightImageView;
}

@end
