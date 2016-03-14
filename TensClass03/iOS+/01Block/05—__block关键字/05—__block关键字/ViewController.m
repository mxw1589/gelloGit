//
//  ViewController.m
//  05—__block关键字
//
//  Created by qinglinfu on 16/2/19.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    int _value;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int value = 100;
    _value = 300;
    
    __block int number = 200;
    // block内使用外部的局部变量
    int (^sumBlock)(int a, int b) = ^(int a, int b){
        
        int c = a + b + value;
        number += 10; // block 对局部变量做修改必须使用__block关键字修饰变量
        return c;
    };
    
    NSLog(@"sum = %d",sumBlock(10,20));
    
    
    // 如果block内部对全局变量修改就不需要使用__block修饰了
    int (^block)(int a) = ^(int a) {
        
        _value += 100;
        return a + _value;
    };
    
    NSLog(@"block:%d",block(1000));
    

// block内部使用局部变量，会将变量值拷贝一份到block中，那么block的变量就不再是原来的变量，变成了原来变量的一个副本，所以外部修改不会影响block内部的值。
    int num = 100;
    int (^testBlock)(int v) = ^(int v){
        
        return v + num;
    };
    num = 200;
    NSLog(@"testBlock: %d",testBlock(50));
    
// 使用了__block修饰的变量,block内部使用时不会进行拷贝，使用的还是同一个变量，所以在外部修改后会影响block内部的值。
    __block int num_ = 100;
    int (^tsBlock)(int v) = ^(int v){
        
        return v + num_;
    };
    num_ = 200;
    NSLog(@"tsBlock:%d",tsBlock(50));
}



@end
