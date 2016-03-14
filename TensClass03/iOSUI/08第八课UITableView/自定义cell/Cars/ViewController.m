//
//  ViewController.m
//  Cars
//
//  Created by Chen on 16/1/23.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "ViewController.h"

#import "CustomCell1.h"
#import "CustomCell2.h"
#import "CustomCell3.h"

@interface ViewController ()
<UITableViewDataSource,
UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITableView *tableView2;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self.view addSubview:self.tableView];
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

// 返回每个section对应的cell数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}


/**
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 第一种方式自定义cell, 重用性高, 纯代码,工作效率低
    
    // 第一步, 从创建一个重用标识符
    static NSString *identifier = @"cellIdentifier";
    
    // 第二步, 先从重用池里去取cell,如果没有就创建一个cell
    CustomCell1 *cell =
    [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[CustomCell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
            cell.layoutMargins = UIEdgeInsetsZero;
        }
    }
    
    cell.label.text = [@(indexPath.row) stringValue];
    
    cell.icon.backgroundColor = [UIColor redColor];
    
    // 第三步, 设置cell

    return cell;
}
 
 */

/**
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 第二种方式自定义cell, 重用性高, 使用xib来创建控件,效率高,使用最多
    
    // 第一步, 从创建一个重用标识符
    static NSString *identifier = @"cellIdentifier";
    
    // 第二步, 先从重用池里去取cell,如果没有就创建一个cell
    CustomCell2 *cell =
    [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        //cell = (CustomCell2 *)[[[NSBundle mainBundle] loadNibNamed:@"CustomCell2" owner:nil options:nil] lastObject];
 
        // 会进行内存缓存
        UINib *nib = [UINib nibWithNibName:@"CustomCell2" bundle:nil];
        
        [tableView registerNib:nib forCellReuseIdentifier:identifier];
        
        cell =  [[nib instantiateWithOwner:nil options:nil] lastObject];
        
        NSLog(@"_____________");

    cell.icon.backgroundColor = [UIColor redColor];
    cell.titleLabel.text = [@(indexPath.row) stringValue];
    
    cell.detailLabel.text = @"abc";
    cell.dateLabel.text = [[NSDate date] description];

    // 第三步, 设置cell
    
    return cell;
}
*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CustomCell3 *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier2" forIndexPath:indexPath];
    
    cell.icon.backgroundColor = [UIColor redColor];
    cell.titleLabel.text = [@(indexPath.row) stringValue];
    
    cell.detailLabel.text = @"abc";
    cell.dateLabel.text = [[NSDate date] description];
    
    return cell;
}


#pragma mark - Custom Accessors

// 懒加载tableView
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 90;
        _tableView.separatorInset = UIEdgeInsetsZero;
        _tableView.layoutMargins = UIEdgeInsetsZero;
    }
    return _tableView;
}

@end
