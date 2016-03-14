//
//  Student.h
//  05实例方法
//
//  Created by qinglinfu on 15/12/22.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject {
    
    @public    
    NSString *_name;
    int _age;
    NSString *_sex;
}

// 实例方法，用 - 号表示。必须使用实例对象调用
- (void)readBook:(NSString *)bookName;


/* 输入C和OC的成绩：
    c:  c的成绩
    oc: oc的成绩
 */

// 包含两个参数的实例方法
// 方法名称：inputScoreC: withOC:
// c、oc 是方法的参数
- (void)inputScoreC:(float)c withOC:(float)oc;

// 使用实例方法给实例变量赋值
- (void)setName:(NSString *)name withAge:(int)age withSex:(NSString *)sex;

// 使用实例方法给外部返回属性的值（取值）
- (NSString *)name;


// .h文件：用于声明属性和方法，外部调用的方法必须在.h中声明，否则无法调用。

@end



