//
//  ViewController.m
//  UITableView的常规使用
//
//  Created by Chen on 16/1/23.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@property (strong, nonatomic) NSMutableArray *data;

@property (strong, nonatomic) UIButton *insertButton;
@property (strong, nonatomic) UIButton *deleteButton;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.insertButton];
    [self.view addSubview:self.deleteButton];
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.view.frame = CGRectMake(0, 0, 100, 100);
    
    self.insertButton.frame = CGRectMake(0, 0, 140, 50);
    self.deleteButton.frame = CGRectMake(180, 0, 140, 50);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    self.data[0] = @"100";
    self.data[1] = @"123";
    
    //    [self.tableView reloadData]; // 刷新所有数据
    
    /**
     NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
     NSIndexPath *indexPath2 = [NSIndexPath indexPathForRow:1 inSection:0];
     
     // 刷新指定行
     [self.tableView reloadRowsAtIndexPaths:@[indexPath, indexPath2] withRowAnimation:UITableViewRowAnimationMiddle];
     */
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationMiddle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBActions

- (void)insertButtonOnClicked:(UIButton *)button {
    
    int random = arc4random() % self.data.count;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:random inSection:0];
    
    
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    
    [self.tableView beginUpdates];
    
    [self.data insertObject:@"abc" atIndex:random];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    
    [self.tableView endUpdates];
}

- (void)deleteButtonOnClicked:(UIButton *)button {
    
    int random = arc4random() % self.data.count;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:random inSection:0];
    
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    
    [self.tableView beginUpdates];
    
    [self.data removeObjectAtIndex:random];
    
    [self.tableView deleteRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationRight];
    
    [self.tableView endUpdates];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"%s", __func__);
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __func__);
    
    /** 从重用池里取cell有两种方式
     * 第一种dequeueReusableCellWithIdentifier , 不需要提前注册cell
     * 第二种dequeueReusableCellWithIdentifier:forIndexPath 要注册cell
     */
    static NSString *cellIdentifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = self.data[indexPath.row];
    
    return cell;
}

-(NSMutableArray *)data {
    if (!_data) {
        _data = [NSMutableArray array];
        
        for (int i=0; i<30; i++) {
            //            int random = arc4random()%10000;
            [_data addObject:[@(i) stringValue]];
        }
    }
    return _data;
}

- (UIButton *)insertButton {
    if (!_insertButton) {
        _insertButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_insertButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_insertButton setTitle:@"随机增加一行" forState:UIControlStateNormal];
        [_insertButton addTarget:self action:@selector(insertButtonOnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _insertButton;
}

- (UIButton *)deleteButton {
    if (!_deleteButton) {
        _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_deleteButton setTitle:@"随机删除一行" forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(deleteButtonOnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _deleteButton;
}


@end
