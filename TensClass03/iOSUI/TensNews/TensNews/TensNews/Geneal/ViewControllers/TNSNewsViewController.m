//
//  NewsViewController.m
//  TensNews
//
//  Created by Chen on 16/1/27.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "TNSNewsViewController.h"
#import "TNSNewsDetailViewController.h"
#import "TNSNewsTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "TNSCircleView.h"
#import "TNSBannerModel.h"
#import "TNSNewsModel.h"

@interface TNSNewsViewController ()
<UITableViewDelegate,
 UITableViewDataSource,
 TNSCircleViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet TNSCircleView *circleView;     // banner视图

@property (strong, nonatomic) NSMutableArray *banners;              // banner数据
@property (strong, nonatomic) NSMutableArray *news;                 // 新闻数据列表

@end

@implementation TNSNewsViewController


#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.circleView.delegate = self;
    self.circleView.banners = self.banners;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.circleView refreshScrollView];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

/**
 *  通过segue方式跳转式会调用这方法
 *
 *  @param segue  segue对象
 *  @param sender 事件触发者
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    NSIndexPath *indexPath = sender;
    TNSNewsModel *model = self.news[indexPath.row];
    
    TNSNewsDetailViewController *detail = segue.destinationViewController;
    detail.url = model.url;
}


#pragma mark - TNSCircleViewDelegate

- (void)circleView:(TNSCircleView *)circleView didSelectedAtIndex:(NSInteger)index {
    
    TNSNewsDetailViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:kPushToWebViewController];
    TNSBannerModel *model = self.banners[index];
    detail.url = model.url;
    
    [self.navigationController pushViewController:detail animated:YES];
}


#pragma mark - UITableViewDataSource && UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.news.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"cellIdentifier";
    TNSNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    TNSNewsModel *model = self.news[indexPath.row];
    NSURL *url = [NSURL URLWithString:model.imgsrc];
    [cell.iconImageView sd_setImageWithURL:url];
    cell.titleLabel.text = model.title;
    cell.detailLabel.text = model.digest;
    cell.countLabel.text = model.replay;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    /**
    // 第一种方式push
    TNSNewsDetailViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:kPushToWebViewController];
    
    [self.navigationController pushViewController:detail animated:YES];
     */
    
    // 第二种方式
    [self performSegueWithIdentifier:kSegueToWebViewController sender:indexPath];
}


#pragma mark - Custom Accessors

- (NSMutableArray *)banners {
    if (!_banners) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Banners" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
        _banners = [NSMutableArray array];
        
        for (NSDictionary *dictionary in array) {
            TNSBannerModel *model = [[TNSBannerModel alloc] initWithDictionary:dictionary];
            [_banners addObject:model];
        }
    }
    return _banners;
}

- (NSMutableArray *)news {
    if (!_news) {
        _news = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"HomeNewsData.txt" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        for (NSDictionary *dictionary in array) {
            TNSNewsModel *model = [[TNSNewsModel alloc] initWithDictionary:dictionary];
            [_news addObject:model];
        }
    }
    return _news;
}

@end
