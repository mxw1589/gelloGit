//
//  TensSchool.h
//  05-协议
//
//  Created by qinglinfu on 15/12/30.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

// 在一个类中申明协议方法，这些方法由别的类实现，自己不实现。
@protocol TensProtocol <NSObject>

@required // 定义必须实现的协议方法（默认是必须实现的）
- (void)doHomeWork;
- (void)goHome;

@optional // 定义可选实现的协议方法
- (void)eat;

@end


@interface TensSchool : NSObject

@end
