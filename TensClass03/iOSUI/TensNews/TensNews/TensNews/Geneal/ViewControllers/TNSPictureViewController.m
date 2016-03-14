//
//  PictureViewController.m
//  TensNews
//
//  Created by Chen on 16/1/27.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "TNSPictureViewController.h"
#import "TNSPictureModel.h"
#import "TNSPictureDetailModel.h"
#import "TNSPictureTableViewCell.h"
#import "TNSPictureDetailViewController.h"

@interface TNSPictureViewController ()
 <UITableViewDelegate,
 UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *pictureNews;
@property (strong, nonatomic) NSMutableArray *pictureDetailNews;

@end

@implementation TNSPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource && UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.pictureNews.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TNSPictureModel *model = self.pictureNews[indexPath.row];
    NSString *identifier;
    switch (model.picType) {
        case 1: {
            identifier = @"reuseIdentifier1";
            break;
        }
        case 2: {
            identifier = @"reuseIdentifier2";
            break;
        }
        default: {
            identifier = @"reuseIdentifier3";
        }
    }
    
    TNSPictureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.model = self.pictureNews[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 第一种方式计算
    TNSPictureModel *model = self.pictureNews[indexPath.row];
    
    /**
    Size: 限定文本的大小
    options: 计算的方式
     attributes: 文字的参数
     context: nil
     */
    

    
    CGSize size = CGSizeMake(kScreenWidth-20, CGFLOAT_MAX);
    CGRect frame = [model.desc boundingRectWithSize:size
                             options:NSStringDrawingUsesLineFragmentOrigin
                          attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12]} context:nil];
    CGFloat labelHeight = CGRectGetHeight(frame);
    
    return labelHeight + 260;
    
    /**
    
    // 第二种方式计算高度
    TNSPictureModel *model = self.pictureNews[indexPath.row];
    NSString *identifier;
    switch (model.picType) {
        case 1: {
            identifier = @"reuseIdentifier1";
            break;
        }
        case 2: {
            identifier = @"reuseIdentifier2";
            break;
        }
        default: {
            identifier = @"reuseIdentifier3";
        }
    }
    
    TNSPictureTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
    cell.model = model;
    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    return size.height+1;
     */
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TNSPictureDetailViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:kPushToPictureDetailViewController];
    detail.model = self.pictureDetailNews[indexPath.row];
    
    [self.navigationController pushViewController:detail animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - Custom Accessors

- (NSMutableArray *)pictureNews {
    if (!_pictureNews) {
        _pictureNews = [NSMutableArray array];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"PictureNews" ofType:@"txt"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        NSError *error;
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        if (error) {
            NSLog(@"解析错误");
            return nil;
        }
        
        for (NSDictionary *dictionary in array) {
            TNSPictureModel *model = [[TNSPictureModel alloc] initWithDictionary:dictionary];
            [_pictureNews addObject:model];
        }
    }
    return _pictureNews;
}

- (NSMutableArray *)pictureDetailNews {
    if (!_pictureDetailNews) {
        _pictureDetailNews = [NSMutableArray array];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"PictureNewsDetailData" ofType:nil];
        
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        for (NSDictionary *dict in array) {
            TNSPictureDetailModel *model = [[TNSPictureDetailModel alloc] initWithDictionary:dict];
            [_pictureDetailNews addObject:model];
            
            
        }
    }
    return _pictureDetailNews;
}

@end
