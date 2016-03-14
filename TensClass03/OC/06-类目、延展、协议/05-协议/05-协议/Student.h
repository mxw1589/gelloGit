//
//  Student.h
//  05-协议
//
//  Created by qinglinfu on 15/12/30.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "TensProtocol.h"
#import "TensSchool.h"
#import "College.h"

// 一个类可以实现多个协议：<TensProtocol,CollegeProtocol>
@interface Student : NSObject <TensProtocol,CollegeProtocol> // 表示这个类要实现TensProtocol协议方法（签署协议）

@end
