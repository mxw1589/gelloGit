//
//  MainViewController.m
//  CALayerDemo
//
//  Created by Chen on 15/7/14.
//  Copyright (c) 2015年 Wet. All rights reserved.
//

#import "MainViewController.h"
#import "DetailViewController.h"

@interface MainViewController ()
<UITableViewDelegate,
UITableViewDataSource>

@property (strong, nonatomic) NSArray *cellTitles;

@end

@implementation MainViewController


#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.cellTitles count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                            forIndexPath:indexPath];
    cell.textLabel.text = self.cellTitles[indexPath.row];
    
    return cell;
}


#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LayerType type = indexPath.row;
    
    DetailViewController *detail = [[DetailViewController alloc] init];
    detail.type = type;
    [self.navigationController pushViewController:detail animated:YES];
}


#pragma mark - Custom Accessors

-(NSArray *)cellTitles {
    if (_cellTitles == nil) {
        _cellTitles = @[@"CAShapeLayer",
                        @"CATextLayer",
                        @"CAGradientLayer",
                        @"CAEmitterLayer",
                        @"AVPlayerLayer"];
    }
    return _cellTitles;
}

@end
