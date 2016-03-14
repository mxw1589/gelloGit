//
//  PeopleViewController.m
//  第五课作业
//
//  Created by Chen on 16/1/19.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "PeopleViewController.h"
#import "IntroduceViewController.h"

@interface PeopleViewController ()

@end

@implementation PeopleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"人物";
    
    NSArray *imageNames = @[@"jobs.jpg", @"jonathan.jpg"];
    
    CGFloat edge = 15;
    CGFloat width = (CGRectGetWidth(self.view.frame)-edge*3)/2;
    
    for (int i=0; i<2; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        button.frame = CGRectMake(15+i*(width+edge), 30, width, 80);
        UIImage *image = [UIImage imageNamed:imageNames[i]];
        [button setImage:image forState:UIControlStateNormal];
        [button addTarget:self
                   action:@selector(buttonOnClicked:)
         forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonOnClicked:(UIButton *)sender {
    
    IntroduceViewController *introduce = [[IntroduceViewController alloc] init];
    
    if (sender.tag) {
        introduce.imageName = @"jonathan.jpg";
        introduce.introduce = @"jonathan";
    }
    else {
        introduce.imageName = @"jobs.jpg";
        introduce.introduce = @"jobs";
    }
    [self.navigationController pushViewController:introduce animated:YES];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
