//
//  Person.h
//  05-协议
//
//  Created by qinglinfu on 15/12/30.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "TensProtocol.h"
#import "TensSchool.h"

// 一个协议方法可以由多个类实现
@interface Person : NSObject <TensProtocol>

@end
