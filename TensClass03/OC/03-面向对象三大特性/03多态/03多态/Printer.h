//
//  Printer.h
//  03多态
//
//  Created by qinglinfu on 15/12/25.
//  Copyright © 2015年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Printer : NSObject {
    
    NSString *_brand;
    NSString *_price;
}

- (void)print;

@end
