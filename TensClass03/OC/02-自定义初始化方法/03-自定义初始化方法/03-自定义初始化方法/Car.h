//
//  Car.h
//  03-自定义初始化方法
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

// 自定义初始化方法
- (instancetype)initBrand:(NSString *)brand;

// 自定义初始化方法：以init开头，后面的单词首字母大写。
- (instancetype)initBrand:(NSString *)brand withColor:(NSString *)color withPrice:(float)price;



@end
