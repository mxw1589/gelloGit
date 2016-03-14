//
//  ViewController.m
//  UITableView的常规使用
//
//  Created by Chen on 16/1/23.
//  Copyright © 2016年 Weit. All rights reserved.
//


/*****  TableView的编辑操作
 
 */

#import "ViewController.h"

@interface ViewController ()
<UITableViewDelegate,
UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    
    [self setupNavigationBar];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGRect frame = self.view.bounds;
//    frame.origin.y = 50;
//    frame.size.height -= 50;
    self.tableView.frame = frame;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions 

- (void)rightBarButtonOnClicked:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        [self.tableView setAllowsMultipleSelectionDuringEditing:YES];
        [self.tableView setEditing:YES animated:YES];
        self.navigationItem.leftBarButtonItem.customView.hidden = NO;
    }
    else {
        [self.tableView setEditing:NO animated:YES];
        self.navigationItem.leftBarButtonItem.customView.hidden = YES;
    }
}

- (void)leftBarButtonOnClicked:(UIButton *)sender {
 
    NSArray *indexPaths = self.tableView.indexPathsForSelectedRows;
    
    for (NSIndexPath *indexPath in indexPaths) {
        [self.data removeObjectAtIndex:indexPath.row];
    }
    
    [self.tableView beginUpdates];
    
    [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self.tableView endUpdates];
}


#pragma mark - Private

- (void)setupNavigationBar {
 
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 45, 45);
    [rightButton setTitle:@"编辑" forState:UIControlStateNormal];
    [rightButton setTitle:@"完成" forState:UIControlStateSelected];
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightBarButtonOnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item =
    [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = item;
    
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 45, 45);
    [leftButton setTitle:@"删除" forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftBarButtonOnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.leftBarButtonItem.customView.hidden = YES;
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellIdentifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = self.data[indexPath.row];
    
    return cell;
}


#pragma mark - 添加删除表格

// 设置左边按钮的样式 ,添加或删除
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row%2 == 0) {
        return UITableViewCellEditingStyleDelete;
    }
    else {
        return UITableViewCellEditingStyleInsert;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.data removeObjectAtIndex:indexPath.row];
        
        [tableView beginUpdates];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [tableView endUpdates];
    }
    
    if (editingStyle == UITableViewCellEditingStyleInsert) {
        [self.data insertObject:@"abc" atIndex:indexPath.row+1];
        
        [tableView beginUpdates];
        
        NSIndexPath *index = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:0];
        [tableView insertRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        [tableView endUpdates];
    }
}


#pragma mark - 移动cell

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return NO;
    }
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    if (destinationIndexPath.row == 0) {
        destinationIndexPath = [NSIndexPath indexPathForRow:1 inSection:0];
        
        [self performSelector:@selector(changeFirestcellAndSecondCell) withObject:nil afterDelay:0];
    }
    
    [self.data exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
}

- (void)changeFirestcellAndSecondCell {
    
    NSIndexPath *destinationIndexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    NSIndexPath *sourceIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];

    [self.tableView moveRowAtIndexPath:destinationIndexPath toIndexPath:sourceIndexPath];

}


#pragma mark - Custom Accessors


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

-(NSMutableArray *)data {
    if (!_data) {
        _data = [[UIFont familyNames] mutableCopy];
    }
    return _data;
}

@end
