//
//  BaseViewController.m
//  TensNews
//
//  Created by Chen on 16/1/27.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "TNSBaseViewController.h"
#import "MBProgressHUD.h"

@interface TNSBaseViewController () {
    MBProgressHUD *_HUD;
}

@end

@implementation TNSBaseViewController


#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 不自动调整scrollView的边距
    self.automaticallyAdjustsScrollViewInsets = NO;

    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Public

- (void)showLoading {
    
    _HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:_HUD];
    _HUD.labelText = @"Loading";
    [_HUD show:YES];
}

- (void)hiddenLoading {
    [_HUD hide:YES];
}

@end
