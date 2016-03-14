//
//  ViewController.m
//  01-Block_Demo01
//
//  Created by qinglinfu on 16/2/19.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int sum = function(100, 200);
    NSLog(@"sum = %d",sum);
    
    
// --------------------block简单使用-----------------------
    int a = 100;
    
    
    // 返回值类型 int ,名称 myBlock 参数：int a,b, 主体：{return a + b;}
    int (^myBlock)(int a, int b) = ^(int a, int b){
      
        return a + b;
    };
    int s = myBlock(10,20); // 调用block
    NSLog(@"s = %d",s);
    
    
    // 没有返回值的block
    void (^block)(int a) = ^(int a){
       
        NSLog(@"a = %d",a);
    };
    block(2000);
    
    
    // 没有参数的block
    void (^testBlock)() = ^{
       
        NSLog(@"这是一个没有参数和返回值的block");
    };
    
    testBlock();
    
}

// c语言的函数
int function(int a, int b) {
    
    return  a + b;
}

@end
