//
//  Book.h
//  02-KVC
//
//  Created by qinglinfu on 16/1/4.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject {
    
    NSString *_bookName;
    float _price;
}

- (float)price;
- (NSString *)bookName;

@end
