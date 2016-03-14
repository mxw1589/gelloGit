//
//  Car.h
//  03课堂练习一
//
//  Created by qinglinfu on 15/12/22.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject {
    
    NSString *brand;     // 品牌
    NSString *color;     // 颜色
    float price;         // 价格
    NSString *carNumber; // 车牌号
}

- (void)run;

- (float)speed:(float)value;

@end
