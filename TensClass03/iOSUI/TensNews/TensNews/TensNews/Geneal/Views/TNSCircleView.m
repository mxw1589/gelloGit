//
//  TNSCircleView.m
//  TensNews
//
//  Created by Chen on 16/1/28.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "TNSCircleView.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "TNSBannerModel.h"

//第三方注册插件 https://github.com/onevcat/VVDocumenter-Xcode

#define kBaseTag 100

@interface TNSCircleView ()
<UIScrollViewDelegate> {
    NSInteger _pageCount;   // banner总量
}

@property (strong, nonatomic) UIScrollView *scrollView;     // 根scrollView
@property (strong, nonatomic) UIView *contentView;          // 容器view,用来设置contentSize

@property (strong, nonatomic) UIView *alphaView;            // 半透明的背景view
@property (strong, nonatomic) UILabel *titleLabel;          // banner的标题
@property (strong, nonatomic) UIPageControl *pageControl;   // 分页控制器

@property (strong, nonatomic) UIImageView *leftImageView;   // 左边的图片
@property (strong, nonatomic) UIImageView *centerImageView; // 中间的图片
@property (strong, nonatomic) UIImageView *rightImageView;  // 右边的图片

@property (assign, nonatomic) NSInteger lastPage;           // 上一页
@property (assign, nonatomic) NSInteger currentPage;        // 当前面
@property (assign, nonatomic) NSInteger nextPage;           // 下一页

/**
 *  加载CircleView
 */
- (void)loadCircleView;

/**
 *  加载滚动的控件
 */
- (void)loadScrollView;

/**
 *  设置子视图的布局
 */
- (void)setupSubviewLayout;

/**
 *  创建imageView对象
 *
 *  @return imageView对象
 */
- (UIImageView *)createImageView;

/**
 *  设置单个图片的内容
 *
 *  @param imageView 图片视图
 *  @param model     数据源
 */
- (void)setImageView:(UIImageView *)imageView model:(TNSBannerModel *)model;

/**
 *  图片点击事件
 *
 *  @param tap 单击手势
 */
- (void)pictureViewOnClicked:(UITapGestureRecognizer *)tap;

@end

@implementation TNSCircleView


#pragma mark - Init

- (void)awakeFromNib {
    [self loadCircleView];
}


#pragma mark - Private

- (void)loadCircleView {
    [self loadScrollView];
    [self addSubview:self.alphaView];
    [self.alphaView addSubview:self.titleLabel];
    [self.alphaView addSubview:self.pageControl];
    [self setupSubviewLayout];
    
    self.scrollView.contentOffset = CGPointMake(kScreenWidth, 0);
}

- (void)loadScrollView {
    
    [self addSubview:self.scrollView];
    
    [self.scrollView addSubview:self.contentView];
    [self.contentView addSubview:self.leftImageView];
    [self.contentView addSubview:self.centerImageView];
    [self.contentView addSubview:self.rightImageView];
}

- (void)setupSubviewLayout {
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.height.equalTo(self.scrollView);
    }];
   
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.bottom.width.equalTo(self.scrollView);
    }];
    
    [self.centerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.leftImageView.mas_trailing);
        make.top.bottom.width.equalTo(self.scrollView);
    }];
    
    [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.centerImageView.mas_trailing);
        make.top.bottom.width.equalTo(self.scrollView);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.rightImageView.mas_trailing);
    }];
    
    [self.alphaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(self);
        make.height.equalTo(@20);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@10);
        make.centerY.equalTo(self.alphaView);
        make.width.equalTo(self.alphaView.mas_width).mas_offset(-100);
    }];
    
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(@10);
        make.centerY.equalTo(self.alphaView);
        make.width.equalTo(@100);
    }];
}

- (void)setImageView:(UIImageView *)imageView model:(TNSBannerModel *)model {
    NSURL *url = [NSURL URLWithString:model.imageURLString];
    [imageView sd_setImageWithURL:url];
}

- (UIImageView *)createImageView {
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.userInteractionEnabled = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(pictureViewOnClicked:)];
    [imageView addGestureRecognizer:tap];
    return imageView;
}


#pragma mark - Public

- (void)refreshScrollView {
    
    TNSBannerModel *model = self.banners[self.currentPage];
    self.titleLabel.text = model.title;
    self.pageControl.currentPage = self.currentPage;
    
    [self setImageView:self.leftImageView   model:self.banners[self.lastPage]];
    [self setImageView:self.centerImageView model:model];
    [self setImageView:self.rightImageView  model:self.banners[self.nextPage]];

    self.scrollView.contentOffset = CGPointMake(kScreenWidth, 0);
}


#pragma mark - IBActions

- (void)pictureViewOnClicked:(UITapGestureRecognizer *)tap {
    
    if ([self.delegate respondsToSelector:@selector(circleView:didSelectedAtIndex:)]) {
        [self.delegate circleView:self
               didSelectedAtIndex:self.currentPage];
    }
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    if (scrollView.contentOffset.x == 0) {
        self.currentPage = (_pageCount + --self.currentPage) % _pageCount;
        [self refreshScrollView];
    }
    
    if (scrollView.contentOffset.x == kScreenWidth*2) {
        self.currentPage = ++self.currentPage % _pageCount;
        [self refreshScrollView];
    }
}


#pragma mark - Custom Accessors

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.backgroundColor = [UIColor whiteColor];
    }
    return _scrollView;
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
    }
    return _contentView;
}

- (UIView *)alphaView {
    if (!_alphaView) {
        _alphaView = [[UIView alloc] init];
        _alphaView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.3];
    }
    return _alphaView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _titleLabel;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    }
    return _pageControl;
}

- (UIImageView *)leftImageView {
    
    if (!_leftImageView) {
        _leftImageView = [self createImageView];
    }
    
    return _leftImageView;
}

- (UIImageView *)centerImageView {
    
    if (!_centerImageView) {
        _centerImageView = [self createImageView];
    }
    return _centerImageView;
}

- (UIImageView *)rightImageView {
    if (!_rightImageView) {
        _rightImageView = [self createImageView];
    }
    return _rightImageView;
}

- (NSInteger)lastPage {
    return (_pageCount + self.currentPage-1) % _pageCount;
}

- (NSInteger)nextPage {
    return (self.currentPage+1) % _pageCount;
}

- (void)setBanners:(NSArray *)banners {
    _banners = banners;
    _pageCount = _banners.count;
    self.pageControl.numberOfPages = _pageCount;
}


@end
