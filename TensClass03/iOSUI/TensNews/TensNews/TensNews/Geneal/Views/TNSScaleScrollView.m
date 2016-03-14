//
//  TNSScaleScrollView.m
//  TensNews
//
//  Created by Chen on 16/2/1.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "TNSScaleScrollView.h"
#import "Masonry.h"

@interface TNSScaleScrollView ()

@property (strong, nonatomic) UIView *contentView;      // 用来设置contentSize

/**
 *  初始化缩放视图
 */
- (void)initScaleScrollView;

/**
 *  图片单击事件
 */
- (void)tapGestureActions;

/**
 *  图片双击事件
 *
 *  @param gesture 双击手势
 */
- (void)scaleImageView:(UIGestureRecognizer *)gesture;

@end

@implementation TNSScaleScrollView


#pragma mark - Init

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initScaleScrollView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initScaleScrollView];
    }
    return self;
}

- (void)awakeFromNib {
    [self initScaleScrollView];
}


#pragma mark - Private

- (void)initScaleScrollView {
    
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
        make.width.height.equalTo(self);
    }];
    
    self.delegate = self;
    self.minimumZoomScale = 1;
    self.maximumZoomScale = 2;
    
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    
    UITapGestureRecognizer *multableTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scaleImageView:)];
        multableTap.numberOfTapsRequired = 2;
    
    [self addGestureRecognizer:multableTap];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureActions)];
    tap.numberOfTapsRequired = 1;

    [self.imageView addGestureRecognizer:tap];
    
    [self.contentView addSubview:self.imageView];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.leading.trailing.equalTo(self);
        make.height.equalTo(@180);
        make.centerY.equalTo(self).mas_offset(-40);
    }];
}


#pragma mark - IBActions

- (void)scaleImageView:(UIGestureRecognizer *)gesture {
    
    if (self.zoomScale == self.minimumZoomScale) {
        
        CGPoint point = [gesture locationInView:self];
        [self zoomToRect:CGRectMake(point.x, point.y, 10, 10) animated:YES];
    }
    else {
        [self setZoomScale:1 animated:YES];
    }
}

- (void)tapGestureActions {

    [[NSNotificationCenter defaultCenter] postNotificationName:kHiddenNavigationbarNotification object:nil];
}


#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

#pragma mark - Custom Accessors

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.userInteractionEnabled = YES;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
    }
    return _imageView;
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
    }
    return _contentView;
}

@end
