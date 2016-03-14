//
//  main.m
//  02-继承
//
//  Created by qinglinfu on 15/12/25.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cat.h"
#import "Fish.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Cat *cat = [[Cat alloc] init];
        cat->_animalName = @"猫";
        [cat eat];
        
        [cat testMethod_self];
        [cat testMethod_super];
        
        Fish *fish = [[Fish alloc] init];
        fish->_categery = @"食草鱼类";
        [fish eat];
        
//        fish->_color
        
    
    }
    return 0;
}
