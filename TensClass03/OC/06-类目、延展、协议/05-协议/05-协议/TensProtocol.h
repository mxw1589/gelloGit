//
//  TensProtocol.h
//  05-协议
//
//  Created by qinglinfu on 15/12/30.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
  协议：
    1、定义的一组方法的声明。
    2、这些方法协议本身不实现而是由别的类去实现。
    3、实现协议的类必须签订协议 <协议名称>。
    4、协议方法有必须实现@required和可选@optional实现两种。
    5、一个协议可以由多个类实现。 
    6、一个类可以实现多个协议。
 */


// 定义一组协议方法 TensProtocol：协议名称
@protocol TensProtocol <NSObject>

// 协议的方法
- (void)doHomeWork;
- (void)goHome;
- (void)eat;

@end




