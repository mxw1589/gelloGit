//
//  ViewController.m
//  UITableViewDemo2
//
//  Created by Chen on 16/1/22.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITableViewDelegate,
UITableViewDataSource>
{
    UITableView *_tableView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    CGRect frame = self.view.bounds;
    frame.origin.y = 50;
    
    _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];

    _tableView.separatorColor = [UIColor blackColor];
    
//    UITableViewCellSeparatorStyleNone,
//    UITableViewCellSeparatorStyleSingleLine,
//    UITableViewCellSeparatorStyleSingleLineEtched
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
//    tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    // 重新加载数据
//    [_tableView reloadData];
    
    // 重新加载section的titles
//    [_tableView reloadSectionIndexTitles];
    
//    CGRect frame = [_tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:4]];

//    for (int i=0; i<1000000; i++) {
//        
//        NSInteger random = arc4random()%1000000;
//        
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:random inSection:0];
//            
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
//
//            });
//        });
//    }
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%s", __func__);
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1 创建重用标识符
    NSString *cellIdentifier = [@(111) stringValue];
    
    // 2 通过重用标识符去重用池里边取cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // 如果cell为nil则重新创建一个cell并设置重用标识符
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        NSLog(@"----");
    }
    
    cell.textLabel.text = [@(indexPath.row) stringValue];


    // 切记,重用机制只是重用cell的UI,所以我们应该每次都重新赋值
    
    
//    if (indexPath.row % 3 == 0) {
////        cell.textLabel.text = @"AAAAA";
//    }
//    else {
//        NSLog(@"--- %@ --", cell.textLabel.text);
//    }
//    
////    cell.textLabel.text = [@(indexPath.row) stringValue];
////    NSLog(@"row1 == %ld", indexPath.row);
//
//    NSLog(@"row2 == %ld", indexPath.row);
    
    return cell;
}


#pragma mark - UITableViewDelegate


@end
