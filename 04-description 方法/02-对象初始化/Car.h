//
//  Car.h
//  02-对象初始化
//
//  Created by qinglinfu on 15/12/23.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject {
    
    NSString *_brand;
    NSString *_color;
    float _price;
}

- (NSString *)brand;

- (NSString *)color;

- (float)price;



@end
