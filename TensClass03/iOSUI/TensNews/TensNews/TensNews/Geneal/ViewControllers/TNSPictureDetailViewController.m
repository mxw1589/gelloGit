//
//  TNSPictureDetailViewController.m
//  TensNews
//
//  Created by Chen on 16/2/1.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "TNSPictureDetailViewController.h"

#import "TNSPictureDetailModel.h"
#import "TNSPictureBrowerView.h"

@interface TNSPictureDetailViewController ()

@property (weak, nonatomic) IBOutlet TNSPictureBrowerView *pictureBrowerView;

 /**
 *  返回到上一个控制器
 */
- (IBAction)popToLastViewController:(id)sender;


@end

@implementation TNSPictureDetailViewController


#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    // 设置导航栏透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Alpha.png"] forBarMetrics:UIBarMetricsDefault];

    self.pictureBrowerView.model = self.model;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hiddenNavigationBar) name:kHiddenNavigationbarNotification object:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.pictureBrowerView refreshScrollView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBActions

- (void)hiddenNavigationBar {
    
    if (self.navigationController.isNavigationBarHidden) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        self.pictureBrowerView.alphaView.hidden = NO;
    }
    else {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        self.pictureBrowerView.alphaView.hidden = YES;
    }
}


#pragma mark - IBActions

- (IBAction)popToLastViewController:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
