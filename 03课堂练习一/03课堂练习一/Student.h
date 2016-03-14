//
//  Student.h
//  03课堂练习一
//
//  Created by qinglinfu on 15/12/22.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/*代码规范
 
 1、类名：每个单词首字母大写，例如：StudentClass
 2、变量：首字母小写后面的单词首字母大写。（驼峰标示）studentName
 3、方法名称：和变量名称一样（驼峰标示）
 4、属性（实例变量）：使用下划线开头。
 5、每个方法至少有一行间隔
 */

@interface Student : NSObject {
    
    NSString *_name;
    NSString *_stuID;
    NSString *_sex;
    NSInteger _age;
}

- (void)learnOC;

- (NSString *)read:(NSString *)bookName;


@end



