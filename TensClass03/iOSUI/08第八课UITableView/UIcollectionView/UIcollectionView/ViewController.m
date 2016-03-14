//
//  ViewController.m
//  UIcollectionView
//
//  Created by Chen on 16/1/25.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionViewCell.h"

#define kItemIdentifier @"itemIdentifier"

@interface ViewController ()
<UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.collectionView];
    
    // 把cell添加到重用池
    
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"itemIdentifier"];
    UINib *nib = [UINib nibWithNibName:@"CustomCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:nib
          forCellWithReuseIdentifier:kItemIdentifier];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.collectionView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kItemIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [@(indexPath.row) stringValue];

    cell.backgroundColor = [UIColor yellowColor];
    
    return cell;
}

#pragma mark - Custom Accessors

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical; // 设置collectionView的滑动方向
        layout.itemSize = CGSizeMake((320-20)/3, 50);       // 设置item的大小来显示item的列数
        layout.minimumInteritemSpacing = 0;     // 设置列间距
        layout.minimumLineSpacing = 5;          // 设置水平间距
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        
        _collectionView =[[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor greenColor];
    }
    return _collectionView;
}


@end
