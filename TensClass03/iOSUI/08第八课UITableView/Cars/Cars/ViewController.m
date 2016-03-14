//
//  ViewController.m
//  Cars
//
//  Created by Chen on 16/1/23.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITableViewDataSource,
UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *carInfo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.tableView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGRect frame = self.view.bounds;
    frame.origin.y = 20;
    frame.size.height -= 20;
    self.tableView.frame = frame;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource && UITableViewDelegate

// 返回section的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.carInfo.count;
}

// 返回每个section对应的cell数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSArray *cars = self.carInfo[section][@"cars"];
    
    return cars.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 第一步, 从创建一个重用标识符
    static NSString *identifier = @"cellIdentifier";
    
    // 第二步, 先从重用池里去取cell,如果没有就创建一个cell
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
            cell.layoutMargins = UIEdgeInsetsZero;
        }
    }
    
    // 第三步, 设置cell

    NSArray *item = self.carInfo[indexPath.section][@"cars"];
    NSDictionary *info = item[indexPath.row];
    cell.textLabel.text = info[@"name"];
//    cell.imageView.image = [UIImage imageNamed:info[@"icon"]];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    NSString *title = self.carInfo[section][@"title"];
    
    NSArray *array = [self.carInfo valueForKey:@"title"];
    
    return array[section];
}


#pragma mark - Custom Accessors

// 懒加载tableView
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 60;
        _tableView.separatorInset = UIEdgeInsetsZero;
        _tableView.layoutMargins = UIEdgeInsetsZero;
    }
    return _tableView;
}

- (NSArray *)carInfo {
    if (!_carInfo) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_all" ofType:@"plist"];
        _carInfo = [NSArray arrayWithContentsOfFile:path];
    }
    return _carInfo;
}

@end
