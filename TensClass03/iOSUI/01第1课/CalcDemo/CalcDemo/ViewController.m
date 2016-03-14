//
//  ViewController.m
//  CalcDemo
//
//  Created by Chen on 16/1/9.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;


@property (assign, nonatomic) long count;
@property (assign, nonatomic) NSInteger calcButtonTag;

@end


@implementation ViewController


#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
 
    /** 步骤
     1. 先输入第一个数
     2. 处理加减乘除的符号
     3. 计算结果并显示
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBActions

- (IBAction)numberButtonOnCliked:(UIButton *)sender {
    
    // 135
    // 1*10 3
    
    self.count = self.count*10 + sender.tag;
}

- (IBAction)calcButtonOnClicked:(UIButton *)sender {
    self.calcButtonTag = sender.tag;
    
    // 把上一次的count保存在label的tag上,需要使用时再取出来
    self.resultLabel.tag = self.count;
    self.resultLabel.text = [sender currentTitle];
    _count = 0;
}

- (IBAction)resultButtonOnClicked:(UIButton *)sender {
    
    switch (self.calcButtonTag) {
        case 100: {
            self.count = self.count + self.resultLabel.tag;
            break;
        }
        case 200: {
            self.count = self.resultLabel.tag - self.count;
            break;
        }
        case 300:{
            self.count = self.count * self.resultLabel.tag;
            break;
        }
        case 400: {
            self.count = self.resultLabel.tag / self.count;
            break;
        }
    }
}


#pragma mark - Custom Accessors

- (void)setCount:(long)count {
    _count = count;
    self.resultLabel.text = [@(_count) stringValue];
}

@end
