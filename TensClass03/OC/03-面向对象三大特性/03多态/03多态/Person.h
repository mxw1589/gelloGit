//
//  Person.h
//  03多态
//
//  Created by qinglinfu on 15/12/25.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import "Printer.h"
//#import "BWPrinter.h"
//#import "ColorPrinter.h"
//#import "My3DPrinter.h"

@interface Person : Printer

- (void)usePrinter:(Printer *)printer;

//- (void)usePrinter_bw:(BWPrinter *)bwPrinter;
//- (void)usePrinter_color:(ColorPrinter *)bwPrinter;
//- (void)usePrinter_3d:(My3DPrinter *)bwPrinter;


@end
