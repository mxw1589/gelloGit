//
//  main.m
//  02-对象初始化
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
        
        NSLog(@"brand:%@ ,color:%@, price: %.2f",car.brand, car.color,car.price);
        
    }
    return 0;
}
