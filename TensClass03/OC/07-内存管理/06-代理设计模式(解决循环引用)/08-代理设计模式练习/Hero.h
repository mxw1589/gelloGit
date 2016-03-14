//
//  Hero.h
//  08-代理设计模式练习
//
//  Created by qinglinfu on 15/12/31.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HeroDelegate <NSObject>
- (void)addRedValue;
- (void)addBlueValue;
@end

@interface Hero : NSObject {
    
//    NSInteger _redValue;
//    NSInteger _blueValue;
    
//    id<HeroDelegate>_delegate;
}

@property(nonatomic, assign)NSInteger redValue;
@property(nonatomic, assign)NSInteger blueValue;

// 将代理方设为 weak 弱引用。
@property(nonatomic, weak)id<HeroDelegate>delegate;

@end



