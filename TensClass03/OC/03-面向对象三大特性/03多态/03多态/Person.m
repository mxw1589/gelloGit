//
//  Person.m
//  03多态
//
//  Created by qinglinfu on 15/12/25.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "Person.h"

@implementation Person

//- (void)usePrinter_bw:(BWPrinter *)bwPrinter
//{
//    
//}
//- (void)usePrinter_color:(ColorPrinter *)bwPrinter
//{
//    
//}
//- (void)usePrinter_3d:(My3DPrinter *)bwPrinter
//{
//    
//}


- (void)usePrinter:(Printer *)printer
{
    [printer print];
}


@end


