//
//  VideoViewController.m
//  TensNews
//
//  Created by Chen on 16/1/27.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "TNSVideoViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "TNSVideoModel.h"
#import "TNSVideoCell.h"
#import "UIImageView+WebCache.h"

@interface TNSVideoViewController ()

@property (copy, nonatomic) NSMutableArray *data;

@end

@implementation TNSVideoViewController


#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource && UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.data.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"reuseIdentifier";
    TNSVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    TNSVideoModel *model = self.data[indexPath.row];
    
    cell.titleLabel.text = model.title;
    [cell.pictureImageView sd_setImageWithURL:model.cover];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TNSVideoModel *model = self.data[indexPath.row];
    NSURL *url = [NSURL URLWithString:model.mp4_url];
    
    MPMoviePlayerViewController *player = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    
    [self presentMoviePlayerViewControllerAnimated:player];
}

#pragma mark - Custom Accessors

- (NSMutableArray *)data {
    if (!_data) {
        _data = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"VideoNews" ofType:nil];
        
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        NSError *error;
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        if (error) {
            NSLog(@"解析错误");
            return nil;
        }
        
        for (NSDictionary *dict in array) {
            TNSVideoModel *model = [[TNSVideoModel alloc] initWithDictionary:dict];
            [_data addObject:model];
        }
    }
    
    return _data;
}

@end
