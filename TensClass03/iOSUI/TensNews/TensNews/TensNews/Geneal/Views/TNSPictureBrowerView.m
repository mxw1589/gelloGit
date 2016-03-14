//
//  TNSPictureBrowerView.m
//  TensNews
//
//  Created by Chen on 16/2/1.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "TNSPictureBrowerView.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "TNSPictureDetailModel.h"
#import "TNSScaleScrollView.h"

#define kBaseTag 100

@interface TNSPictureBrowerView ()
<UIScrollViewDelegate> {
    NSInteger _pageCount;   // 图片总数
}

@property (strong, nonatomic) UIScrollView *scrollView;     // 主scrollView
@property (strong, nonatomic) UIView *contentView;          // 用来设置scrollView的contentSize

@property (strong, nonatomic) UILabel *titleLabel;          // 标题
@property (strong, nonatomic) UILabel *pageCountLabel;      // 第几张图片
@property (strong, nonatomic) UITextView *textView;         // 描述信息

@property (strong, nonatomic) TNSScaleScrollView *leftImageView;        // 左边图片
@property (strong, nonatomic) TNSScaleScrollView *centerImageView;      // 中间图片
@property (strong, nonatomic) TNSScaleScrollView *rightImageView;       // 右边图片

@property (assign, nonatomic) NSInteger lastPage;                       // 上一页
@property (assign, nonatomic) NSInteger currentPage;                    // 当前页
@property (assign, nonatomic) NSInteger nextPage;                       // 下一页

/**
 *  加载pictureBrowerView
 */
- (void)loadCircleView;

/**
 *  加载主scrollView
 */
- (void)loadScrollView;

/**
 *  设置子view的布局
 */
- (void)setupSubviewLayout;

/**
 *  创建imageView对象
 *
 *  @return imageView对象
 */
- (TNSScaleScrollView *)createImageView;

/**
 *  图片点击事件
 *
 *  @param tap 单击手势
 */
- (void)pictureViewOnClicked:(UITapGestureRecognizer *)tap;

/**
 *  设置单个图片的内容
 *
 *  @param imageView 图片视图
 *  @param model     数据源
 */
- (void)setImageView:(TNSScaleScrollView *)scaleScrollView model:(TNSPhotoModel *)model;

@end

@implementation TNSPictureBrowerView


#pragma mark - Init

- (void)awakeFromNib {
    [self loadCircleView];
}


#pragma mark - Private

- (void)loadCircleView {
    
    [self loadScrollView];
    [self addSubview:self.alphaView];
    [self.alphaView addSubview:self.titleLabel];
    [self.alphaView addSubview:self.pageCountLabel];
    [self.alphaView addSubview:self.textView];
    
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
        make.leading.height.width.equalTo(self.scrollView);
    }];
    
    [self.centerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.leftImageView.mas_trailing);
        make.height.width.equalTo(self.leftImageView);
    }];
    
    [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.centerImageView.mas_trailing);
        make.height.width.equalTo(self.centerImageView);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.rightImageView.mas_trailing);
    }];
    
    [self.alphaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(self);
        make.height.equalTo(@150);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.equalTo(@10);
        make.trailing.equalTo(self.alphaView).mas_offset(-50);
    }];
    
    [self.pageCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.trailing.equalTo(self.alphaView).mas_offset(-10);
    }];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.titleLabel);
        make.trailing.equalTo(self.alphaView).mas_offset(-10);
        make.bottom.equalTo(self.alphaView);
        make.top.equalTo(self.titleLabel.mas_bottom).mas_offset(8);
    }];
}

- (void)setImageView:(TNSScaleScrollView *)scaleScrollView model:(TNSPhotoModel *)model {
    NSURL *url = [NSURL URLWithString:model.imgurl];
    [scaleScrollView.imageView sd_setImageWithURL:url];
}

- (TNSScaleScrollView *)createImageView {
    TNSScaleScrollView *imageView = [[TNSScaleScrollView alloc] init];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pictureViewOnClicked:)];
    [_leftImageView addGestureRecognizer:tap];
    return imageView;
}


#pragma mark - Public

- (void)refreshScrollView {
    
    self.centerImageView.zoomScale = 1;
    
    TNSPhotoModel *model = self.model.photos[self.currentPage];
    
    self.titleLabel.text = self.model.setname;
    self.pageCountLabel.text = [NSString stringWithFormat:@"%ld/%ld",self.currentPage+1, _pageCount];
    self.textView.text = model.note;
    
    [self setImageView:self.leftImageView   model:self.model.photos[self.lastPage]];
    [self setImageView:self.centerImageView model:model];
    [self setImageView:self.rightImageView  model:self.model.photos[self.nextPage]];
    
    self.scrollView.contentOffset = CGPointMake(kScreenWidth, 0);
}


#pragma mark - IBActions

- (void)pictureViewOnClicked:(UITapGestureRecognizer *)tap {
    
    if ([self.delegate respondsToSelector:@selector(pictureBrowerView:didSelectedAtIndex:)]) {
        [self.delegate pictureBrowerView:self didSelectedAtIndex:self.currentPage];
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
        _contentView.backgroundColor = [UIColor blackColor];
    }
    return _contentView;
}

- (UIView *)alphaView {
    if (!_alphaView) {
        _alphaView = [[UIView alloc] init];
        _alphaView.backgroundColor = [UIColor blackColor];
    }
    return _alphaView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:18];
    }
    return _titleLabel;
}

- (UILabel *)pageCountLabel {
    if (!_pageCountLabel) {
        _pageCountLabel = [[UILabel alloc] init];
        _pageCountLabel.backgroundColor = [UIColor clearColor];
        _pageCountLabel.textColor = [UIColor whiteColor];
        _pageCountLabel.font = [UIFont systemFontOfSize:16];
    }
    return _pageCountLabel;
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] init];
        _textView.editable = NO;
        _textView.font = [UIFont systemFontOfSize:16];
        _textView.textColor = [UIColor whiteColor];
        _textView.backgroundColor = [UIColor blackColor];
    }
    return _textView;
}



- (TNSScaleScrollView *)leftImageView {
    
    if (!_leftImageView) {
        _leftImageView = [self createImageView];
    }
    
    return _leftImageView;
}

- (TNSScaleScrollView *)centerImageView {
    
    if (!_centerImageView) {
        _centerImageView = [self createImageView];
    }
    return _centerImageView;
}

- (TNSScaleScrollView *)rightImageView {
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

- (void)setModel:(TNSPictureDetailModel *)model {
    _model = model;
    _pageCount = _model.photos.count;
    
}


@end
