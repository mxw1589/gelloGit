//
//  MeViewController.m
//  TensNews
//
//  Created by Chen on 16/1/27.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "TNSMeViewController.h"

@interface TNSMeViewController ()
<UITableViewDataSource,
UITableViewDelegate> {
    NSArray *_titles;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

/**
 *  计算缓存大小
 *
 *  @return 缓存大小
 */
- (NSString *)calcCacheSize;

/**
 *  清除缓存
 */
- (void)clearCache;

@end

@implementation TNSMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titles = @[@"离线下载", @"夜间模式", @"头条推荐", @"仅Wi-Fi下载图片", @"正文字号", @"清除缓存"];
    
    [self calcCacheSize];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Private

- (NSString *)calcCacheSize {

    // 获取沙盒路径下的缓存文件夹路径
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    
    // 该类主要就是对沙盒里的文件进行一些读取操作
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // 获取缓存目录下的所有文件夹路径
    NSArray *subCachePath = [fileManager subpathsAtPath:cachePath];
    
    double totalcachesize = 0;
    
    for (NSString *path in subCachePath) {
        NSString *tempPath = [cachePath stringByAppendingPathComponent:path];

        NSDictionary *dict = [fileManager attributesOfItemAtPath:tempPath error:nil];

        totalcachesize += [dict[NSFileSize] doubleValue];
    }
    
    return [NSString stringWithFormat:@"%.1fM", totalcachesize/1024/1024];
}

- (void)clearCache {
    // 获取沙盒路径下的缓存文件夹路径
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    
    // 该类主要就是对沙盒里的文件进行一些读取操作
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // 获取缓存目录下的所有文件夹路径
    NSArray *subCachePath = [fileManager subpathsAtPath:cachePath];
    
    for (NSString *path in subCachePath) {
        NSString *tempPath = [cachePath stringByAppendingPathComponent:path];
        
        [fileManager removeItemAtPath:tempPath error:nil];
    }
    
    [self.tableView reloadData];
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    else {
        return _titles.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier;
    if (indexPath.section == 0) {
        identifier = @"reuseIdentifier3";
    }
    else {
     
        if (indexPath.row == 0 || indexPath.row == 4 || indexPath.row == 5) {
            identifier = @"reuseIdentifier1";
        }
        else {
            identifier = @"reuseIdentifier2";
        }
    }

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    
    if (indexPath.section == 1) {
        cell.textLabel.text = _titles[indexPath.row];
        
        if (indexPath.row == 5) {
            cell.detailTextLabel.text = [self calcCacheSize];
        }
        else {
            cell.detailTextLabel.text = @"";
        }
        
        if (indexPath.row == 0 || indexPath.row == 4) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 40;
    }
    else {
        return 60;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 30;
    }
    else {
        return 40;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 5) {
        [self clearCache];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
