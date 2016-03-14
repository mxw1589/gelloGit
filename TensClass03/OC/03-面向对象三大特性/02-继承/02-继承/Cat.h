//
//  Cat.h
//  02-继承
//
//  Created by qinglinfu on 15/12/25.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"

/* Animal是继承的父类
 
    1、继承父类的(非私有)属性和(非私有)方法。
    2、子类可以直接访问继承下来的属性和方法。
    3、OC是单继承只能直接继承一个类。
    4、使用继承可以达到代码的重用，减少冗余代码。
 */

@interface Cat : Animal {
    
    NSString *color;
}

- (void)testMethod_super;
- (void)testMethod_self;

@end
