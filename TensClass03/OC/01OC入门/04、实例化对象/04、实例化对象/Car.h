//
//  Car.h
//  04、实例化对象
//
//  Created by qinglinfu on 15/12/22.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject {
    
    NSString *_brand;
    NSString *color;
    float price;
}

- (void)speed;

@end
