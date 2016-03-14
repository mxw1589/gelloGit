//
//  ViewController.m
//  04-block(事件处理)
//
//  Created by qinglinfu on 16/2/19.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import "TensButton.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet TensButton *tensButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    /*
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(0, 200, 320, 50);
    [button setTitle:@"点击" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
     */
 
    /*
    TensButton *button = [TensButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 200, 320, 50);
    [button setTitle:@"点击" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [button buttonEvent:UIControlEventTouchUpInside handel:^{
       
        NSLog(@"点击了");
    }];
    
    [self.view addSubview:button];
    */
    
    [self.tensButton buttonEvent:UIControlEventTouchUpInside handler:^{
       
        NSLog(@"点击了。。。。");
    }];
    
    
//    UIAlertAction *action = [UIAlertAction actionWithTitle:@"提示" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        
//        
//    }];
    
}


@end
