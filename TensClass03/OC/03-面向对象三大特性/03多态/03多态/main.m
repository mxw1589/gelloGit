//
//  main.m
//  03多态
//
//  Created by qinglinfu on 15/12/25.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BWPrinter.h"
#import "ColorPrinter.h"
#import "My3DPrinter.h"
#include "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        /* 多态
            1、也叫方法的动态绑定
            2、向上类型转换。
            3、子类创建的对象可以由父类创建的指针指向。
        */
        
        /*
         存在多态性体现在：
            1、类的继承
            2、方法的重写
            3、父类引用指向子类对象
         */
        
        Printer *p1 = [[BWPrinter alloc] init];
        [p1 print]; // [runtime ]
        
        Printer *p2  = [[ColorPrinter alloc] init];
        [p2 print];
        
        Printer *p3 = [[My3DPrinter alloc] init];
        [p3 print];
        
        Person *per = [[Person alloc] init];
        [per usePrinter:p3];
    }
    return 0;
}



