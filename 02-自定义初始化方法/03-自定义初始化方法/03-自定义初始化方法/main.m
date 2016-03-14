//
//  main.m
//  03-自定义初始化方法
//
//  Created by qinglinfu on 15/12/23.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Car *car = [[Car alloc] init];
        
        NSLog(@"brand:%@, color:%@, price:%.2f",car.brand,car.color, car.price);
        
        Car *car1 = [[Car alloc] initBrand:@"宝马"];
        NSLog(@"brand:%@, color:%@, price:%.2f",car1.brand,car1.color, car1.price);
        
        
        Car *car2 = [[Car alloc] initBrand:@"现代" withColor:@"白色" withPrice:120000];
        NSLog(@"brand:%@, color:%@, price:%.2f",car2.brand,car2.color, car2.price);

    }
    return 0;
}
