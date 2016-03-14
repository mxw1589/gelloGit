//
//  ViewController.m
//  02-Block_(作为参数和返回值)
//
//  Created by qinglinfu on 16/2/19.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"

// 使用typedef定义block
typedef void(^TestBlock)(int a, int b);


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int (^block)(int a) = ^(int a) {
        return a;
    };
    
    
    [self method:100];
    
    // 调用方法实现block,作为参数传递
    [self blockMethod:^(int a) {
        
        NSLog(@"c = %d",a + 200);
    }];
    
    // 接收返回的block
    void(^rBlock)(int) = [self returnBlock];
    rBlock(3000);
    
    
//------------------typedef定义block-------------------
    
    TestBlock tBlock = ^(int a, int b) {
        
        NSLog(@"a + b = %d", a + b);
    };
    tBlock(1000,20000);
    
    
    [self testBlockMethod:^(int a, int b) {
       
        NSLog(@"a - b = %d",a - b);
    }];
    
    TestBlock tsBlocl = [self returnTestBlock];
    tsBlocl(40,20);
}

// 把block作为方法的参数
- (void)blockMethod:(void (^)(int a)) block
{
    block(100);
}

// block作为返回值
- (void(^)(int a))returnBlock {
    
    void (^myBlock)(int a) = ^(int a){
       
        NSLog(@"这是返回的block，a = %d",a);
    };
    return myBlock;
};


- (void)testBlockMethod:(TestBlock)block
{
    block(200,4000);
}

- (TestBlock)returnTestBlock{
    
    return ^(int a, int b) {
      
        NSLog(@"a * b = %d",a * b);
    };
}

- (void)method:(int)a {
    
    NSLog(@"a = %d",a);
}


@end
