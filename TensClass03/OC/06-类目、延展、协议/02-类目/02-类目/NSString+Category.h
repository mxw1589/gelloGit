//
//  NSString+Category.h
//  02-类目
//
//  Created by qinglinfu on 15/12/30.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category) {
    
//    NSString *_testVar; // 类目不能对属性的扩展
}

// 类目：用于对原有类的方法的扩展
- (BOOL)veriryEmial;

- (BOOL)isPhoneNumber;


// 扩展的方法不要跟原有方法相同，如果相同就会覆盖原来方法。
- (instancetype)init;

@end
