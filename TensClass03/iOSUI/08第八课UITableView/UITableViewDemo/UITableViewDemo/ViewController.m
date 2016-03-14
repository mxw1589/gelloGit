//
//  ViewController.m
//  UITableViewDemo
//
//  Created by Chen on 16/1/22.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    tableView.allowsMultipleSelection = YES;
    
    tableView.dataSource = self;
    tableView.delegate = self;

    [self.view addSubview:tableView];
}


#pragma mark - UITableViewDataSource

// 返回section的个数 默认返回1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

// 返回section对应的cell个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 5;
    }
    else {
        return 7;
    }
}

// 创建cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /** 第一种cell系统样式 ,左边有一个label
    * 默认高度为44
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    cell.textLabel.text = [@(indexPath.row) stringValue];
    */
    
    /** 第二种cell系统样式 左边一个label,右边一个label
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@""];
    cell.textLabel.text = [@(indexPath.row) stringValue];
    cell.detailTextLabel.text = [@(indexPath.row) stringValue];
    */
    
    /** 第三种cell系统样式 左边一个label,右边有一个label紧挨着左边label
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@""];
    cell.textLabel.text = [@(indexPath.row) stringValue];
    cell.detailTextLabel.text = [@(indexPath.row) stringValue];
     */
    
    /** 第四种cell系统样式, 上边一个大label,下边一个小label
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@""];
    cell.textLabel.text = [@(indexPath.row) stringValue];
    cell.detailTextLabel.text = @"adf";
    */
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@""];
    cell.textLabel.text = [@(indexPath.section) stringValue];
    cell.detailTextLabel.text = [@(indexPath.row) stringValue];

    cell.imageView.image = [UIImage imageNamed:@"m_8_100"]; // cell左边的图片
//    cell.contentView  // 可以往cell里添加子view
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view.backgroundColor = [UIColor redColor];
    
    cell.backgroundView = view;    // cell的背景view,默认为nil
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view2.backgroundColor = [UIColor yellowColor];

    
    cell.selectedBackgroundView = view2;  // 选中cell后的背景view
    
    // 有两种样式,一种是选中后是灰色 ,一种是没有效果
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    
    cell.selected = YES;    // 设置cell为选中状态
    
    NSLog(@"%@", cell.selectedBackgroundView);
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"a";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @"z";
}


#pragma mark - UITableViewDelegate

// 返回cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 5) {
        return 80;
    }
    
    return 30;
}

// 设置header的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

// 设置footer的高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20;
}

// 选中cell后会调用的代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%ld", indexPath.row);
}

// 自定义headerView
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor darkTextColor];
    return view;
}

// 自定义footerView
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor orangeColor];
    
    return view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
