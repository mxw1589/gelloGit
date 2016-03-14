//
//  ViewController.m
//  UIControl
//
//  Created by Chen on 16/1/12.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self createButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createControl {
    UIControl *control = [[UIControl alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    control.backgroundColor = [UIColor yellowColor];
    
    control.enabled = YES; // 控件是否可用
    control.selected = YES; // 按钮是否被选择
    control.highlighted =YES; // 按钮是否高亮显示
    
    /** 控件的几种状态
     UIControlStateNormal      //正常,处于活动状态,但是当前并未使用
     UIControlStateHighlighted //表示正被按住或正被使用
     UIControlStateDisabled    //表示未启用且无法使用
     UIControlStateSelected    //表示控件当前已被选中
     */
    //    control.state = ;
    
    
    /** 绑定常用的事件
     UIControlEventTouchDown    手指按下去就执行
     UIControlEventTouchDragInside  手指按下去并拖动
     UIControlEventTouchDragOutside 手指按下去后并手动到控外面一段距离后调用
     UIControlEventTouchUpInside    手指按下去并弹起
     UIControlEventTouchUpOutside   手指按下去并移动到控件外面一段距离后调用
     UIControlEventTouchCancel      手指按下去后,被系统事件取消
     UIControlEventValueChanged
     */
    [control addTarget:self
                action:@selector(controlOnClicked:)
      forControlEvents:UIControlEventTouchCancel];
    
    [self.view addSubview:control];
}

- (void)createButton {
    
    /**  UIButtonType
     UIButtonTypeCustom = 0,                         // no button type
     UIButtonTypeSystem NS_ENUM_AVAILABLE_IOS(7_0),  // standard system button
     
     UIButtonTypeDetailDisclosure,
     UIButtonTypeInfoLight,
     UIButtonTypeInfoDark,
     UIButtonTypeContactAdd,
     */
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 200, 100);
    
    button.backgroundColor = [UIColor greenColor];      // 设置背景颜色
    
    
    // 设置title
    [button setTitle:@"一个大按钮" forState:UIControlStateNormal];   // 设置默认的title
    [button setTitle:@"被戳了一下的按钮" forState:UIControlStateSelected];   // 设置选中后的title
    [button setTitle:@"放点吧,别戳了" forState:UIControlStateHighlighted];  // 按钮按下去的titel
    
    [button setTitle:@"点不了了" forState:UIControlStateDisabled];  // 按钮按下去的titel
    
//    [button setTitleColor:nil forState:nil];  // 设置title的颜色
    
    
    [button setImage:[UIImage imageNamed:@"button1"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"button2"] forState:UIControlStateSelected];
    
    [button addTarget:self action:@selector(controlOnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


- (void)controlOnClicked:(UIControl *)control {
    
    control.selected = !control.selected;
    

    NSLog(@"%s", __func__);
}

@end
